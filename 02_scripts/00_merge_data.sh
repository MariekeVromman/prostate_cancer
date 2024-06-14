#!/bin/bash
#Torque Configuration
#PBS -l walltime=11:00:00
#PBS -l mem=16gb
#PBS -l nodes=1:ppn=1
#PBS -q batch
#PBS -N get_data
#PBS -j oe
#PBS -o /data/tmp/mvromman/20240610_run2/02_merge_data_R1.out

# merge samples from runs D419-D410 and D376

# mkdir /data/tmp/mvromman/20240610_run2/data/D419-D410-D376T01
# zcat /data/tmp/mvromman/20240610_run2/data/D410T01/D419-D410T01.R1.fastq.gz /data/tmp/mvromman/20240610_run2/data/D376T01/D376T01.R1.fastq.gz | gzip -c > /data/tmp/mvromman/20240610_run2/data/D419-D410-D376T01/D419-D410-D376T01.R1.fastq.gz
# mkdir /data/tmp/mvromman/20240610_run2/data/D419-D410-D376T02
# zcat /data/tmp/mvromman/20240610_run2/data/D410T02/D419-D410T02.R1.fastq.gz /data/tmp/mvromman/20240610_run2/data/D376T02/D376T02.R1.fastq.gz | gzip -c > /data/tmp/mvromman/20240610_run2/data/D419-D410-D376T02/D419-D410-D376T02.R1.fastq.gz
# mkdir /data/tmp/mvromman/20240610_run2/data/D419-D410-D376T03
# zcat /data/tmp/mvromman/20240610_run2/data/D410T03/D419-D410T03.R1.fastq.gz /data/tmp/mvromman/20240610_run2/data/D376T03/D376T03.R1.fastq.gz | gzip -c > /data/tmp/mvromman/20240610_run2/data/D419-D410-D376T03/D419-D410-D376T03.R1.fastq.gz
# mkdir /data/tmp/mvromman/20240610_run2/data/D419-D410-D376T04
# zcat /data/tmp/mvromman/20240610_run2/data/D410T04/D419-D410T04.R1.fastq.gz /data/tmp/mvromman/20240610_run2/data/D376T04/D376T04.R1.fastq.gz | gzip -c > /data/tmp/mvromman/20240610_run2/data/D419-D410-D376T04/D419-D410-D376T04.R1.fastq.gz
# mkdir /data/tmp/mvromman/20240610_run2/data/D419-D410-D376T05
# zcat /data/tmp/mvromman/20240610_run2/data/D410T05/D419-D410T05.R1.fastq.gz /data/tmp/mvromman/20240610_run2/data/D376T05/D376T05.R1.fastq.gz | gzip -c > /data/tmp/mvromman/20240610_run2/data/D419-D410-D376T05/D419-D410-D376T05.R1.fastq.gz
# mkdir /data/tmp/mvromman/20240610_run2/data/D419-D410-D376T06
# zcat /data/tmp/mvromman/20240610_run2/data/D410T06/D419-D410T06.R1.fastq.gz /data/tmp/mvromman/20240610_run2/data/D376T06/D376T06.R1.fastq.gz | gzip -c > /data/tmp/mvromman/20240610_run2/data/D419-D410-D376T06/D419-D410-D376T06.R1.fastq.gz
# mkdir /data/tmp/mvromman/20240610_run2/data/D419-D410-D376T07
# zcat /data/tmp/mvromman/20240610_run2/data/D410T07/D419-D410T07.R1.fastq.gz /data/tmp/mvromman/20240610_run2/data/D376T07/D376T07.R1.fastq.gz | gzip -c > /data/tmp/mvromman/20240610_run2/data/D419-D410-D376T07/D419-D410-D376T07.R1.fastq.gz
# mkdir /data/tmp/mvromman/20240610_run2/data/D419-D410-D376T08
# zcat /data/tmp/mvromman/20240610_run2/data/D410T08/D419-D410T08.R1.fastq.gz /data/tmp/mvromman/20240610_run2/data/D376T08/D376T08.R1.fastq.gz | gzip -c > /data/tmp/mvromman/20240610_run2/data/D419-D410-D376T08/D419-D410-D376T08.R1.fastq.gz
# mkdir /data/tmp/mvromman/20240610_run2/data/D419-D410-D376T09
# zcat /data/tmp/mvromman/20240610_run2/data/D410T09/D419-D410T09.R1.fastq.gz /data/tmp/mvromman/20240610_run2/data/D376T09/D376T09.R1.fastq.gz | gzip -c > /data/tmp/mvromman/20240610_run2/data/D419-D410-D376T09/D419-D410-D376T09.R1.fastq.gz
# mkdir /data/tmp/mvromman/20240610_run2/data/D419-D410-D376T10
# zcat /data/tmp/mvromman/20240610_run2/data/D410T10/D419-D410T10.R1.fastq.gz /data/tmp/mvromman/20240610_run2/data/D376T10/D376T10.R1.fastq.gz | gzip -c > /data/tmp/mvromman/20240610_run2/data/D419-D410-D376T10/D419-D410-D376T10.R1.fastq.gz
# mkdir /data/tmp/mvromman/20240610_run2/data/D419-D410-D376T11
# zcat /data/tmp/mvromman/20240610_run2/data/D410T11/D419-D410T11.R1.fastq.gz /data/tmp/mvromman/20240610_run2/data/D376T11/D376T11.R1.fastq.gz | gzip -c > /data/tmp/mvromman/20240610_run2/data/D419-D410-D376T11/D419-D410-D376T11.R1.fastq.gz
# mkdir /data/tmp/mvromman/20240610_run2/data/D419-D410-D376T12
# zcat /data/tmp/mvromman/20240610_run2/data/D410T12/D419-D410T12.R1.fastq.gz /data/tmp/mvromman/20240610_run2/data/D376T12/D376T12.R1.fastq.gz | gzip -c > /data/tmp/mvromman/20240610_run2/data/D419-D410-D376T12/D419-D410-D376T12.R1.fastq.gz
# mkdir /data/tmp/mvromman/20240610_run2/data/D419-D410-D376T13
# zcat /data/tmp/mvromman/20240610_run2/data/D410T13/D419-D410T13.R1.fastq.gz /data/tmp/mvromman/20240610_run2/data/D376T13/D376T13.R1.fastq.gz | gzip -c > /data/tmp/mvromman/20240610_run2/data/D419-D410-D376T13/D419-D410-D376T13.R1.fastq.gz
# mkdir /data/tmp/mvromman/20240610_run2/data/D419-D410-D376T14
# zcat /data/tmp/mvromman/20240610_run2/data/D410T14/D419-D410T14.R1.fastq.gz /data/tmp/mvromman/20240610_run2/data/D376T14/D376T14.R1.fastq.gz | gzip -c > /data/tmp/mvromman/20240610_run2/data/D419-D410-D376T14/D419-D410-D376T14.R1.fastq.gz
# mkdir /data/tmp/mvromman/20240610_run2/data/D419-D410-D376T15
# zcat /data/tmp/mvromman/20240610_run2/data/D410T15/D419-D410T15.R1.fastq.gz /data/tmp/mvromman/20240610_run2/data/D376T15/D376T15.R1.fastq.gz | gzip -c > /data/tmp/mvromman/20240610_run2/data/D419-D410-D376T15/D419-D410-D376T15.R1.fastq.gz
# mkdir /data/tmp/mvromman/20240610_run2/data/D419-D410-D376T16
# zcat /data/tmp/mvromman/20240610_run2/data/D410T16/D419-D410T16.R1.fastq.gz /data/tmp/mvromman/20240610_run2/data/D376T16/D376T16.R1.fastq.gz | gzip -c > /data/tmp/mvromman/20240610_run2/data/D419-D410-D376T16/D419-D410-D376T16.R1.fastq.gz
# mkdir /data/tmp/mvromman/20240610_run2/data/D419-D410-D376T17
# zcat /data/tmp/mvromman/20240610_run2/data/D410T17/D419-D410T17.R1.fastq.gz /data/tmp/mvromman/20240610_run2/data/D376T17/D376T17.R1.fastq.gz | gzip -c > /data/tmp/mvromman/20240610_run2/data/D419-D410-D376T17/D419-D410-D376T17.R1.fastq.gz
# mkdir /data/tmp/mvromman/20240610_run2/data/D419-D410-D376T18
zcat /data/tmp/mvromman/20240610_run2/data/D410T18/D419-D410T18.R1.fastq.gz /data/tmp/mvromman/20240610_run2/data/D376T18/D376T18.R1.fastq.gz | gzip -c > /data/tmp/mvromman/20240610_run2/data/D419-D410-D376T18/D419-D410-D376T18.R1.fastq.gz
