test_that("Stouffer's method works", {
  expect_equal(stouffer(c(.05, .2, .5)), 0.07556281)
})
