#!/bin/bash 
#refer to https://github.com/tseemann/prokka
#Prokka: rapid prokaryotic genome annotation

#SBATCH --account=nn9305k 
#SBATCH --time=48:00:00

##memory specs
#SBATCH --mem-per-cpu=4Gb
#SBATCH --ntasks=16
#SBATCH --job-name=prokkatest
#SBATCH --array=0-76

## Set up environment
source /cluster/bin/jobsetup
conda activate prokkaroary

## Generate array of files
cd /projects/nn9305k/home/thlewin19/77thaiKP/
FILES=($(ls *.fasta))
CURRENT_FILE=${FILES[$SLURM_ARRAY_TASK_ID]}
outfile=${CURRENT_FILE%%}

## Runprokka
conda activate prokkaroary
prokka $CURRENT_FILE --outdir 77KPprokka

