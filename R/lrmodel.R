#' lrmodel
#'
#' Generates results from a linear regression model
#'
#' @param formula a linear regression model formula of the format y ~ x. For multivariate linear models, covariates may be added as y ~ x1 + x2 + ...
#' @param data an input dataframe
#' @param weights a vector of weights
#' @return a list of results from the linear regression model, which includes:
#'
#' - Coefficient values
#' - Residual values
#' - Model fitted values
#' - Model rank
#' - Model weights
#' - Model residual dfs
#' - Model call
#' - Model dataframe
#'
#' @examples
#' lrmodel(mpg ~ wt, data = mtcars)
#' lrmodel(Sepal.Length ~ Petal.Width, data = iris)$coefficients
#' @export

lrmodel <- function(formula, data, weights = NULL) {
  # model covariate(s)
  x <- model.matrix.default(formula, data)
  # model outcome
  y <- model.response(model.frame(formula, data))

  # model dataframe
  model_df <- model.frame.default(formula, data)

  # model coefficients
  if (is.null(weights)) {
    coef <- solve(t(x) %*% x) %*% (t(x) %*% y)
  } else {
    # filter weights vector to rows with complete x and y observations
    w_idx <- !rowSums(is.na(data[, all.vars(formula)]))
    w <- diag(weights[w_idx])
    coef <- solve(t(x) %*% w %*% x) %*% (t(x) %*% w %*% y)
  }

  # fitted values
  fitted_vals <- x %*% coef

  # model rank
  rank <- nrow(coef)

  # residuals
  resid <- y - fitted_vals

  # residual dfs
  resid_df <- nrow(x) - rank

  # user call
  user_call = match.call()

  # store all results in list
  lrmodel_results <- list(
    coefficients = t(coef)[1, ],
    residuals = t(resid)[1, ],
    fitted.values = t(fitted_vals)[1, ],
    rank = rank,
    weights = weights,
    df.residual = resid_df,
    call = user_call,
    model = model_df
  )

  return(lrmodel_results)

}
