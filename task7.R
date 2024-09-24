# Task 7

# Packages
library(tidyverse)
library(devtools)
devtools::install_github("hirscheylab/tidybiology")
library(tidybiology)

# Access data
data(chromosome)
summary(chromosome)

# Plot the chromosome size distribution
ggplot(chromosome, aes(x = id, y = basepairs)) +
  geom_bar()
