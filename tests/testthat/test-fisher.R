test_that("Fisher's method works", {
  expect_equal(fisher(c(.1, .2, .3)), 0.1152162)
})
