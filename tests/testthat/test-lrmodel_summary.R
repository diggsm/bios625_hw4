test_that("lrmodel_summary works", {
  # residuals
  expect_equal(
    lrmodel_summary(lrmodel(mpg ~ wt, mtcars))$residuals,
    summary(lm(mpg ~ wt, mtcars))$residuals
  )
  # coefficients
  expect_equal(
    lrmodel_summary(lrmodel(mpg ~ wt, mtcars))$coefficients,
    summary(lm(mpg ~ wt, mtcars))$coefficients
  )
  # sigma
  expect_equal(
    lrmodel_summary(lrmodel(mpg ~ wt, mtcars))$sigma,
    summary(lm(mpg ~ wt, mtcars))$sigma
  )
  # R-squared
  expect_equal(
    lrmodel_summary(lrmodel(mpg ~ wt, mtcars))$r.squared,
    summary(lm(mpg ~ wt, mtcars))$r.squared
  )
  # Adjusted R-squared
  expect_equal(
    lrmodel_summary(lrmodel(mpg ~ wt, mtcars))$adj.r.squared,
    summary(lm(mpg ~ wt, mtcars))$adj.r.squared
  )
  # F statistic
  expect_equal(
    lrmodel_summary(lrmodel(mpg ~ wt, mtcars))$fstatistic,
    summary(lm(mpg ~ wt, mtcars))$fstatistic
  )
})
