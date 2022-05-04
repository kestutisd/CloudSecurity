library(tidyverse)
library(knitr)
data <- read_csv("BalloonRace_ DataBreaches.csv")


data %>%
  group_by(method, year) %>%
  summarise(n = n()) %>%
  ggplot(aes(x = year, y = n, fill = method)) +
  geom_col() +
  theme_classic() +
  ylab("")

data %>%
  mutate(sector = str_remove_all(sector, ",.*")) %>%
  group_by(sector) %>%
  summarise(n = n(), record = sum(`records lost`))  %>%
  arrange(desc(n)) %>%
  kable()


