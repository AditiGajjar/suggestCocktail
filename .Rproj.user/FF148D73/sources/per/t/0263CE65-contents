library(tidyverse)
#' Load Recipes
#'
#' Load and clean a database of cocktail recipes.
#'
#' @return A data.frame containing the cleaned cocktail recipes.
#' @export
load_recipes <- function() {
  file_path <- file.path("R", "all_drinks.csv")
  recipes <- suppressMessages(suppressWarnings(read_csv(file_path)))

  # Combine ingredient columns into a single column
  ingredient_columns <- grep("^strIngredient", names(recipes), value = TRUE)
  recipes$Ingredients <- apply(recipes[ingredient_columns], 1, function(x) paste(na.omit(x), collapse = ", "))

  # Combine measurement columns into a single column
  measure_columns <- grep("^strMeasure", names(recipes), value = TRUE)
  recipes$Measurements <- apply(recipes[measure_columns], 1, function(x) paste(na.omit(x), collapse = ", "))

  # Keep only necessary columns
  recipes <- recipes[, c("strDrink", "idDrink", "strAlcoholic", "strCategory", "Ingredients", "Measurements", "strInstructions")]

  # Remove rows with no ingredients
  recipes <- recipes[recipes$Ingredients != "", ]

  return(recipes)
}
