# script to process regional data from all_graves.csv file
# from Brownlee (2021) Grave Goods in Early Medieval Europe
# DOI: https://doi.org/10.11141/ia.56.11
#
# Author: David Osborne
#   Date: 2023-07-07

all_graves <- read_csv('all_graves.csv')

regions <- all_graves %>% 
  count(region)

# ------------------------------------------------------------------
# simple bar chart
regions %>% 
  ggplot(aes(region, n)) %>% 
  geom_bar(stat = "identity")

# ------------------------------------------------------------------
# store plot for further variations
p <- regions %>% 
  ggplot(aes(region, n))

# bar chart with rotated x axis labels
p + 
  geom_bar(stat = "identity") +
  theme(axis.text.x = element_text(angle = 90))

# bar chart with region labels at 45 degrees, justified to x axis
p + 
  geom_bar(stat = "identity") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

# bar chart with filled bars and legend, without x axis labels/ticks
p + 
  geom_bar(aes(fill = region), stat = "identity") +
  theme(axis.text.x = element_blank(),
        axis.ticks.x = element_blank())

# ------------------------------------------------------------------
# just regions in England
england <- regions %>% 
  filter(grepl("England", region))
# alternatively
england <- regions %>% 
  filter(str_detect(region, "England"))

# don't forget Kent!
england <- regions %>% 
  filter(str_detect(region, "England|Kent"))

# bar chart, using geom_col() instead of geom_bar(),
# with fills according to region, without x axis labels/ticks
england %>% 
  ggplot(aes(region, n, fill = region)) +
  geom_col() + 
  theme(axis.text.x = element_blank(),
        axis.ticks.x = element_blank(),
        axis.title.x = element_blank()) +
  labs(y = 'number of graves')

