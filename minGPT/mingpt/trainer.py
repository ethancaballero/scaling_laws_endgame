"""
Simple training loop; Boilerplate that could apply to any arbitrary neural network,
so nothing in this file really has anything to do with GPT specifically.
"""

import math
import logging

from tqdm import tqdm
import numpy as np

import torch
import torch.optim as optim
from torch.optim.lr_scheduler import LambdaLR
from torch.utils.data.dataloader import DataLoader

import wandb

from mingpt.utils import sample

logger = logging.getLogger(__name__)

class TrainerConfig:
    # optimization parameters
    max_epochs = 10
    batch_size = 64
    learning_rate = 3e-4
    betas = (0.9, 0.95)
    grad_norm_clip = 1.0
    weight_decay = 0.1 # only applied on matmul weights
    # learning rate decay params: linear warmup followed by cosine decay to 10% of original
    lr_decay = False
    warmup_tokens = 375e6 # these two numbers come from the GPT-3 paper, but may not be good defaults elsewhere
    final_tokens = 260e9 # (at what point we reach 10% of original LR)
    # checkpoint settings
    ckpt_path = None
    num_workers = 0 # for DataLoader

    def __init__(self, **kwargs):
        for k,v in kwargs.items():
            setattr(self, k, v)

class Trainer:

    def __init__(self, model, train_dataset, test_dataset, config, flags):
        self.model = model
        self.train_dataset = train_dataset
        self.test_dataset = test_dataset
        self.config = config
        self.flags = flags
        self.train_it = 0

        # take over whatever gpus are on the system
        self.device = 'cpu'
        if torch.cuda.is_available():
            self.device = torch.cuda.current_device()
            #self.model = torch.nn.DataParallel(self.model).to(self.device)
            self.model = self.model.to(self.device)

        self.loader_train = DataLoader(self.train_dataset, shuffle=True, pin_memory=True,
                        batch_size=flags.batch_size_train,
                        num_workers=config.num_workers,
                        drop_last=self.flags.drop_last)

        self.loader_test = DataLoader(self.test_dataset, shuffle=False, pin_memory=True,
                                batch_size=flags.batch_size_eval,
                                num_workers=config.num_workers)

    def give_exam(self, dataset, batch_size=32, max_batches=-1):
        
        results = []
        loader = DataLoader(dataset, batch_size=batch_size)
        for b, (x, y) in enumerate(loader):
            #x = x.to(trainer.device)
            x = x.to(self.device)
            d1d2 = x[:, :self.flags.n_digit*2]
            d1d2d3 = sample(self.model, d1d2, self.flags.n_digit+1)
            d3 = d1d2d3[:, -(self.flags.n_digit+1):]
            #factors = torch.tensor([[10**i for i in range(self.flags.n_digit+1)][::-1]]).to(trainer.device)
            factors = torch.tensor([[10**i for i in range(self.flags.n_digit+1)][::-1]]).to(self.device)
            # decode the integers from individual digits
            d1i = (d1d2[:,:self.flags.n_digit] * factors[:,1:]).sum(1)
            d2i = (d1d2[:,self.flags.n_digit:self.flags.n_digit*2] * factors[:,1:]).sum(1)
            d3i_pred = (d3 * factors).sum(1)
            d3i_gt = d1i + d2i
            correct = (d3i_pred == d3i_gt).cpu() # Software 1.0 vs. Software 2.0 fight RIGHT on this line, lol
            for i in range(x.size(0)):
                results.append(int(correct[i]))
                judge = 'YEP!!!' if correct[i] else 'NOPE'
                """
                if not correct[i]:
                    print("GPT claims that %03d + %03d = %03d (gt is %03d; %s)" 
                        % (d1i[i], d2i[i], d3i_pred[i], d3i_gt[i], judge))
                #"""
            
            if max_batches >= 0 and b+1 >= max_batches:
                break

        print("final score: %d/%d = %.2f%% correct" % (np.sum(results), len(results), 100*np.mean(results)))

        return 100*np.mean(results)

    def save_checkpoint(self):
        # DataParallel wrappers keep raw model object in .module attribute
        raw_model = self.model.module if hasattr(self.model, "module") else self.model
        logger.info("saving %s", self.config.ckpt_path)
        torch.save(raw_model.state_dict(), self.config.ckpt_path)

    def train(self):
        model, config = self.model, self.config
        raw_model = model.module if hasattr(self.model, "module") else model
        optimizer = raw_model.configure_optimizers(config)

        #wandb.init(project=self.flags.wandb_project, reinit=True, tags=[self.flags.wandb_tag])
        wandb.init(settings=wandb.Settings(start_method="thread"), project=self.flags.wandb_project, reinit=True, tags=[self.flags.wandb_tag])
        wandb.config.update(self.flags)
        wandb.config.update({"params": sum(p.numel() for p in self.model.parameters()), "embedding params": self.train_dataset.vocab_size * self.flags.dmodel})

        def run_epoch(split):
            is_train = split == 'train'
            model.train(is_train)
            data = self.train_dataset if is_train else self.test_dataset
            """
            loader = DataLoader(data, shuffle=True, pin_memory=True,
                                batch_size=config.batch_size,
                                num_workers=config.num_workers)
                                #"""
            if is_train:
                loader = self.loader_train
            else:
                loader = self.loader_test
            losses = []
            pbar = tqdm(enumerate(loader), total=len(loader)) if is_train else enumerate(loader)
            for it, (x, y) in pbar:

                if is_train and (it % self.flags.iters_per_eval == 0):
                    run_epoch('test')
                if is_train:
                    self.train_it += 1

                # place data on the correct device
                x = x.to(self.device)
                y = y.to(self.device)

                # forward the model
                with torch.set_grad_enabled(is_train):
                    logits, loss = model(x, y)
                    loss = loss.mean() # collapse all losses if they are scattered on multiple gpus
                    losses.append(loss.item())

                if is_train:

                    # backprop and update the parameters
                    model.zero_grad()
                    loss.backward()
                    torch.nn.utils.clip_grad_norm_(model.parameters(), config.grad_norm_clip)
                    optimizer.step()

                    # decay the learning rate based on our progress
                    if config.lr_decay:
                        self.tokens += (y >= 0).sum() # number of tokens processed this step (i.e. label is not -100)
                        if self.tokens < config.warmup_tokens:
                            # linear warmup
                            lr_mult = float(self.tokens) / float(max(1, config.warmup_tokens))
                        else:
                            # cosine learning rate decay
                            progress = float(self.tokens - config.warmup_tokens) / float(max(1, config.final_tokens - config.warmup_tokens))
                            lr_mult = max(0.1, 0.5 * (1.0 + math.cos(math.pi * progress)))
                        lr = config.learning_rate * lr_mult
                        for param_group in optimizer.param_groups:
                            param_group['lr'] = lr
                    else:
                        lr = config.learning_rate

                    # report progress
                    pbar.set_description(f"epoch {epoch+1} iter {it}: train loss {loss.item():.5f}. lr {lr:e}")

                    if self.train_it >= self.flags.data_steps:
                        break

            if is_train:
                return self.train_it

            elif not is_train:
                test_loss = float(np.mean(losses))

                test_accuracy = self.give_exam(self.test_dataset, batch_size=self.flags.batch_size_eval, max_batches=-1)

                logger.info("test loss: %f", test_loss)

                log_dict = {}
                log_dict.update({'eval_loss': test_loss,
                                 'eval_accuracy': test_accuracy,
                                })
                # makes wandb steps equal to number of samples trained on
                wandb.log(log_dict, step=self.train_it*self.flags.batch_size_train)
                return test_loss
            
            else:
                error

        best_loss = float('inf')
        self.tokens = 0 # counter used for learning rate decay
        iters = 0
        for epoch in range(config.max_epochs):

            iters = run_epoch('train')
            if self.test_dataset is not None:
                test_loss = run_epoch('test')

            # supports early stopping based on the test loss, or just save always if no test set is provided
            good_model = self.test_dataset is None or test_loss < best_loss
            if self.config.ckpt_path is not None and good_model:
                best_loss = test_loss
                self.save_checkpoint()

            print("data_steps: ", iters * self.flags.batch_size_train)
            print("self.flags.data_steps: ", self.flags.data_steps)
            if (iters * self.flags.batch_size_train) >= self.flags.data_steps:
                break
