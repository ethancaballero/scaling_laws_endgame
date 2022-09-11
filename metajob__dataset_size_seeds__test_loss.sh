base=437623321
hundred=1000
for i in {1..125}
do
   base_seed=$(($hundred * $i))
   pre=$(($base + $base_seed))

   size192=100
   seed192=$(expr $pre + $size192)
   sbatch --time=0:30:0 --gres=gpu:1 job_cc_cedar.sh --data_steps=650000 --seed=$seed192 --train_set_size=192 --batch_size_train=192 --wandb_tag=math__d_axis__digits4__lr0001 --iters_per_eval=16 --test_set_size=10000 --n_digit=4 --lr=.0001 --dropout_prob=0.0

   size256=200
   seed256=$(expr $pre + $size256)
   sbatch --time=0:30:0 --gres=gpu:1 job_cc_cedar.sh --data_steps=650000 --seed=$seed256 --train_set_size=256 --batch_size_train=256 --wandb_tag=math__d_axis__digits4__lr0001 --iters_per_eval=16 --test_set_size=10000 --n_digit=4 --lr=.0001 --dropout_prob=0.0

   size320=300
   seed320=$(expr $pre + $size320)
   sbatch --time=0:30:0 --gres=gpu:1 job_cc_cedar.sh --data_steps=650000 --seed=$seed320 --train_set_size=320 --batch_size_train=320 --wandb_tag=math__d_axis__digits4__lr0001 --iters_per_eval=16 --test_set_size=10000 --n_digit=4 --lr=.0001 --dropout_prob=0.0

   size384=400
   seed384=$(expr $pre + $size384)
   sbatch --time=0:30:0 --gres=gpu:1 job_cc_cedar.sh --data_steps=650000 --seed=$seed384 --train_set_size=384 --batch_size_train=384 --wandb_tag=math__d_axis__digits4__lr0001 --iters_per_eval=16 --test_set_size=10000 --n_digit=4 --lr=.0001 --dropout_prob=0.0

   size448=500
   seed448=$(expr $pre + $size448)
   sbatch --time=0:30:0 --gres=gpu:1 job_cc_cedar.sh --data_steps=650000 --seed=$seed448 --train_set_size=448 --batch_size_train=448 --wandb_tag=math__d_axis__digits4__lr0001 --iters_per_eval=16 --test_set_size=10000 --n_digit=4 --lr=.0001 --dropout_prob=0.0

   size480=600
   seed480=$(expr $pre + $size480)
   sbatch --time=0:30:0 --gres=gpu:1 job_cc_cedar.sh --data_steps=650000 --seed=$seed480 --train_set_size=480 --batch_size_train=480 --wandb_tag=math__d_axis__digits4__lr0001 --iters_per_eval=16 --test_set_size=10000 --n_digit=4 --lr=.0001 --dropout_prob=0.0

   size512=700
   seed512=$(expr $pre + $size512)
   sbatch --time=0:30:0 --gres=gpu:1 job_cc_cedar.sh --data_steps=650000 --seed=$seed512 --train_set_size=512 --batch_size_train=512 --wandb_tag=math__d_axis__digits4__lr0001 --iters_per_eval=16 --test_set_size=10000 --n_digit=4 --lr=.0001 --dropout_prob=0.0

   size544=800
   seed544=$(expr $pre + $size544)
   sbatch --time=0:30:0 --gres=gpu:1 job_cc_cedar.sh --data_steps=650000 --seed=$seed544 --train_set_size=544 --batch_size_train=544 --wandb_tag=math__d_axis__digits4__lr0001 --iters_per_eval=16 --test_set_size=10000 --n_digit=4 --lr=.0001 --dropout_prob=0.0
done
