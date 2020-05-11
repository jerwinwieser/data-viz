library(tidyverse)
library(timetk)
library(gganimate)
library(gapminder)

# conver dataset to tibble class
df <- tk_tbl(
  data = AirPassengers,
  preserve_index = TRUE,
  rename_index = "time",
  timetk_idx = FALSE,
  silent = FALSE
)

# add new var 'airline'
df <- df %>% 
  mutate(airline = "klm")
 
# # separate to vars month and year  
# df <- df %>% 
#   separate(
#     col = index,
#     into = c("month", "year"),
#     sep = " ")

#------------------
# check gapminder data
#------------------

p <- ggplot(
  gapminder, 
  aes(x = gdpPercap, y=lifeExp, size = pop, colour = country)
) +
  geom_point(show.legend = FALSE, alpha = 0.7) +
  scale_color_viridis_d() +
  scale_size(range = c(2, 12)) +
  scale_x_log10() +
  labs(x = "GDP per capita", y = "Life expectancy")


p + transition_time(year) +
  labs(title = "Year: {frame_time}") +
  shadow_wake(wake_length = 0.1, alpha = FALSE)


file_renderer(dir = ".", prefix = "gganim_plot", overwrite = FALSE)

