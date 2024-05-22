test_that("load_recipes function works correctly", {
  recipes <- load_recipes()

  # data frame is not empty
  expect_true(nrow(recipes) > 0)

  # specific columns are present
  expect_true(all(c("strDrink", "idDrink", "strAlcoholic", "strCategory", "Ingredients", "Measurements", "strInstructions") %in% colnames(recipes)))

  # some known values are present
  expect_true("Malibu Twister" %in% recipes$strDrink)
})
