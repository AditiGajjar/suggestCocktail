library(dplyr)
#' Load Recipes
#'
#' Load and clean the database of cocktail recipes.
#'
#' @return A data frame containing the cleaned cocktail recipes.
#' @export
load_recipes <- function() {
  file_path <- system.file(file.path("extdata", "all_drinks.csv"), package = "suggestCocktail")
  recipes <- suppressMessages(suppressWarnings(read.csv(file_path)))

  # ingredients into one column
  ingredient_columns <- grep("^strIngredient", names(recipes), value = TRUE)
  recipes$Ingredients <- apply(recipes[ingredient_columns], 1, function(x) paste(na.omit(x), collapse = ", "))

  # measurements into one column
  measure_columns <- grep("^strMeasure", names(recipes), value = TRUE)
  recipes$Measurements <- apply(recipes[measure_columns], 1, function(x) paste(na.omit(x), collapse = ", "))

  # keep only necessary columns
  recipes <- recipes[, c("strDrink", "idDrink", "strAlcoholic", "strCategory", "Ingredients", "Measurements", "strInstructions")]

  # remove rows with no ingredients
  recipes <- recipes[recipes$Ingredients != "", ]

  return(data.frame(recipes))
}
