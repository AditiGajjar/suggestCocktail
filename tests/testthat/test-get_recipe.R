
test_that("get_recipe function works correctly", {
  cocktail_name <- "Ruby Tuesday"
  recipe <- get_recipe(cocktail_name)

  # result is a list/character string
  expect_true(is.list(recipe) || is.character(recipe))

  # if list, perform further checks
  if (is.list(recipe)) {
    # list is not empty
    expect_true(length(recipe) > 0)

    # element in the list contains the expected elements
    expect_true(all(c("Name", "ID", "Alcoholic", "Category", "Ingredients", "Measurements", "Instructions") %in% names(recipe)))

    # values are not empty
    expect_true(all(nchar(recipe$Name) > 0,
                    nchar(recipe$ID) > 0,
                    nchar(recipe$Alcoholic) > 0,
                    nchar(recipe$Category) > 0,
                    nchar(recipe$Ingredients) > 0,
                    nchar(recipe$Measurements) > 0,
                    nchar(recipe$Instructions) > 0))
  } else {
    # result is the expected message when no match is found
    expect_equal(recipe, "Cocktail not found.")
  }
})
