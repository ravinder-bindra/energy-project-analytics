
# 02_fossil_analysis.R
# Purpose: Analyze trends in fossil fuel dependence across countries (2000-2022).
# Outputs: 3 ggplot charts + 1 summary CSV.
# Author: Ravinder Deep Singh Bindra

library(readr)
library(dplyr)
library(ggplot2)
library(tidyr)
library(scales)

# Load the cleaned CSV from yesterday's Python notebook
energy <- read_csv("data/cleaned_energy.csv")

cat("Loaded:", nrow(energy), "rows,", ncol(energy), "columns\n")
cat("Years:", min(energy$year), "to", max(energy$year), "\n")
cat("Countries:", n_distinct(energy$country), "\n")