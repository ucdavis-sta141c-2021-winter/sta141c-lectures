#!/bin/bash
#
#SBATCH --job-name=myjob
#SBATCH --output=myjob.out
#SBATCH --error=myjob.err
#SBATCH -n 4
#SBATCH -t 1

module load R
srun Rscript calc-pi.R
