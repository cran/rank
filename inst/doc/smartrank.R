## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup--------------------------------------------------------------------
library(rank)

## -----------------------------------------------------------------------------
fruits <- c("Apple", "Orange", "Apple", "Pear", "Orange")

# rank alphabetically
smartrank(fruits)

# rank based on frequency
smartrank(fruits, sort_by = "frequency")

# rank based on descending order of frequency
smartrank(fruits, sort_by = "frequency", desc = TRUE)

## -----------------------------------------------------------------------------
# rank numerically
smartrank(c(1, 3, 2))

# rank numerically based on descending order
smartrank(c(1, 3, 2), desc = TRUE)

## -----------------------------------------------------------------------------
fruits <- c("Apple", "Orange", "Apple", "Pear", "Orange")
ranks <- smartrank(fruits, sort_by = "frequency")
fruits[order(ranks)]

## -----------------------------------------------------------------------------
data = data.frame(
    fruits = c("Apple", "Orange", "Apple", "Pear", "Orange"),
    picker = c("Elizabeth", "Damian",  "Bob", "Cameron", "Alice")
)

# Rank fruits so the most frequently picked fruits will come first
fruit_ranks <- smartrank(data$fruits, sort_by = "frequency", desc=TRUE) 


# Rank pickers in alphabetical order
picker_ranks <- smartrank(data$picker, sort_by = "alphabetical", desc=FALSE) 

# Sort dataframe by the fruit_ranks, then the picker_ranks (hierarchical)
data[order(fruit_ranks, picker_ranks),]

## -----------------------------------------------------------------------------
library(dplyr)

arrange(
  data, 
  smartrank(fruits, "frequency", desc = TRUE), 
  smartrank(picker, "alphabetical", desc = FALSE)
)

