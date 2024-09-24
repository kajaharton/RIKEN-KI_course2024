# Task 6 of the Assignment 1 for the KI-RIKEN course 2024

# Packages
library(data.table)
library(ggplot2)

# Load-in data
df <- fread("/Users/kajaharton/Desktop/KI-RIKEN course 2024/magic_guys.csv")

# Standard histogram
hist(df$length)

#ggplot histogram
ggplot(df, aes(x = length)) +
  geom_histogram() +
  labs(title = "Body length distribtuions", x = "Body length", y = "Frequency") +
  theme_minimal()

#ggplot boxplot
ggplot(df, aes(x = length)) +
  geom_boxplot() +
  labs(title = "Body length distributions", x = "Body length", y = "Frequency") +
  theme_minimal()

# load 2nd df
df2 <- fread("/Users/kajaharton/Desktop/KI-RIKEN course 2024/microarray_data.tab")
df2_NA <- colSums(is.na(df2))
df2_NA <- data.frame(
  column = names(df2_NA),
  na_count = df2_NA
)

ggplot(df2_NA, aes(y = column)) +
  geom_point() +
  labs(title = "Missing values per genes", x = "Gene", y = "NA frequency") +
  theme_minimal()

# Finding percentage of missing values per gene
na_percentage <- colSums(is.na(df2)) / nrow(df2) * 100

find_genes_with_na <- function(na_percentages, threshold) {
  genes_above_threshold <- names(na_percentages[na_percentages > threshold])
  return(genes_above_threshold)
}