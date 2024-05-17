#' Suggest Cocktail
#'
#' Suggest a cocktail recipe based on available ingredients.
#'
#' @param ingredients A character vector of available ingredients.
#' @return A data.frame containing the suggested cocktail recipes.
#' @export
suggest_cocktail <- function(ingredients) {
  recipes <- load_recipes()
  filtered_recipes <- filter_ingredients(recipes, ingredients)
  if (nrow(filtered_recipes) == 0) {
    return("No matching cocktails found.")
  } else {
    return(filtered_recipes)
  }
}

# Helper function to validate ingredients
valid_ingredients <- function(recipes, ingredients) {
  unique(unlist(recipes$Ingredients)) %in% ingredients
}
