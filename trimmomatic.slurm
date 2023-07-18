#!/bin/bash
#use with autotrim.sh

## Shows which project to use
#SBATCH --account=nn9305k

## Estimated time for the operation
#SBATCH --time=04:00:00

## Memory specs

## This job requests 3GB of memory
#SBATCH --mem-per-cpu=3G
#SBATCH --cpus-per-task=6

## ONLY If your job needs very high memory usuage you have to use the below option
#SBATCH --job-name=Trim

## Set up job environment:
source /cluster/bin/jobsetup

# Trimmomatic
module load java
readonly DATADIR=/projects/nn9305k/home/thlewin19/geese2019
sh autotrim.sh *.fq.gz
