#!/bin/bash
#Torque Configuration
#PBS -l walltime=36:00:00
#PBS -l mem=16gb
#PBS -l nodes=1:ppn=1
#PBS -q batch
#PBS -N circ_anno
#PBS -j oe
#PBS -o /data/tmp/mvromman/20240610_run2/03_run_circ.out


#c29124f

source ~/.bashrc

/data/users/mvromman/software/nextflow/nextflow run \
    /data/tmp/mvromman/20240610_run2/circrna \
    -profile singularity \
    -ansi-log false \
    -c /data/tmp/mvromman/20240610_run2/03_nf.config \
    -w /data/tmp/mvromman/20240610_run2/work \
    -params-file /data/tmp/mvromman/20240610_run2/03_circ_nf-params.json \
    -resume 59446ba3-f47f-444f-a84a-6340b77e6c41

