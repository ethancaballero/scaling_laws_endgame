base=501664156
hundred=2000
for i in {1..333}
do
   base_seed=$(($hundred * $i))
   pre=$(($base + $base_seed))

   size864=100
   seed864=$(expr $pre + $size864)
   sbatch --time=0:59:0 --gres=gpu:1 job_cc_cedar.sh --data_steps=2800000 --seed=$seed864 --train_set_size=864 --batch_size_train=864 --wandb_tag=math__d_axis__digits4__lr0001 --iters_per_eval=16 --test_set_size=10000 --n_digit=4 --lr=.0001 --dropout_prob=0.0

   size928=200
   seed928=$(expr $pre + $size928)
   sbatch --time=0:59:0 --gres=gpu:1 job_cc_cedar.sh --data_steps=2800000 --seed=$seed928 --train_set_size=928 --batch_size_train=928 --wandb_tag=math__d_axis__digits4__lr0001 --iters_per_eval=16 --test_set_size=10000 --n_digit=4 --lr=.0001 --dropout_prob=0.0

   size992=300
   seed992=$(expr $pre + $size992)
   sbatch --time=0:59:0 --gres=gpu:1 job_cc_cedar.sh --data_steps=2800000 --seed=$seed992 --train_set_size=992 --batch_size_train=992 --wandb_tag=math__d_axis__digits4__lr0001 --iters_per_eval=16 --test_set_size=10000 --n_digit=4 --lr=.0001 --dropout_prob=0.0
done
