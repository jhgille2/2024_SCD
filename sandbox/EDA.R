##################################################
## Project: 2024 SCD
## Script purpose: Data wrangling and visualization of 2024 SCD data
## Date: 2024-07-18
## Author: Jay Gillenwater
##################################################
rm(list = ls())

## Section: Loading packages and data
##################################################

# Load packages and required targets
# Install pacman if it is not already installed
if (!require("pacman")) install.packages("pacman")

# Load required packages
pacman::p_load(tidyr,
               dplyr,
               ggplot2,
               stringr,
               ggthemes)

# The path to the 2024 SCD data
scd_file_path <- "./data/2024 SCD for R.csv" 

# Read in the SCD data
scd_df <- read.csv(scd_file_path)

# Pivot the SCD data to a long format so that it is ready for plotting with
# ggplot
scd_df_long <- scd_df %>%
  pivot_longer(cols = c("HUG.SCD", "CAS.SCD", "PLY.SCD"), names_to = "Location") %>%
  mutate(Location = str_remove(Location, "\\.SCD"),
         Location = factor(Location))

# Make a histogram of the SCD data
ggplot(scd_df_long, aes(x = value, fill = Location)) + 
  geom_histogram(color = "black")


