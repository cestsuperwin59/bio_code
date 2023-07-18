#!/bin/bash
##Chewbbaca run needs 3 steps, train file, create schema, and allele calling
##run separate command to adjust cpu and time
##refer to https://github.com/B-UMMI/chewBBACA

#!/bin/bash
#SBATCH --job-name=prepext
#SBATCH --account=nn9305k
#SBATCH --time=49:00:00
#SBATCH --ntasks=16
#SBATCH --mem-per-cpu=4G
#SBATCH --output=/cluster/projects/nn9305k/active/thlewin19/chewBBACA_prep_slurm.%j.out

## activating the sunbeam conda environment
. /cluster/projects/nn9305k/src/miniconda/etc/profile.d/conda.sh

##run prodigal with reference to create training file

module load prodigal/2.6.3-GCCcore-7.3.0
cd /cluster/projects/nn9305k/active/thlewin19/

prodigal -i HS11286.fasta -t KPtrainingFile.trn -p single

##create schema
conda activate Chewbbaca
cd /cluster/projects/nn9305k/active/thlewin19/pasteur/

chewBBACA.py PrepExternalSchema -i /cluster/projects/nn9305k/active/thlewin19/pasteur/ --cpu 16

##allelecall
chewBBACA.py AlleleCall -i /projects/nn9305k/home/thlewin19/kp_cgMLST/all241KP -g /projects/nn9305k/home/thlewin19/kp_cgMLST/cgMLST -o /projects/nn9305k/home/thlewin19/kp_cgMLST/winresults_cg --cpu 16

