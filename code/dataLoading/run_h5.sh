#!/bin/bash -x
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=96
#SBATCH --time=02:00:00
#SBATCH --partition=develbooster
#SBATCH --gres=gpu:1
#SBATCH --account=training2321
#SBATCH --output=%j.out
#SBATCH --error=%j.err

CUDA_VISIBLE_DEVICES=0,1,2,3
export SRUN_CPUS_PER_TASK="$SLURM_CPUS_PER_TASK"

source /p/project/hai_tbidia/benassou1/ct_scan/sc_venv_template/activate.sh

start=$(date +%s)
srun python imageNetH5.py 
ELAPSED=$(($(date +%s) - start))

printf "elapsed: %s\n\n" "$(date -d@$ELAPSED -u +%H\ hours\ %M\ min\ %S\ sec)"