#' Suggest Random Cocktail
#'
#' Suggest a random cocktail based on category.
#'
#' @param category A character string specifying the category of the drink (e.g., "Cocktail", "Shot").
#' @return A list containing the randomly selected cocktail recipe.
#' @export
suggest_random <- function(category = c("Cocktail", "Shot", "Beer", "Milk / Float / Shake", "Ordinary Drink", "Other/Unknown", "Homemade Liqueur", "Punch / Party Drink", "Coffee / Tea", "Soft Drink / Soda", "Cocoa")) {
  recipes <- load_recipes()
  category_recipes <- filter_category(recipes, category)
  if (nrow(category_recipes) == 0) {
    return("No matching cocktails found.")
  } else {
    r <- category_recipes[sample(nrow(category_recipes), 1), ]
    return(list(
      Name = r$strDrink,
      ID = r$idDrink,
      Alcoholic = r$strAlcoholic,
      Category = r$strCategory,
      Ingredients = r$Ingredients,
      Measurements = r$Measurements,
      Instructions = r$strInstructions
    ))
  }
}

# Helper function to filter recipes based on category
filter_category <- function(recipes, category) {
  recipes <- recipes[recipes$strCategory == category, ]
  recipes
}
