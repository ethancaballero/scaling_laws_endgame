
base=829446982
hundred=2000
for i in {1..166}
do
   base_seed=$(($hundred * $i))
   pre=$(($base + $base_seed))

   size1056=100
   seed1056=$(expr $pre + $size1056)
   sbatch --time=1:29:0 --gres=gpu:1 job_cc_cedar.sh --data_steps=6000000 --seed=$seed1056 --train_set_size=1056 --batch_size_train=1056 --wandb_tag=math__d_axis__digits4__lr0001 --iters_per_eval=16 --test_set_size=10000 --n_digit=4 --lr=.0001 --dropout_prob=0.0

   size1088=200
   seed1088=$(expr $pre + $size1088)
   sbatch --time=1:29:0 --gres=gpu:1 job_cc_cedar.sh --data_steps=6000000 --seed=$seed1088 --train_set_size=1088 --batch_size_train=1088 --wandb_tag=math__d_axis__digits4__lr0001 --iters_per_eval=16 --test_set_size=10000 --n_digit=4 --lr=.0001 --dropout_prob=0.0

   size1120=300
   seed1120=$(expr $pre + $size1120)
   sbatch --time=1:29:0 --gres=gpu:1 job_cc_cedar.sh --data_steps=6000000 --seed=$seed1120 --train_set_size=1120 --batch_size_train=1120 --wandb_tag=math__d_axis__digits4__lr0001 --iters_per_eval=16 --test_set_size=10000 --n_digit=4 --lr=.0001 --dropout_prob=0.0

   size1152=400
   seed1152=$(expr $pre + $size1152)
   sbatch --time=1:29:0 --gres=gpu:1 job_cc_cedar.sh --data_steps=6000000 --seed=$seed1152 --train_set_size=1152 --batch_size_train=1152 --wandb_tag=math__d_axis__digits4__lr0001 --iters_per_eval=16 --test_set_size=10000 --n_digit=4 --lr=.0001 --dropout_prob=0.0

   size1184=500
   seed1184=$(expr $pre + $size1184)
   sbatch --time=1:29:0 --gres=gpu:1 job_cc_cedar.sh --data_steps=6000000 --seed=$seed1184 --train_set_size=1184 --batch_size_train=1184 --wandb_tag=math__d_axis__digits4__lr0001 --iters_per_eval=16 --test_set_size=10000 --n_digit=4 --lr=.0001 --dropout_prob=0.0

   size1216=600
   seed1216=$(expr $pre + $size1216)
   sbatch --time=1:29:0 --gres=gpu:1 job_cc_cedar.sh --data_steps=6000000 --seed=$seed1216 --train_set_size=1216 --batch_size_train=1216 --wandb_tag=math__d_axis__digits4__lr0001 --iters_per_eval=16 --test_set_size=10000 --n_digit=4 --lr=.0001 --dropout_prob=0.0
done
