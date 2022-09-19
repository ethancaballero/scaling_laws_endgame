base=106273254
hundred=9000
for i in {1..142}
do
   base_seed=$(($hundred * $i))
   pre=$(($base + $base_seed))

   size70=100
   seed70=$(expr $pre + $size70)
   sbatch --time=1:59:59 --gres=gpu:1 --mem=16G job_cc_cedar.sh --dmodel=70 --seed=$seed70 --data_steps=100000000 --train_set_size=100000000000000 --batch_size_train=256 --wandb_tag=math__p_axis__dff_div_dmodel_1__n_head_1__n_digits_4__sweep_e --dff_div_dmodel=1 --iters_per_eval=512 --test_set_size=10000 --n_head=1 --n_digit=4 --lr=.001

   size80=200
   seed80=$(expr $pre + $size80)
   sbatch --time=1:59:59 --gres=gpu:1 --mem=16G job_cc_cedar.sh --dmodel=80 --seed=$seed80 --data_steps=100000000 --train_set_size=100000000000000 --batch_size_train=256 --wandb_tag=math__p_axis__dff_div_dmodel_1__n_head_1__n_digits_4__sweep_e --dff_div_dmodel=1 --iters_per_eval=512 --test_set_size=10000 --n_head=1 --n_digit=4 --lr=.001

   size90=300
   seed90=$(expr $pre + $size90)
   sbatch --time=1:59:59 --gres=gpu:1 --mem=16G job_cc_cedar.sh --dmodel=90 --seed=$seed90 --data_steps=100000000 --train_set_size=100000000000000 --batch_size_train=256 --wandb_tag=math__p_axis__dff_div_dmodel_1__n_head_1__n_digits_4__sweep_e --dff_div_dmodel=1 --iters_per_eval=512 --test_set_size=10000 --n_head=1 --n_digit=4 --lr=.001

   size100=400
   seed100=$(expr $pre + $size100)
   sbatch --time=1:59:59 --gres=gpu:1 --mem=16G job_cc_cedar.sh --dmodel=100 --seed=$seed100 --data_steps=100000000 --train_set_size=100000000000000 --batch_size_train=256 --wandb_tag=math__p_axis__dff_div_dmodel_1__n_head_1__n_digits_4__sweep_e --dff_div_dmodel=1 --iters_per_eval=512 --test_set_size=10000 --n_head=1 --n_digit=4 --lr=.001

   size110=500
   seed110=$(expr $pre + $size110)
   sbatch --time=1:59:59 --gres=gpu:1 --mem=16G job_cc_cedar.sh --dmodel=110 --seed=$seed110 --data_steps=100000000 --train_set_size=100000000000000 --batch_size_train=256 --wandb_tag=math__p_axis__dff_div_dmodel_1__n_head_1__n_digits_4__sweep_e --dff_div_dmodel=1 --iters_per_eval=512 --test_set_size=10000 --n_head=1 --n_digit=4 --lr=.001

   size120=600
   seed120=$(expr $pre + $size120)
   sbatch --time=1:59:59 --gres=gpu:1 --mem=16G job_cc_cedar.sh --dmodel=120 --seed=$seed120 --data_steps=100000000 --train_set_size=100000000000000 --batch_size_train=256 --wandb_tag=math__p_axis__dff_div_dmodel_1__n_head_1__n_digits_4__sweep_e --dff_div_dmodel=1 --iters_per_eval=512 --test_set_size=10000 --n_head=1 --n_digit=4 --lr=.001

   size128=700
   seed128=$(expr $pre + $size128)
   sbatch --time=1:59:59 --gres=gpu:1 --mem=16G job_cc_cedar.sh --dmodel=128 --seed=$seed128 --data_steps=100000000 --train_set_size=100000000000000 --batch_size_train=256 --wandb_tag=math__p_axis__dff_div_dmodel_1__n_head_1__n_digits_4__sweep_e --dff_div_dmodel=1 --iters_per_eval=512 --test_set_size=10000 --n_head=1 --n_digit=4 --lr=.001
done
