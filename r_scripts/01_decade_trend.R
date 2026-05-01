# 01_decade_trend.R
# Purpose: Replicate SQL Query 7 in R, then visualize with ggplot2.
# Data: OWID energy dataset, World renewable share by decade.
# Author: Ravinder Deep Singh Bindra

# Load libraries
library(readr)    # for read_csv
library(dplyr)    # for the 5 verbs
library(ggplot2)  # for plotting

# Load the CSV (same one we loaded into SQLite)
energy <- read_csv("data/energy_data.csv")

# Quick peek — like df.head() in pandas
head(energy)

# Replicate Query 7: World renewable share, averaged by decade
decade_trend <- energy %>%
  filter(country == "World") %>%
  filter(!is.na(renewables_share_energy)) %>%
  mutate(decade = (year %/% 10) * 10) %>%
  group_by(decade) %>%
  summarize(avg_renewables_pct = round(mean(renewables_share_energy), 2)) %>%
  arrange(decade)

# Print it to the console
print(decade_trend)

# Plot it as a line chart with points (the right viz for time series)
p <- ggplot(decade_trend, aes(x = decade, y = avg_renewables_pct)) +
  geom_line(color = "#1F3864", linewidth = 1.2) +
  geom_point(color = "#1F3864", size = 3) +
  labs(
    title = "Global Renewable Energy Share by Decade",
    subtitle = "World total, 1965-2022 (decade averages)",
    x = "Decade",
    y = "Renewables share of primary energy (%)",
    caption = "Source: Our World in Data"
  ) +
  theme_minimal(base_size = 13)

print(p)

# Save the chart to disk (so we can put it in the README later)
ggsave("r_scripts/decade_trend.png", width = 8, height = 5, dpi = 150)