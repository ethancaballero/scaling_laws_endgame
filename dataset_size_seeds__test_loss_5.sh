base=153920166
hundred=2000
for i in {1..333}
do
   base_seed=$(($hundred * $i))
   pre=$(($base + $base_seed))

   size1250=100
   seed1250=$(expr $pre + $size1250)
   sbatch --time=1:29:0 --gres=gpu:1 job_cc_cedar.sh --data_steps=6000000 --seed=$seed1250 --train_set_size=1250 --batch_size_train=1250 --wandb_tag=math__d_axis__digits4__lr0001 --iters_per_eval=16 --test_set_size=10000 --n_digit=4 --lr=.0001 --dropout_prob=0.0

   size1500=200
   seed1500=$(expr $pre + $size1500)
   sbatch --time=1:29:0 --gres=gpu:1 job_cc_cedar.sh --data_steps=6000000 --seed=$seed1500 --train_set_size=1500 --batch_size_train=1500 --wandb_tag=math__d_axis__digits4__lr0001 --iters_per_eval=16 --test_set_size=10000 --n_digit=4 --lr=.0001 --dropout_prob=0.0

   size1750=300
   seed1750=$(expr $pre + $size1750)
   sbatch --time=1:29:0 --gres=gpu:1 job_cc_cedar.sh --data_steps=6000000 --seed=$seed1750 --train_set_size=1750 --batch_size_train=1750 --wandb_tag=math__d_axis__digits4__lr0001 --iters_per_eval=16 --test_set_size=10000 --n_digit=4 --lr=.0001 --dropout_prob=0.0

   size2000=400
   seed2000=$(expr $pre + $size2000)
   sbatch --time=1:29:0 --gres=gpu:1 job_cc_cedar.sh --data_steps=6000000 --seed=$seed2000 --train_set_size=2000 --batch_size_train=2000 --wandb_tag=math__d_axis__digits4__lr0001 --iters_per_eval=16 --test_set_size=10000 --n_digit=4 --lr=.0001 --dropout_prob=0.0
done
