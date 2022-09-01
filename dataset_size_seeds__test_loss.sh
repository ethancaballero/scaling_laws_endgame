base=100000000
hundred=100
for i in {1..1000}
do
   base_seed=$(($hundred * $i))
   pre=$(($base + $base_seed))

   size192=1
   seed192=$(expr $pre + $size192)
   sbatch --time=0:8:0 --gres=gpu:1 job_cc_cedar.sh --data_steps=99999999999999 --seed=$seed192 --train_set_size=192 --batch_size_train=192 --wandb_tag=math__d_axis__digits4__lr0001 --iters_per_eval=16 --test_set_size=10000 --n_digit=4 --lr=.0001

   size256=2
   seed256=$(expr $pre + $size256)
   sbatch --time=0:8:0 --gres=gpu:1 job_cc_cedar.sh --data_steps=99999999999999 --seed=$seed256 --train_set_size=256 --batch_size_train=256 --wandb_tag=math__d_axis__digits4__lr0001 --iters_per_eval=16 --test_set_size=10000 --n_digit=4 --lr=.0001

   size320=3
   seed320=$(expr $pre + $size320)
   sbatch --time=0:8:0 --gres=gpu:1 job_cc_cedar.sh --data_steps=99999999999999 --seed=$seed320 --train_set_size=320 --batch_size_train=320 --wandb_tag=math__d_axis__digits4__lr0001 --iters_per_eval=16 --test_set_size=10000 --n_digit=4 --lr=.0001

   size384=4
   seed384=$(expr $pre + $size384)
   sbatch --time=0:8:0 --gres=gpu:1 job_cc_cedar.sh --data_steps=99999999999999 --seed=$seed384 --train_set_size=384 --batch_size_train=384 --wandb_tag=math__d_axis__digits4__lr0001 --iters_per_eval=16 --test_set_size=10000 --n_digit=4 --lr=.0001

   size448=5
   seed448=$(expr $pre + $size448)
   sbatch --time=0:8:0 --gres=gpu:1 job_cc_cedar.sh --data_steps=99999999999999 --seed=$seed448 --train_set_size=448 --batch_size_train=448 --wandb_tag=math__d_axis__digits4__lr0001 --iters_per_eval=16 --test_set_size=10000 --n_digit=4 --lr=.0001

   size480=6
   seed480=$(expr $pre + $size480)
   sbatch --time=0:8:0 --gres=gpu:1 job_cc_cedar.sh --data_steps=99999999999999 --seed=$seed480 --train_set_size=480 --batch_size_train=480 --wandb_tag=math__d_axis__digits4__lr0001 --iters_per_eval=16 --test_set_size=10000 --n_digit=4 --lr=.0001
done
