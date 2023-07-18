#RNA sequencing for herpes data
#use package bwa-mem2, minimap2, samtools

conda create -n bwa-mem2 bwa-mem2
conda create -n minimap2 minimap2
conda create -n samtools samtools

#create index
bwa-mem2 index /home/tleangapichart/herpes/nanoref/WUMS.flye.long.ok.longest_usethis.fasta

#create sam file
bwa-mem2 mem -t 8 /home/tleangapichart/herpes/nanoref/WUMS.flye.long.ok.longest_usethis.fasta <reads.fq/fa> > out.sam

#/home/tleangapichart/herpes/nanoref
#Important parameter settings: 
        BATCH_SIZE: 512
        MAX_SEQ_LEN_REF: 256
        MAX_SEQ_LEN_QER: 128
        MAX_SEQ_LEN8: 128
        SEEDS_PER_READ: 500
        SIMD_WIDTH8 X: 32
        SIMD_WIDTH16 X: 16
        AVG_SEEDS_PER_READ: 64
#manage file name
for file in *.fna ; do mv $file `echo $file | sed 's/\(.*\.\)fna/\1fasta/'` ; done

fastq.trimmed.paired.gz

for file in *.fastq.trimmed.paired.gz ; do mv $file `echo $file | sed 's/\(.*\.\)fastq.trimmed.paired.gz/\1sam/'` ; done
