#' Get Recipe
#'
#' Get the recipe for a specific cocktail by name.
#'
#' @param cocktail_name A character string specifying the name of the cocktail.
#' @return A data.frame containing the cocktail recipe.
#' @export
get_recipe <- function(cocktail_name) {
  recipes <- load_recipes()
  recipe <- filter_recipe(recipes, cocktail_name)
  if (nrow(recipe) == 0) {
    return("Cocktail not found.")
  } else {
    return(list(
      Name = recipe$strDrink,
      ID = recipe$idDrink,
      Alcoholic = recipe$strAlcoholic,
      Category = recipe$strCategory,
      Ingredients = recipe$Ingredients,
      Measurements = recipe$Measurements,
      Instructions = recipe$strInstructions
    ))
  }
}

# Helper function to filter recipes based on name
filter_recipe <- function(recipes, cocktail_name) {
  recipes <- recipes[recipes$Drink == cocktail_name, ]
  recipes
}
