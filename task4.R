# Task 4 of the KI-RIKEN course 2024

# Packages
library(data.table)

# Read in the data(CO2)
data(CO2)
help(data(CO2))

df <- as.data.table(CO2)
mean(df$uptake)
median(df$uptake)

# Airway data
BiocManager::install("airway")
library(airway)
data(airway)
airway_matrix <- assay(airway)

# Count rows where all columns have the value 0
num_zero_rows <- sum(rowSums(airway_matrix == 0) == ncol(airway_matrix))
print(num_zero_rows)

# Genes expressed per sample (non-0 values per column)
expressed_in_samples <- colSums(airway_matrix > 0)

                    