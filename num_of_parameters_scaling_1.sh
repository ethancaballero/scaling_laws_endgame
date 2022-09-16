base=157626438
hundred=9000
for i in {1..166}
do
   base_seed=$(($hundred * $i))
   pre=$(($base + $base_seed))

   size24=100
   seed24=$(expr $pre + $size24)
   sbatch --time=1:59:59 --gres=gpu:1 --mem=16G job_cc_cedar.sh --dmodel=24 --seed=$seed24 --data_steps=100000000 --train_set_size=100000000000000 --batch_size_train=256 --wandb_tag=math__p_axis__dff_div_dmodel_1__n_head_1__n_digits_4__sweep_e --dff_div_dmodel=1 --iters_per_eval=512 --test_set_size=10000 --n_head=1 --n_digit=4 --lr=.001

   size26=200
   seed26=$(expr $pre + $size26)
   sbatch --time=1:59:59 --gres=gpu:1 --mem=16G job_cc_cedar.sh --dmodel=26 --seed=$seed26 --data_steps=100000000 --train_set_size=100000000000000 --batch_size_train=256 --wandb_tag=math__p_axis__dff_div_dmodel_1__n_head_1__n_digits_4__sweep_e --dff_div_dmodel=1 --iters_per_eval=512 --test_set_size=10000 --n_head=1 --n_digit=4 --lr=.001

   size28=300
   seed28=$(expr $pre + $size28)
   sbatch --time=1:59:59 --gres=gpu:1 --mem=16G job_cc_cedar.sh --dmodel=28 --seed=$seed28 --data_steps=100000000 --train_set_size=100000000000000 --batch_size_train=256 --wandb_tag=math__p_axis__dff_div_dmodel_1__n_head_1__n_digits_4__sweep_e --dff_div_dmodel=1 --iters_per_eval=512 --test_set_size=10000 --n_head=1 --n_digit=4 --lr=.001

   size30=400
   seed30=$(expr $pre + $size30)
   sbatch --time=1:59:59 --gres=gpu:1 --mem=16G job_cc_cedar.sh --dmodel=30 --seed=$seed30 --data_steps=100000000 --train_set_size=100000000000000 --batch_size_train=256 --wandb_tag=math__p_axis__dff_div_dmodel_1__n_head_1__n_digits_4__sweep_e --dff_div_dmodel=1 --iters_per_eval=512 --test_set_size=10000 --n_head=1 --n_digit=4 --lr=.001

   size32=500
   seed32=$(expr $pre + $size32)
   sbatch --time=1:59:59 --gres=gpu:1 --mem=16G job_cc_cedar.sh --dmodel=32 --seed=$seed32 --data_steps=100000000 --train_set_size=100000000000000 --batch_size_train=256 --wandb_tag=math__p_axis__dff_div_dmodel_1__n_head_1__n_digits_4__sweep_e --dff_div_dmodel=1 --iters_per_eval=512 --test_set_size=10000 --n_head=1 --n_digit=4 --lr=.001

   size36=600
   seed36=$(expr $pre + $size36)
   sbatch --time=1:59:59 --gres=gpu:1 --mem=16G job_cc_cedar.sh --dmodel=36 --seed=$seed36 --data_steps=100000000 --train_set_size=100000000000000 --batch_size_train=256 --wandb_tag=math__p_axis__dff_div_dmodel_1__n_head_1__n_digits_4__sweep_e --dff_div_dmodel=1 --iters_per_eval=512 --test_set_size=10000 --n_head=1 --n_digit=4 --lr=.001
done
