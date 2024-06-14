
#' ---
#' title: "tidy STAR + FC data"
#' author: "Marieke Vromman"
#' output: 
#'    html_document:
#'       toc: TRUE
#'       toc_float: TRUE
#'       theme: paper
#'       df_print: paged
#'       highlight: tango
#' ---
#' 

#' # File set-up

#' ## Set working directory to current directory
if (rstudioapi::isAvailable()) {
  setwd(dirname(rstudioapi::getActiveDocumentContext()$path))
}

#' ## Load standard libraries and resolves conflicts
library(tidyverse)
library(conflicted)
conflict_prefer("filter", "dplyr")
conflict_prefer("select", "dplyr")
conflict_prefer("slice", "dplyr")
conflict_prefer("rename", "dplyr")
conflict_prefer('intersect', 'dplyr')
conflicts_prefer(dplyr::count)

#' # Read in data

fc = tibble()

sample_list = list.dirs('data')

for (sample in sample_list) {
  
  sample_id = str_split(sample, '/')[[1]][2]

  file_path = paste("data/", 
                    sample_id, "/", sample_id, "_FC.txt", 
                    sep = "")
  
  if (file.exists(file_path)) {
    
    fc = fc %>%
      bind_rows(
        read_tsv(file_path,
                 skip = 2,
                 col_names = c('ENSG', 'chr', 'start', 'end', 'strand', 'length', 
                               'gene_id', 'gene_name', 'gene_type', 'count')) %>%
          mutate(ID_NGS = sample_id)) 
  }
}

fc

#' # Tidy the dataframe
#' remove double columns

fc %>% filter(!ENSG == gene_id)

fc = fc %>%
  select(-gene_id)

#' save tidy dataframe

fc %>% write_tsv('../data/20240502_all_fc.txt')

fc = read_tsv('../data/20240502_all_fc.txt')


#' # add annotation

#' read in annotation
anno = read_tsv('../00_sample_annotation/sample_annotation.txt')

anno

# add info about double samples

anno = anno %>%
  group_by(ID_sample) %>%
  mutate(duplicate = ifelse((n()> 1), 'yes', 'no')) %>%
  ungroup()

fc = fc %>% full_join(anno)

fc %>% write_tsv('data/20240603_all_fc_anno.txt')

