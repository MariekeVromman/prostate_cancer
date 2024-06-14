#!/bin/bash
#Torque Configuration
#PBS -l walltime=6:00:00
#PBS -l mem=64gb
#PBS -l nodes=1:ppn=6
#PBS -q batch
#PBS -N STAR_run
#PBS -j oe
#PBS -o /data/tmp/mvromman/20240514_prostate/get_indexes.out

# download and unzip Gencode genome fasta file

mkdir /data/tmp/mvromman/20240610_run2/references
cd /data/tmp/mvromman/20240610_run2/references
wget https://ftp.ebi.ac.uk/pub/databases/gencode/Gencode_human/release_44/GRCh38.p14.genome.fa.gz
gunzip GRCh38.p14.genome.fa.gz

# download and unzip Gencode gtf file

wget https://ftp.ebi.ac.uk/pub/databases/gencode/Gencode_human/release_44/gencode.v44.chr_patch_hapl_scaff.annotation.gtf.gz
gunzip gencode.v44.chr_patch_hapl_scaff.annotation.gtf.gz


# build STAR index

# /bioinfo/local/build/Centos/STAR/STAR-2.7.5a/bin/Linux_x86_64/STAR \
# 	--runThreadN 6 \
# 	--runMode genomeGenerate \
# 	--genomeDir /data/tmp/mvromman/20240514_prostate/references/STAR_index \
# 	--genomeFastaFiles /data/tmp/mvromman/20240514_prostate/references/GRCh38.p14.genome.fa \
# 	--sjdbGTFfile /data/tmp/mvromman/20240514_prostate/references/gencode.v44.chr_patch_hapl_scaff.annotation.gtf


