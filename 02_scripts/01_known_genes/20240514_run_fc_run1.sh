#!/bin/bash
#Torque Configuration
#PBS -l walltime=36:00:00
#PBS -l mem=16gb
#PBS -l nodes=1:ppn=1
#PBS -q batch
#PBS -N lin_detection
#PBS -j oe
#PBS -o /data/tmp/mvromman/20240514_prostate/lin/20240514_nf_runner_run1.txt

source ~/.bashrc

/data/users/mvromman/software/nextflow/nextflow run \
    /data/users/mvromman/github/RNA_seq/02a_STAR_FeatureCounts/star.nf \
    -profile hpc \
    -w /data/tmp/mvromman/20240514_prostate/nf-work \
    -params-file /data/users/mvromman/projects/03_prostate/20240514_params_run1.json 