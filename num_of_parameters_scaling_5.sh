base=873066620
hundred=9000
for i in {1..52}
do
   base_seed=$(($hundred * $i))
   pre=$(($base + $base_seed))

   size42=2100
   seed42=$(expr $pre + $size42)
   sbatch --time=1:59:59 --gres=gpu:1 --mem=16G job_cc_cedar.sh --dmodel=42 --seed=$seed42 --data_steps=100000000 --train_set_size=100000000000000 --batch_size_train=256 --wandb_tag=math__p_axis__dff_div_dmodel_1__n_head_1__n_digits_4__sweep_e --dff_div_dmodel=1 --iters_per_eval=512 --test_set_size=10000 --n_head=1 --n_digit=4 --lr=.001

   size45=2200
   seed45=$(expr $pre + $size45)
   sbatch --time=1:59:59 --gres=gpu:1 --mem=16G job_cc_cedar.sh --dmodel=45 --seed=$seed45 --data_steps=100000000 --train_set_size=100000000000000 --batch_size_train=256 --wandb_tag=math__p_axis__dff_div_dmodel_1__n_head_1__n_digits_4__sweep_e --dff_div_dmodel=1 --iters_per_eval=512 --test_set_size=10000 --n_head=1 --n_digit=4 --lr=.001

   size48=2300
   seed48=$(expr $pre + $size48)
   sbatch --time=1:59:59 --gres=gpu:1 --mem=16G job_cc_cedar.sh --dmodel=48 --seed=$seed48 --data_steps=100000000 --train_set_size=100000000000000 --batch_size_train=256 --wandb_tag=math__p_axis__dff_div_dmodel_1__n_head_1__n_digits_4__sweep_e --dff_div_dmodel=1 --iters_per_eval=512 --test_set_size=10000 --n_head=1 --n_digit=4 --lr=.001

   size50=2400
   seed50=$(expr $pre + $size50)
   sbatch --time=1:59:59 --gres=gpu:1 --mem=16G job_cc_cedar.sh --dmodel=50 --seed=$seed50 --data_steps=100000000 --train_set_size=100000000000000 --batch_size_train=256 --wandb_tag=math__p_axis__dff_div_dmodel_1__n_head_1__n_digits_4__sweep_e --dff_div_dmodel=1 --iters_per_eval=512 --test_set_size=10000 --n_head=1 --n_digit=4 --lr=.001

   size52=2500
   seed52=$(expr $pre + $size52)
   sbatch --time=1:59:59 --gres=gpu:1 --mem=16G job_cc_cedar.sh --dmodel=52 --seed=$seed52 --data_steps=100000000 --train_set_size=100000000000000 --batch_size_train=256 --wandb_tag=math__p_axis__dff_div_dmodel_1__n_head_1__n_digits_4__sweep_e --dff_div_dmodel=1 --iters_per_eval=512 --test_set_size=10000 --n_head=1 --n_digit=4 --lr=.001

   size54=2600
   seed54=$(expr $pre + $size54)
   sbatch --time=1:59:59 --gres=gpu:1 --mem=16G job_cc_cedar.sh --dmodel=54 --seed=$seed54 --data_steps=100000000 --train_set_size=100000000000000 --batch_size_train=256 --wandb_tag=math__p_axis__dff_div_dmodel_1__n_head_1__n_digits_4__sweep_e --dff_div_dmodel=1 --iters_per_eval=512 --test_set_size=10000 --n_head=1 --n_digit=4 --lr=.001

   size56=2700
   seed56=$(expr $pre + $size56)
   sbatch --time=1:59:59 --gres=gpu:1 --mem=16G job_cc_cedar.sh --dmodel=56 --seed=$seed56 --data_steps=100000000 --train_set_size=100000000000000 --batch_size_train=256 --wandb_tag=math__p_axis__dff_div_dmodel_1__n_head_1__n_digits_4__sweep_e --dff_div_dmodel=1 --iters_per_eval=512 --test_set_size=10000 --n_head=1 --n_digit=4 --lr=.001

   size58=2800
   seed58=$(expr $pre + $size58)
   sbatch --time=1:59:59 --gres=gpu:1 --mem=16G job_cc_cedar.sh --dmodel=58 --seed=$seed58 --data_steps=100000000 --train_set_size=100000000000000 --batch_size_train=256 --wandb_tag=math__p_axis__dff_div_dmodel_1__n_head_1__n_digits_4__sweep_e --dff_div_dmodel=1 --iters_per_eval=512 --test_set_size=10000 --n_head=1 --n_digit=4 --lr=.001

   size60=2900
   seed60=$(expr $pre + $size60)
   sbatch --time=1:59:59 --gres=gpu:1 --mem=16G job_cc_cedar.sh --dmodel=60 --seed=$seed60 --data_steps=100000000 --train_set_size=100000000000000 --batch_size_train=256 --wandb_tag=math__p_axis__dff_div_dmodel_1__n_head_1__n_digits_4__sweep_e --dff_div_dmodel=1 --iters_per_eval=512 --test_set_size=10000 --n_head=1 --n_digit=4 --lr=.001

   size62=3000
   seed62=$(expr $pre + $size62)
   sbatch --time=1:59:59 --gres=gpu:1 --mem=16G job_cc_cedar.sh --dmodel=62 --seed=$seed62 --data_steps=100000000 --train_set_size=100000000000000 --batch_size_train=256 --wandb_tag=math__p_axis__dff_div_dmodel_1__n_head_1__n_digits_4__sweep_e --dff_div_dmodel=1 --iters_per_eval=512 --test_set_size=10000 --n_head=1 --n_digit=4 --lr=.001

   size64=3100
   seed64=$(expr $pre + $size64)
   sbatch --time=1:59:59 --gres=gpu:1 --mem=16G job_cc_cedar.sh --dmodel=64 --seed=$seed64 --data_steps=100000000 --train_set_size=100000000000000 --batch_size_train=256 --wandb_tag=math__p_axis__dff_div_dmodel_1__n_head_1__n_digits_4__sweep_e --dff_div_dmodel=1 --iters_per_eval=512 --test_set_size=10000 --n_head=1 --n_digit=4 --lr=.001

   size66=3200
   seed66=$(expr $pre + $size66)
   sbatch --time=1:59:59 --gres=gpu:1 --mem=16G job_cc_cedar.sh --dmodel=66 --seed=$seed66 --data_steps=100000000 --train_set_size=100000000000000 --batch_size_train=256 --wandb_tag=math__p_axis__dff_div_dmodel_1__n_head_1__n_digits_4__sweep_e --dff_div_dmodel=1 --iters_per_eval=512 --test_set_size=10000 --n_head=1 --n_digit=4 --lr=.001

   size68=3300
   seed68=$(expr $pre + $size68)
   sbatch --time=1:59:59 --gres=gpu:1 --mem=16G job_cc_cedar.sh --dmodel=68 --seed=$seed68 --data_steps=100000000 --train_set_size=100000000000000 --batch_size_train=256 --wandb_tag=math__p_axis__dff_div_dmodel_1__n_head_1__n_digits_4__sweep_e --dff_div_dmodel=1 --iters_per_eval=512 --test_set_size=10000 --n_head=1 --n_digit=4 --lr=.001

   size70=3400
   seed70=$(expr $pre + $size70)
   sbatch --time=1:59:59 --gres=gpu:1 --mem=16G job_cc_cedar.sh --dmodel=70 --seed=$seed70 --data_steps=100000000 --train_set_size=100000000000000 --batch_size_train=256 --wandb_tag=math__p_axis__dff_div_dmodel_1__n_head_1__n_digits_4__sweep_e --dff_div_dmodel=1 --iters_per_eval=512 --test_set_size=10000 --n_head=1 --n_digit=4 --lr=.001

   size80=3500
   seed80=$(expr $pre + $size80)
   sbatch --time=1:59:59 --gres=gpu:1 --mem=16G job_cc_cedar.sh --dmodel=80 --seed=$seed80 --data_steps=100000000 --train_set_size=100000000000000 --batch_size_train=256 --wandb_tag=math__p_axis__dff_div_dmodel_1__n_head_1__n_digits_4__sweep_e --dff_div_dmodel=1 --iters_per_eval=512 --test_set_size=10000 --n_head=1 --n_digit=4 --lr=.001

   size90=3600
   seed90=$(expr $pre + $size90)
   sbatch --time=1:59:59 --gres=gpu:1 --mem=16G job_cc_cedar.sh --dmodel=90 --seed=$seed90 --data_steps=100000000 --train_set_size=100000000000000 --batch_size_train=256 --wandb_tag=math__p_axis__dff_div_dmodel_1__n_head_1__n_digits_4__sweep_e --dff_div_dmodel=1 --iters_per_eval=512 --test_set_size=10000 --n_head=1 --n_digit=4 --lr=.001

   size75=4000
   seed75=$(expr $pre + $size75)
   sbatch --time=1:59:59 --gres=gpu:1 --mem=16G job_cc_cedar.sh --dmodel=75 --seed=$seed75 --data_steps=100000000 --train_set_size=100000000000000 --batch_size_train=256 --wandb_tag=math__p_axis__dff_div_dmodel_1__n_head_1__n_digits_4__sweep_e --dff_div_dmodel=1 --iters_per_eval=512 --test_set_size=10000 --n_head=1 --n_digit=4 --lr=.001

   size85=4100
   seed85=$(expr $pre + $size85)
   sbatch --time=1:59:59 --gres=gpu:1 --mem=16G job_cc_cedar.sh --dmodel=85 --seed=$seed85 --data_steps=100000000 --train_set_size=100000000000000 --batch_size_train=256 --wandb_tag=math__p_axis__dff_div_dmodel_1__n_head_1__n_digits_4__sweep_e --dff_div_dmodel=1 --iters_per_eval=512 --test_set_size=10000 --n_head=1 --n_digit=4 --lr=.001

   size95=4200
   seed95=$(expr $pre + $size95)
   sbatch --time=1:59:59 --gres=gpu:1 --mem=16G job_cc_cedar.sh --dmodel=95 --seed=$seed95 --data_steps=100000000 --train_set_size=100000000000000 --batch_size_train=256 --wandb_tag=math__p_axis__dff_div_dmodel_1__n_head_1__n_digits_4__sweep_e --dff_div_dmodel=1 --iters_per_eval=512 --test_set_size=10000 --n_head=1 --n_digit=4 --lr=.001

done
