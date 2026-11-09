test_that("lrmodel works", {
  # coefficients
  expect_equal(
    lrmodel(mpg ~ wt, mtcars)$coefficients,
    lm(mpg ~ wt, mtcars)$coefficients
    )
  expect_equal(
    lrmodel(Petal.Width ~ Sepal.Length, iris)$coefficients,
    lm(Petal.Width ~ Sepal.Length, iris)$coefficients
  )
  # residuals
  expect_equal(
    lrmodel(mpg ~ wt + hp, mtcars)$residuals,
    lm(mpg ~ wt + hp, mtcars)$residuals
  )
  expect_equal(
    lrmodel(Volume ~ Girth + Height, trees)$residuals,
    lm(Volume ~ Girth + Height, trees)$residuals
  )
  # fitted values
  expect_equal(
    lrmodel(mpg ~ wt, mtcars)$fitted.values,
    lm(mpg ~ wt, mtcars)$fitted.values
  )
  # rank
  expect_equal(
    lrmodel(mpg ~  cyl + hp + wt + gear, mtcars)$rank,
    lm(mpg ~ cyl + hp + wt + gear, mtcars)$rank
  )
  # weights
  # expect_equal(
  #   lrmodel(body_mass ~ species, data = penguins, weights = 1:nrow(penguins)),
  #   lm(body_mass ~ species, data = penguins, weights = 1:nrow(penguins))
  # )
  expect_equal(
    lrmodel(mpg ~ wt + hp, data = mtcars, weights = c(1:32))$weights,
    lm(mpg ~ wt + hp, data = mtcars, weights = c(1:32))$ weights
  )
  # df of residuals
  expect_equal(
    lrmodel(Volume ~ Height, trees)$df.residual,
    lm(Volume ~ Height, trees)$df.residual
  )
  # model
  expect_equal(
    lrmodel(Petal.Width ~ Sepal.Length, iris)$model,
    lm(Petal.Width ~ Sepal.Length, iris)$model
  )
})
