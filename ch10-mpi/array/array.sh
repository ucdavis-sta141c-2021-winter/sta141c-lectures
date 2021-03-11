#!/bin/bash
#
#SBATCH --job-name=myjob
#SBATCH --output=myjob_%a.out
#SBATCH --error=myjob_%a.err
#SBATCH --array=1-8
#SBATCH -n 1
#SBATCH -t 1

module load R
srun Rscript onejob.R
