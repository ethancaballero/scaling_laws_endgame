#!/bin/bash
#SBATCH --account=rrg-bengioy-ad         # Yoshua pays for your job
#SBATCH --cpus-per-task=6                # Ask for 6 CPUs
#SBATCH --gres=gpu:1                     # Ask for 1 GPU
#SBATCH --mem=10G                        # Ask for 32 GB of RAM
#SBATCH --time=3:00:00                   # The job will run for 3 hours

dmodel="128"
n_head="2"
n_layer="1"
dff_div_dmodel="4"
#iters_per_eval="1024"
#iters_per_eval="2048"
train_set_size="1000000000000"

n_digit="2"

lr=".001"

#wandb_tag="math__p_axis__dff_div_dmodel_1__n_head_1__n_digits_4"
wandb_tag="math__d_axis__seeds_2"

seed="1"

data_steps="10000000000000000"

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
    -tss=*|--train_set_size=*)
    train_set_size="${i#*=}"
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

python minGPT/run_math.py --epochs 1000000000000000000 --data_steps $data_steps --lr $lr --lr_decay False --drop_last True --wandb_tag $wandb_tag --only_mlp False --dmodel $dmodel --batch_size_train $batch_size_train --train_set_size $train_set_size --dff_div_dmodel $dff_div_dmodel --n_head $n_head --n_layer $n_layer --n_digit $n_digit --seed $seed
