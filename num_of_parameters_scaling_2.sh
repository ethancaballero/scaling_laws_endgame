base=724243288
hundred=9000
for i in {1..83}
do
   base_seed=$(($hundred * $i))
   pre=$(($base + $base_seed))

   size34=100
   seed34=$(expr $pre + $size34)
   sbatch --time=1:59:59 --gres=gpu:1 --mem=16G job_cc_cedar.sh --dmodel=34 --seed=$seed34 --data_steps=100000000 --train_set_size=100000000000000 --batch_size_train=256 --wandb_tag=math__p_axis__dff_div_dmodel_1__n_head_1__n_digits_4__sweep_e --dff_div_dmodel=1 --iters_per_eval=512 --test_set_size=10000 --n_head=1 --n_digit=4 --lr=.001

   size38=200
   seed38=$(expr $pre + $size38)
   sbatch --time=1:59:59 --gres=gpu:1 --mem=16G job_cc_cedar.sh --dmodel=38 --seed=$seed38 --data_steps=100000000 --train_set_size=100000000000000 --batch_size_train=256 --wandb_tag=math__p_axis__dff_div_dmodel_1__n_head_1__n_digits_4__sweep_e --dff_div_dmodel=1 --iters_per_eval=512 --test_set_size=10000 --n_head=1 --n_digit=4 --lr=.001

   size42=300
   seed42=$(expr $pre + $size42)
   sbatch --time=1:59:59 --gres=gpu:1 --mem=16G job_cc_cedar.sh --dmodel=42 --seed=$seed42 --data_steps=100000000 --train_set_size=100000000000000 --batch_size_train=256 --wandb_tag=math__p_axis__dff_div_dmodel_1__n_head_1__n_digits_4__sweep_e --dff_div_dmodel=1 --iters_per_eval=512 --test_set_size=10000 --n_head=1 --n_digit=4 --lr=.001

   size48=400
   seed48=$(expr $pre + $size48)
   sbatch --time=1:59:59 --gres=gpu:1 --mem=16G job_cc_cedar.sh --dmodel=48 --seed=$seed48 --data_steps=100000000 --train_set_size=100000000000000 --batch_size_train=256 --wandb_tag=math__p_axis__dff_div_dmodel_1__n_head_1__n_digits_4__sweep_e --dff_div_dmodel=1 --iters_per_eval=512 --test_set_size=10000 --n_head=1 --n_digit=4 --lr=.001

   size52=500
   seed52=$(expr $pre + $size52)
   sbatch --time=1:59:59 --gres=gpu:1 --mem=16G job_cc_cedar.sh --dmodel=52 --seed=$seed52 --data_steps=100000000 --train_set_size=100000000000000 --batch_size_train=256 --wandb_tag=math__p_axis__dff_div_dmodel_1__n_head_1__n_digits_4__sweep_e --dff_div_dmodel=1 --iters_per_eval=512 --test_set_size=10000 --n_head=1 --n_digit=4 --lr=.001

   size54=600
   seed54=$(expr $pre + $size54)
   sbatch --time=1:59:59 --gres=gpu:1 --mem=16G job_cc_cedar.sh --dmodel=54 --seed=$seed54 --data_steps=100000000 --train_set_size=100000000000000 --batch_size_train=256 --wandb_tag=math__p_axis__dff_div_dmodel_1__n_head_1__n_digits_4__sweep_e --dff_div_dmodel=1 --iters_per_eval=512 --test_set_size=10000 --n_head=1 --n_digit=4 --lr=.001

   size56=700
   seed56=$(expr $pre + $size56)
   sbatch --time=1:59:59 --gres=gpu:1 --mem=16G job_cc_cedar.sh --dmodel=56 --seed=$seed56 --data_steps=100000000 --train_set_size=100000000000000 --batch_size_train=256 --wandb_tag=math__p_axis__dff_div_dmodel_1__n_head_1__n_digits_4__sweep_e --dff_div_dmodel=1 --iters_per_eval=512 --test_set_size=10000 --n_head=1 --n_digit=4 --lr=.001

   size58=800
   seed58=$(expr $pre + $size58)
   sbatch --time=1:59:59 --gres=gpu:1 --mem=16G job_cc_cedar.sh --dmodel=58 --seed=$seed58 --data_steps=100000000 --train_set_size=100000000000000 --batch_size_train=256 --wandb_tag=math__p_axis__dff_div_dmodel_1__n_head_1__n_digits_4__sweep_e --dff_div_dmodel=1 --iters_per_eval=512 --test_set_size=10000 --n_head=1 --n_digit=4 --lr=.001

   size62=900
   seed62=$(expr $pre + $size62)
   sbatch --time=1:59:59 --gres=gpu:1 --mem=16G job_cc_cedar.sh --dmodel=62 --seed=$seed62 --data_steps=100000000 --train_set_size=100000000000000 --batch_size_train=256 --wandb_tag=math__p_axis__dff_div_dmodel_1__n_head_1__n_digits_4__sweep_e --dff_div_dmodel=1 --iters_per_eval=512 --test_set_size=10000 --n_head=1 --n_digit=4 --lr=.001

   size64=1000
   seed64=$(expr $pre + $size64)
   sbatch --time=1:59:59 --gres=gpu:1 --mem=16G job_cc_cedar.sh --dmodel=64 --seed=$seed64 --data_steps=100000000 --train_set_size=100000000000000 --batch_size_train=256 --wandb_tag=math__p_axis__dff_div_dmodel_1__n_head_1__n_digits_4__sweep_e --dff_div_dmodel=1 --iters_per_eval=512 --test_set_size=10000 --n_head=1 --n_digit=4 --lr=.001

   size66=1100
   seed66=$(expr $pre + $size66)
   sbatch --time=1:59:59 --gres=gpu:1 --mem=16G job_cc_cedar.sh --dmodel=66 --seed=$seed66 --data_steps=100000000 --train_set_size=100000000000000 --batch_size_train=256 --wandb_tag=math__p_axis__dff_div_dmodel_1__n_head_1__n_digits_4__sweep_e --dff_div_dmodel=1 --iters_per_eval=512 --test_set_size=10000 --n_head=1 --n_digit=4 --lr=.001

   size68=1200
   seed68=$(expr $pre + $size68)
   sbatch --time=1:59:59 --gres=gpu:1 --mem=16G job_cc_cedar.sh --dmodel=68 --seed=$seed68 --data_steps=100000000 --train_set_size=100000000000000 --batch_size_train=256 --wandb_tag=math__p_axis__dff_div_dmodel_1__n_head_1__n_digits_4__sweep_e --dff_div_dmodel=1 --iters_per_eval=512 --test_set_size=10000 --n_head=1 --n_digit=4 --lr=.001
done
