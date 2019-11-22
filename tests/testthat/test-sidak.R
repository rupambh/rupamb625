test_that("Sidak's method works", {
  expect_equal(sidak(c(.1, .2, .3)), 0.271)
})
