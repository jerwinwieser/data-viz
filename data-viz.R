library(tidyverse)
library(timetk)

# conver dataset to tibble class
df <- tk_tbl(
  data = AirPassengers,
  preserve_index = TRUE,
  rename_index = "index",
  timetk_idx = FALSE,
  silent = FALSE
)

# separate to vars month and year  
df <- df %>% 
  separate(
    col = index,
    into = c("month", "year"),
    sep = " ")

