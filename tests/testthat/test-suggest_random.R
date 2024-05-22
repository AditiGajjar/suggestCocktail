

test_that("suggest_random function works correctly", {
  random_cocktail <- suggest_random("Cocktail")

  # result is a list/character string
  expect_true(is.list(random_cocktail) || is.character(random_cocktail))

  # if list, perform further checks
  if (is.list(random_cocktail)) {
    # list is not empty
    expect_true(length(random_cocktail) > 0)

    # element in the list contains the expected elements
    expect_true(all(c("Name", "ID", "Alcoholic", "Category", "Ingredients", "Measurements", "Instructions") %in% names(random_cocktail)))
    # values are not empty
    expect_true(all(nchar(random_cocktail$Name) > 0,
                    nchar(random_cocktail$ID) > 0,
                    nchar(random_cocktail$Alcoholic) > 0,
                    nchar(random_cocktail$Category) > 0,
                    nchar(random_cocktail$Ingredients) > 0,
                    nchar(random_cocktail$Measurements) > 0,
                    nchar(random_cocktail$Instructions) > 0))
  } else {
    # result is the expected message when no match is found
    expect_equal(random_cocktail, "No matching cocktails found.")
  }
})
