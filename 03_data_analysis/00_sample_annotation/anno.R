
#' ---
#' title: "Look at sample types"
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

#' ## Set figure theme
mytheme = theme_bw(base_size = 10) + 
  theme(text = element_text(size=10, colour='black'),
        title = element_text(size=10, colour='black'),
        line = element_line(linewidth=0.5),
        axis.title = element_text(size=10, colour='black'),
        axis.text = element_text(size=10, colour='black'),
        axis.line = element_line(colour = "black"),
        axis.ticks = element_line(linewidth=0.5),
        strip.background = element_blank(),
        strip.text.y = element_blank(),
        panel.grid = element_blank(),
        panel.border = element_blank(),
        legend.text=element_text(size=10)) 

mytheme_discrete_x = mytheme + 
  theme(axis.text.x = element_text(angle = 45, hjust = 1, vjust = 1))


#' ## Read data

anno = read_tsv('sample_annotation.txt')

anno

anno$disease_status = factor(anno$disease_status,
                             levels = c('cancer', 'adenome', 'hyperplasia', 'hypertrophie', 
                                        'prostatitis', 'non-tumoral', 'healthy', 'unknown'))


anno %>%
  group_by(disease_status, cohort) %>%
  summarise(nr = n()) %>%
  ungroup() %>%
  ggplot(aes(cohort, nr, fill = disease_status, label = nr)) +
  geom_bar(stat = 'identity') +
  geom_text(position = position_stack(vjust = 0.5)) +
  #facet_grid(~seq_run) +
  mytheme_discrete_x +
  scale_fill_manual(values = c('#d73027', '#fc8d59', '#fee08b', '#ffffbf', 
                               '#d9ef8b', '#91cf60', '#1a9850', 'grey')) +
  theme(legend.title = element_blank())

