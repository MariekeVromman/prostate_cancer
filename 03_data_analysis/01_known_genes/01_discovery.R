
#' ---
#' title: "check first results linear data"
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

fc = read_tsv('data/20240603_all_fc_anno.txt')

fc$disease_status = factor(fc$disease_status,
                             levels = c('cancer', 'hyperplasia', 'hypertrophie',
                                        'non-tumoral', 'healthy'))

fc %>%
  filter(gene_name == "PCA3") %>%
  #filter(duplicate == 'yes') %>%
  ggplot(aes(disease_status, count, fill = disease_status)) +
  geom_boxplot() +
  geom_point(alpha = 0.5) +
  scale_fill_manual(values = c('#CA0020', '#F4A582', '#92C5DE', '#B8E186', '#4DAC26')) +
  mytheme_discrete_x +
  xlab('') +
  scale_y_continuous(labels = scales::comma_format()) #+
  #facet_grid(~seq_run)

fc %>%
  filter(duplicate == 'yes') %>%
  select(ENSG, gene_name, count, seq_run, ID_sample, gene_type) %>%
  pivot_wider(names_from = seq_run, values_from = count) %>%
  filter(!(D1271 == 0 & D1745 == 0)) %>%
  mutate(gene_type_cat = ifelse(gene_type == 'protein_coding', 'protein_coding', 'other'),
         gene_type_cat = ifelse(gene_type == 'lncRNA', 'lncRNA', gene_type_cat)) %>%
  ggplot(aes(D1271, D1745)) +
  geom_point() +
  scale_x_log10(labels = scales::comma_format()) +
  scale_y_log10(labels = scales::comma_format()) +
  geom_abline(color = '#CA0020') +
  facet_wrap(~gene_type_cat, nrow = 1) +
  coord_fixed()

anno %>% filter(duplicate == 'yes')
