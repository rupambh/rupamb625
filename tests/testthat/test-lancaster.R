test_that("Lancaster's method works with all positive inputs.", {
  expect_equal(lancaster(c(.1, .2, .3), c(1, 2, 3)), 0.1430477)
})

test_that("Lancaster's method works with at least one zero input.", {
  expect_equal(lancaster(c(0, .1, .2, .3), c(1, 1, 2, 3)), 0)
})

test_that("Lancaster's method works with at least one negative or >1 input.", {
  expect_equal(lancaster(c(-.1, .1, .2, .3, 1.1), c(1, 1, 2, 3, 4)), 0.1430477)
})

test_that("Lancaster's method works with at least one NA input.", {
  expect_equal(lancaster(c(NA, .1, .2, .3), c(1, 1, 2, 3)), 0.1430477)
})

test_that("Lancaster's method works with zeros and negatives/>1s combined.", {
  expect_equal(lancaster(c(-.1, 0, .1, .2, .3, 1.1), c(1, 1, 1, 2, 3, 4)), 0)
})

test_that("Lancaster's method works with NAs and negatives/>1s combined.", {
  expect_equal(lancaster(c(-.1, .1, .2, .3, 1.1, NA), c(1, 1, 2, 3, 4, 5)), 0.1430477)
})

test_that("Lancaster's method works with zeros and NAs combined.", {
  expect_equal(lancaster(c(0, .1, .2, .3, NA), c(1, 1, 2, 3, 4)), 0)
})

test_that("Lancaster's method works with NAs, zeros and negatives/>1s combined.", {
  expect_equal(lancaster(c(-.1, 0, .1, .2, .3, 1.1, NA), c(1, 1, 1, 2, 3, 4, 5)), 0)
})

test_that("Lancaster's method can filter negative/NA weights out.", {
  expect_equal(lancaster(c(.05, .1, .2, .3, .4), c(-1, 1, 2, 3, NA)), 0.1430477)
})
