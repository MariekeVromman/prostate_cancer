#!/bin/bash
#Torque Configuration
#PBS -l walltime=36:00:00
#PBS -l mem=16gb
#PBS -l nodes=1:ppn=1
#PBS -q batch
#PBS -N circ_anno
#PBS -j oe
#PBS -o /data/tmp/mvromman/20240514_prostate/20240603_circ/20240607_nf_runner_4.txt


source ~/.bashrc

/data/users/mvromman/software/nextflow/nextflow run \
    /data/tmp/mvromman/20240514_prostate/20240603_circ/circrna \
    -profile singularity \
    -ansi-log false \
    -c /data/users/mvromman/projects/03_prostate/20240603_circ_nextflow.config \
    -w /data/tmp/mvromman/20240514_prostate/20240603_circ/nf-work \
    -params-file /data/users/mvromman/projects/03_prostate/20240514_circ_nf-params.json \
    -resume e701357a-b333-4750-baee-140ea7f0c02f


