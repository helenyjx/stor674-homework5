#!/bin/bash
#SBATCH --job-name=compute-bench
#SBATCH --partition=gpu
#SBATCH --qos=gpu_access
#SBATCH -N 1
#SBATCH --ntasks=1
#SBATCH --gres=gpu:1
#SBATCH --mem=16G
#SBATCH --time=00:20:00
#SBATCH --output=slurm-%j.out

# ---- Environment setup ----
module purge
module load apptainer

# Move to the directory where the job was submitted from
cd "$SLURM_SUBMIT_DIR"

# Run the Apptainer (Singularity) image with NVIDIA GPU support
# --nv exposes the host NVIDIA drivers/devices inside the container
apptainer run --nv compute-bench.sif
