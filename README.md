# prostate_cancer
This repository contains all scripts and analysis performed for the HOPE project, in collab with Anna Almeida.

The data consists out of a large number of samples form different cohorts (a discovery/HOPE cohort and a validation cohort) and different sequencing runs (see table below). The annotation file `03_data_analysis/00_sample_annotation/sample_annotation.txt` should hold all relevant information. However, some annotation is currently still missing. See also the excel files in Teams `General - Prostate urine cohorte EV`.  
A paper related to this topic: [Tao et al, Cell Reports Medicine, 2023](https://www.cell.com/cell-reports-medicine/fulltext/S2666-3791(23)00417-2?_returnURL=https%3A%2F%2Flinkinghub.elsevier.com%2Fretrieve%2Fpii%2FS2666379123004172%3Fshowall%3Dtrue#%20).

Currently (14/06/2024), there are 284 samples included in the analysis.

run_id | nr_samples | sequencing date | analysis batch | remark
--- | --- | --- | --- | ---
A1097 | 9 samples | 24/12/2018 | run2 | only validation samples
D268 | 82 samples | 04/02/2020 | run2 | only validation samples
D419-D410-D376 | 18 samples | 04/09/2020 | run2 | only validation samples
D577 | 53 samples | 12/03/2021 | run2 | only validation samples
D623 | 25 samples | 30/04/2021 | run2 | 7 validation samples and 18 cell line samples
D1271 | 43 samples | 27/01/2023 | run1 | mostly discovery/HOPE cohort (with 8 overlapping samples)
D1745 | 54 samples | 04/04/2024	| run1 | mostly discovery/HOPE cohort (with 8 overlapping samples)


> [!WARNING]  
> 8 healthy samples were library prepped and sequenced twice (123-007, 123-010, 123-013, 123-014, 123-015, 123-016, 123-027, 123-029) in sequencing runs D1271 and D1745. These repeated samples are meant for normalization as sequencing run D1271 contains mostly healthy samples and D1745 contains mostly cancer samples.

> [!WARNING]
> 1 sample was library prepped and/or sequenced twice (092_HEN) in run D268 and run A1097. Only the data from the most recent run D268 is kept.

> [!WARNING]
> 18 samples were sequenced twice (F2_ENC, F3_TAL, F4_PIN, F5_BOU, F6_SAL, F8_KAR, F9_RAD, F10_MES, F11_ZIZ, F12_ABE, F13_AUR, F14_RIV, F16_GEN, F17_TRA, F18_THE, F19_TIX, F20_THA, F21_BEN) in run D419-D410 and D376. The fastq file of these samples were merged at the beginning of the analyses and termed 'D419-D410-D376'.

This repository contains 4 folders
1. **data**  
This folders contains the output data from mapping the fastq files with STAR and generating counts with FeatureCounts, and the output data from running the circRNA pipeline. As this is a big folder, it is not included in the github repo itself, but it is present on the hard disk. 

2. **scripts**  
This folder contains al scripts used on the cluster to generate the data in the `data` folder.
  
    - first, the scripts to download the references, to download the data and to merge two sequencing runs (see warning above).
    - then, the scripts to run run `STAR` and `FeatureCounts` were run to generate counts for each sample
    - also, the script to detect circRNAs using the nf-core [circRNA pipeline](https://github.com/nf-core/circrna).
      - This pipeline is currently under development and no stable version has been published yet. Running it requires some optimization and it's possible to run into errors. Often, these errors are fixed by reruning/resuming the pipeline. The nf-core community is very helpful and question can be asked thourgh the dedicated [Slack `#circrna` channel](https://nfcore.slack.com/channels/circrna).
      - For consistency, the circRNA pipeline was run with this specific [commit](https://github.com/nf-core/circrna/commit/c29124feafb089482cbb709f01c648b74139460a): `c29124f`
      - Mostly, default parameters are used.
      - As some of the samples are quite large, some adjustments were made to avoid errors:
        - `"limitSjdbInsertNsj": 10000000`, required for the STAR process to run (see `02_scripts/02_circ/run2/20240610_run_circ.sh`)
        - a `env.TMPDIR` was asigned, required for the CIRCRNA_FINDER_FILTER process to run (see `02_scripts/02_circ/run2/20240610_nf.config`)
        - the ANNOTATION process was granted more memory (see `02_scripts/02_circ/run2/20240610_nf.config`)



3. **data-analysis**  
This folder contains the R scripts used to analyse the data further, and to generate the figures.

4. **figures**  
This folder contains all the generated figures. See also the presentation on Teams in `General - Prostate urine cohorte EV/presentations/prostate_updates_MV.pptx`.
