library(testthat)


test_that("suggest_random function works correctly", {
  category <- "Cocktail"
  random_cocktail <- suggest_random(category)

  # Check that the result is a list
  expect_true(is.list(random_cocktail))

  # Check that the list contains the expected elements
  expect_true(all(c("Name", "ID", "Alcoholic", "Category", "Ingredients", "Measurements", "Instructions") %in% names(random_cocktail)))

  # Check that the values are not empty
  expect_true(nchar(random_cocktail$Name) > 0)
  expect_true(nchar(random_cocktail$ID) > 0)
  expect_true(nchar(random_cocktail$Alcoholic) > 0)
  expect_true(nchar(random_cocktail$Category) > 0)
  expect_true(nchar(random_cocktail$Ingredients) > 0)
  expect_true(nchar(random_cocktail$Instructions) > 0)
})

test_that("suggest_random function returns 'No matching cocktails found' for empty category", {
  category <- "Nonexistent Category"
  result <- suggest_random(category)

  # Check that the result is a string with the expected message
  expect_true(is.character(result))
  expect_equal(result, "No matching cocktails found.")
})
