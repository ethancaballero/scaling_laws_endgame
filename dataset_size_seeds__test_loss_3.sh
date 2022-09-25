base=258610448
hundred=2000
for i in {1..166}
do
   base_seed=$(($hundred * $i))
   pre=$(($base + $base_seed))

   size640=100
   seed640=$(expr $pre + $size640)
   sbatch --time=0:45:0 --gres=gpu:1 job_cc_cedar.sh --data_steps=1000000 --seed=$seed640 --train_set_size=640 --batch_size_train=640 --wandb_tag=math__d_axis__digits4__lr0001 --iters_per_eval=16 --test_set_size=10000 --n_digit=4 --lr=.0001 --dropout_prob=0.0

   size672=200
   seed672=$(expr $pre + $size672)
   sbatch --time=0:45:0 --gres=gpu:1 job_cc_cedar.sh --data_steps=1000000 --seed=$seed672 --train_set_size=672 --batch_size_train=672 --wandb_tag=math__d_axis__digits4__lr0001 --iters_per_eval=16 --test_set_size=10000 --n_digit=4 --lr=.0001 --dropout_prob=0.0

   size704=300
   seed704=$(expr $pre + $size704)
   sbatch --time=0:45:0 --gres=gpu:1 job_cc_cedar.sh --data_steps=1000000 --seed=$seed704 --train_set_size=704 --batch_size_train=704 --wandb_tag=math__d_axis__digits4__lr0001 --iters_per_eval=16 --test_set_size=10000 --n_digit=4 --lr=.0001 --dropout_prob=0.0

   size736=400
   seed736=$(expr $pre + $size736)
   sbatch --time=0:45:0 --gres=gpu:1 job_cc_cedar.sh --data_steps=1000000 --seed=$seed736 --train_set_size=736 --batch_size_train=736 --wandb_tag=math__d_axis__digits4__lr0001 --iters_per_eval=16 --test_set_size=10000 --n_digit=4 --lr=.0001 --dropout_prob=0.0

   size768=500
   seed768=$(expr $pre + $size768)
   sbatch --time=0:45:0 --gres=gpu:1 job_cc_cedar.sh --data_steps=1000000 --seed=$seed768 --train_set_size=768 --batch_size_train=768 --wandb_tag=math__d_axis__digits4__lr0001 --iters_per_eval=16 --test_set_size=10000 --n_digit=4 --lr=.0001 --dropout_prob=0.0

   size800=600
   seed800=$(expr $pre + $size800)
   sbatch --time=0:45:0 --gres=gpu:1 job_cc_cedar.sh --data_steps=1000000 --seed=$seed800 --train_set_size=800 --batch_size_train=800 --wandb_tag=math__d_axis__digits4__lr0001 --iters_per_eval=16 --test_set_size=10000 --n_digit=4 --lr=.0001 --dropout_prob=0.0
done
