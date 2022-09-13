base=625816104
hundred=2000
for i in {1..500}
do
   base_seed=$(($hundred * $i))
   pre=$(($base + $base_seed))

   size576=900
   seed576=$(expr $pre + $size576)
   sbatch --time=0:35:0 --gres=gpu:1 job_cc_cedar.sh --data_steps=750000 --seed=$seed576 --train_set_size=576 --batch_size_train=576 --wandb_tag=math__d_axis__digits4__lr0001 --iters_per_eval=16 --test_set_size=10000 --n_digit=4 --lr=.0001 --dropout_prob=0.0

   size608=1101
   seed608=$(expr $pre + $size608)
   sbatch --time=0:35:0 --gres=gpu:1 job_cc_cedar.sh --data_steps=750000 --seed=$seed608 --train_set_size=608 --batch_size_train=608 --wandb_tag=math__d_axis__digits4__lr0001 --iters_per_eval=16 --test_set_size=10000 --n_digit=4 --lr=.0001 --dropout_prob=0.0
done
