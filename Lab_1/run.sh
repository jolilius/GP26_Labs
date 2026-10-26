#!/bin/bash
# Build and run Lab 1 on a Roihu GPU node.
#   sbatch --account=<your-project> run.sh                       one GPU
#   sbatch --account=<your-project> --gres=gpu:gh200:4 run.sh    four GPUs
#SBATCH --job-name=lab-1
#SBATCH --partition=gputest
#SBATCH --time=00:05:00
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --gres=gpu:gh200:1
#SBATCH --output=lab1_%j.out

set -eo pipefail
if ! type module >/dev/null 2>&1; then
  export CSC_ENV_INIT_NON_INTERACTIVE=yes
  source /etc/profile.d/zz-csc-env.sh
fi
cd "${SLURM_SUBMIT_DIR}"
module load cuda
# The GPU nodes are ARM (Grace), so build here, on the node.
make -B
srun ./device-query
