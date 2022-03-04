#!/bin/bash
#SBATCH --cpus-per-task=6                     # Ask for 2 CPUs
#SBATCH --gres=gpu:1                          # Ask for 1 GPU
#SBATCH --mem=10G                             # Ask for 10 GB of RAM
#SBATCH --time=48:00:00                        # The job will run for 3 hours

dmodel="128"
#iters_per_eval="1024"
#iters_per_eval="2048"
train_set_size="1000000000000"

n_digit="2"

lr=".001"

wandb_tag="math__p_axis__dff_div_dmodel_1__n_head_1__n_digits_4"

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
    iters_per_eval="${i#*=}"
    shift # past argument=value
    ;;
    -tss=*|--train_set_size=*)
    train_set_size="${i#*=}"
    shift # past argument=value
    ;;
    -nd=*|--n_digit=*)
    n_digit="${i#*=}"
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

cd /home/mila/c/caballero

module load python/3.7

source env/bin/activate

cd research/scaling_outer/scaling_laws_endgame

python minGPT/run_math.py --epochs 1000000000000000000 --data_steps 10000000000000000 --lr $lr --lr_decay False --drop_last True --wandb_tag $wandb_tag --only_mlp False --dmodel $dmodel --train_set_size $train_set_size --dff_div_dmodel 1 --n_head 1 --n_digit $n_digit
