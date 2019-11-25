test_that("Stouffer's method works with all positive inputs.", {
  expect_equal(stouffer(c(.1, .2, .3)), 0.06318465)
})

test_that("Stouffer's method works with at least one zero input.", {
  expect_equal(stouffer(c(0, .1, .2, .3)), 0)
})

test_that("Stouffer's method works with at least one negative or >1 input.", {
  expect_equal(stouffer(c(-.1, .1, .2, .3, 1.1)), 0.06318465)
})

test_that("Stouffer's method works with at least one NA input.", {
  expect_equal(stouffer(c(NA, .1, .2, .3)), 0.06318465)
})

test_that("Stouffer's method works with zeros and negatives/>1s combined.", {
  expect_equal(stouffer(c(-.1, 0, .1, .2, .3, 1.1)), 0)
})

test_that("Stouffer's method works with NAs and negatives/>1s combined.", {
  expect_equal(stouffer(c(-.1, .1, .2, .3, 1.1, NA)), 0.06318465)
})

test_that("Stouffer's method works with zeros and NAs combined.", {
  expect_equal(stouffer(c(0, .1, .2, .3, NA)), 0)
})

test_that("Stouffer's method works with NAs, zeros and negatives/>1s combined.", {
  expect_equal(stouffer(c(-.1, 0, .1, .2, .3, 1.1, NA)), 0)
})
