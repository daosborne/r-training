# script to process all_graves.csv data
# from Brownlee (2021) Grave Goods in Early Medieval Europe
# DOI: https://doi.org/10.11141/ia.56.11
#
# Author: David Osborne
#   Date: 2023-07-06

library(tidyverse)
all_graves <- read_csv('all_graves.csv')

# --------------------------------------
# number of graves in each cemetery
all_graves %>% 
  count(cemetery) %>% 
  print(n = 200)  # display full list

cemeteries <- all_graves %>% 
  group_by(region) %>% 
  count(cemetery) %>% 
  add_tally()

cemeteries %>%
  ggplot(aes(cemetery, n, fill = region)) +
  geom_col(position = 'dodge') +
  theme(axis.text.x = element_blank(),
        axis.ticks.x = element_blank())
  
