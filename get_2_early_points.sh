base=223787258
hundred=2000
for i in {1..500}
do
   base_seed=$(($hundred * $i))
   pre=$(($base + $base_seed))

   size160=903
   seed160=$(expr $pre + $size160)
   sbatch --time=0:30:0 --gres=gpu:1 job_cc_cedar.sh --data_steps=650000 --seed=$seed160 --train_set_size=160 --batch_size_train=160 --wandb_tag=math__d_axis__digits4__lr0001 --iters_per_eval=16 --test_set_size=10000 --n_digit=4 --lr=.0001 --dropout_prob=0.0

   size192=1103
   seed192=$(expr $pre + $size192)
   sbatch --time=0:30:0 --gres=gpu:1 job_cc_cedar.sh --data_steps=650000 --seed=$seed192 --train_set_size=192 --batch_size_train=192 --wandb_tag=math__d_axis__digits4__lr0001 --iters_per_eval=16 --test_set_size=10000 --n_digit=4 --lr=.0001 --dropout_prob=0.0
done