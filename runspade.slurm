#run spades

#!/bin/bash
#SBATCH --job-name=spades
#SBATCH --account=nn9305k
#SBATCH --time=10:20:00
#SBATCH --ntasks=2
#SBATCH --mem-per-cpu=16G 
## Set up job environment:
source /cluster/bin/jobsetup
module load spades
readonly DATADIR=/projects/nn9305k/home/thlewin19/geese2019/trim

spades.py -k 21,33,55,77,99,127 --careful --pe1-1 3810-13_R1.fq.gz --pe1-2 3810-13_R2.fq.gz -o spadesout_3810-13
