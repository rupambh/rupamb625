test_that("Sidak's method works with all positive inputs.", {
  expect_equal(sidak(c(.1, .2, .3)), 0.271)
})

test_that("Sidak's method works with at least one zero input.", {
  expect_equal(sidak(c(0, .1, .2, .3)), 0)
})

test_that("Sidak's method works with at least one negative or >1 input.", {
  expect_equal(sidak(c(-.1, .1, .2, .3, 1.1)), 0.271)
})

test_that("Sidak's method works with at least one NA input.", {
  expect_equal(sidak(c(NA, .1, .2, .3)), 0.271)
})

test_that("Sidak's method works with zeros and negatives/>1s combined.", {
  expect_equal(sidak(c(-.1, 0, .1, .2, .3, 1.1)), 0)
})

test_that("Sidak's method works with NAs and negatives/>1s combined.", {
  expect_equal(sidak(c(-.1, .1, .2, .3, 1.1, NA)), 0.271)
})

test_that("Sidak's method works with zeros and NAs combined.", {
  expect_equal(sidak(c(0, .1, .2, .3, NA)), 0)
})

test_that("Sidak's method works with NAs, zeros and negatives/>1s combined.", {
  expect_equal(sidak(c(-.1, 0, .1, .2, .3, 1.1, NA)), 0)
})
