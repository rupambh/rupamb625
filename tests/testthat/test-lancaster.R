test_that("Lancaster's method works", {
  expect_equal(round(lancaster(c(.1, .5), c(2, 4)),7), 0.2409106)
})
