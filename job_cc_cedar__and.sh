#!/bin/bash
#SBATCH --account=rrg-bengioy-ad         # Yoshua pays for your job
#SBATCH --cpus-per-task=6                # Ask for 6 CPUs
#SBATCH --gres=gpu:1                     # Ask for 1 GPU
#SBATCH --mem=16G                        # Ask for 32 GB of RAM
#SBATCH --time=3:00:00                   # The job will run for 3 hours

dmodel="128"
n_head="2"
n_layer="1"
dff_div_dmodel="4"
#iters_per_eval="1"
iters_per_eval="16"
train_set_size="1000000000000"
test_set_size="1000"

n_digit="2"

lr=".001"

#wandb_tag="math__p_axis__dff_div_dmodel_1__n_head_1__n_digits_4"
wandb_tag="math__d_axis__seeds_2"

seed="1"

data_steps="10000000000000000"

only_mlp="False"

user=$USER
echo "$user"

for i in "$@"
do
case $i in
    -lr=*|--lr=*)
    lr="${i#*=}"
    shift # past argument=value
    ;;
    -dm=*|--dmodel=*)
    dmodel="${i#*=}"
    shift # past argument=value
    ;;
    -om=*|--only_mlp=*)
    only_mlp="${i#*=}"
    shift # past argument=value
    ;;
    -nh=*|--n_head=*)
    n_head="${i#*=}"
    shift # past argument=value
    ;;
    -nl=*|--n_layer=*)
    n_layer="${i#*=}"
    shift # past argument=value
    ;;
    -ddd=*|--dff_div_dmodel=*)
    dff_div_dmodel="${i#*=}"
    shift # past argument=value
    ;;
    -trss=*|--train_set_size=*)
    train_set_size="${i#*=}"
    shift # past argument=value
    ;;
    -tess=*|--test_set_size=*)
    test_set_size="${i#*=}"
    shift # past argument=value
    ;;
    -bst=*|--batch_size_train=*)
    batch_size_train="${i#*=}"
    shift # past argument=value
    ;;
    -ds=*|--data_steps=*)
    data_steps="${i#*=}"
    shift # past argument=value
    ;;
    -nd=*|--n_digit=*)
    n_digit="${i#*=}"
    shift # past argument=value
    ;;
    -ipe=*|--iters_per_eval=*)
    iters_per_eval="${i#*=}"
    shift # past argument=value
    ;;
    -sd=*|--seed=*)
    seed="${i#*=}"
    shift # past argument=value
    ;;
    -wt=*|--wandb_tag=*)
    wandb_tag="${i#*=}"
    shift # past argument=value
    ;;
    *)
          # unknown option
    ;;
esac
done


env_dir="/home/mila/c/caballero"
code_dir="/home/ethancab/research/scaling_breadth"

echo "$train_set_size"
echo "$dmodel"

if [[ -n $1 ]]; then
    echo "Argument not recognised"
    exit
fi

# 1. Load the required modules

cd /home/ethancab/scratch

module load python/3.7

cd /home/ethancab/envs

source env/bin/activate

cd /home/ethancab/research/scaling_laws_endgame

s2="2"
s3="3"
s4="4"
s5="5"
s6="6"
s7="7"
s8="8"
s9="9"
s10="10"

seed1=$seed
seed2=$(($seed + $s2))
seed3=$(($seed + $s3))
seed4=$(($seed + $s4))
seed5=$(($seed + $s5))
seed6=$(($seed + $s6))
seed7=$(($seed + $s7))
seed8=$(($seed + $s8))
seed9=$(($seed + $s9))
seed10=$(($seed + $s10))

python minGPT/run_math.py --epochs 1000000000000000000 --data_steps $data_steps --lr $lr --lr_decay False --drop_last True --wandb_tag $wandb_tag --only_mlp $only_mlp --dmodel $dmodel --batch_size_train $batch_size_train --train_set_size $train_set_size --test_set_size $test_set_size --dff_div_dmodel $dff_div_dmodel --n_head $n_head --n_layer $n_layer --n_digit $n_digit --iters_per_eval $iters_per_eval --seed $seed1 &
python minGPT/run_math.py --epochs 1000000000000000000 --data_steps $data_steps --lr $lr --lr_decay False --drop_last True --wandb_tag $wandb_tag --only_mlp $only_mlp --dmodel $dmodel --batch_size_train $batch_size_train --train_set_size $train_set_size --test_set_size $test_set_size --dff_div_dmodel $dff_div_dmodel --n_head $n_head --n_layer $n_layer --n_digit $n_digit --iters_per_eval $iters_per_eval --seed $seed2 &
wait
