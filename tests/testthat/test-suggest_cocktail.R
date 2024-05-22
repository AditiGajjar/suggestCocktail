

test_that("suggest_cocktail function works correctly", {
  ingredients <- c("Vodka", "Cranberry juice", "Orange juice")
  suggested_cocktails <- suggest_cocktail(ingredients)

  # result is a list/character string
  expect_true(is.list(suggested_cocktails) || is.character(suggested_cocktails))

  # if list, perform further checks
  if (is.list(suggested_cocktails)) {
    # list is not empty
    expect_true(length(suggested_cocktails) > 0)

    # each element in the list contains the expected elements
    expect_true(all(sapply(suggested_cocktails, function(cocktail) {
      all(c("Name", "ID", "Alcoholic", "Category", "Ingredients", "Measurements", "Instructions") %in% names(cocktail))
    })))

    # values are not empty
    expect_true(all(sapply(suggested_cocktails, function(cocktail) {
      all(nchar(cocktail$Name) > 0,
          nchar(cocktail$ID) > 0,
          nchar(cocktail$Alcoholic) > 0,
          nchar(cocktail$Category) > 0,
          nchar(cocktail$Ingredients) > 0,
          nchar(cocktail$Measurements) > 0,
          nchar(cocktail$Instructions) > 0)
    })))
  } else {
    # result is the expected message when no match is found
    expect_equal(suggested_cocktails, "No matching cocktails found.")
  }
})
