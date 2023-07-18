#!/bin/bash
##run abricate
##refer to https://github.com/tseemann/abricate

#SBATCH --account=nn9305k 
#SBATCH --time=4:00:00

##memory specs
#SBATCH --mem-per-cpu=4Gb
#SBATCH --ntasks=16
#SBATCH --job-name=abricatetest
#SBATCH --array=0-125

## Set up job environment:
source /cluster/bin/jobsetup
source activate ABRicate_Shared

readonly DATADIR=/projects/nn9305k/home/thlewin19/4asmEC

## Generate array of files
cd /projects/nn9305k/home/thlewin19/4asmEC/pilon
FILES=($(ls *.fasta))
CURRENT_FILE=${FILES[$SLURM_ARRAY_TASK_ID]}
outfile=${CURRENT_FILE%%}

## Run abricate
source activate ABRicate_Shared
abricate --db argannot $CURRENT_FILE > /projects/nn9305k/home/thlewin19/4asmEC/argannot_results/${outfile}_arg.csv
