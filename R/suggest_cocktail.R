#' Suggest Cocktail
#'
#' Suggest a cocktail recipe based on available ingredients.
#'
#' @param ingredients A character vector of available ingredients.
#' @return A list containing the suggested cocktail recipes.
#' @export
suggest_cocktail <- function(ingredients) {
  recipes <- load_recipes()
  filtered_recipes <- filter_ingredients(recipes, ingredients)
  if (nrow(filtered_recipes) == 0) {
    return("No matching cocktails found.")
  } else {
    structured_recipes <- lapply(1:nrow(filtered_recipes), function(i) {
      list(
        Name = filtered_recipes$strDrink[i],
        ID = filtered_recipes$idDrink[i],
        Alcoholic = filtered_recipes$strAlcoholic[i],
        Category = filtered_recipes$strCategory[i],
        Ingredients = filtered_recipes$Ingredients[i],
        Measurements = filtered_recipes$Measurements[i],
        Instructions = filtered_recipes$strInstructions[i]
      )
    })
    return(structured_recipes)
  }
}

# Helper function to filter recipes based on ingredients
filter_ingredients <- function(recipes, ingredients) {
  recipes <- recipes[apply(recipes, 1, function(row) {
    recipe_ingredients <- unlist(strsplit(row["Ingredients"], ", "))
    all(ingredients %in% recipe_ingredients)
  }), ]
  return(recipes)
}
