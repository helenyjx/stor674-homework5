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

# ---- Set up environment ----
module purge
module load apptainer

# Move to the job submission directory
cd "$SLURM_SUBMIT_DIR"

# Run the containerized application
apptainer exec --nv compute-bench.sif python /app/compute_bench.py > slurm-${SLURM_JOBID}.pyout 2>&1

# Append Python output to main log file
cat slurm-${SLURM_JOBID}.pyout >> slurm-${SLURM_JOBID}.out