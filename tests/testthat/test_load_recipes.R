
library(testthat)
library(suggestCocktail)

test_that("load_recipes function works correctly", {
  recipes <- load_recipes()
  expect_true(nrow(recipes) > 0)
  expect_true(all(c("strDrink", "idDrink", "strAlcoholic", "strCategory", "Ingredients", "Measurements", "strInstructions") %in% colnames(recipes)))
  expect_true("Malibu Twister" %in% recipes$strDrink)
})
