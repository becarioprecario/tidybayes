# get_variables
#
# Author: mjskay
###############################################################################


#' Get the names of the variables in a fitted Bayesian model
#'
#' Get a character vector of the names of the variables in a variety of fitted
#' Bayesian model types. All models supported by \code{\link{as_sample_tibble}} are
#' supported.
#'
#' This function is often useful for inspecting a model interactively in order
#' to construct calls to \code{\link{spread_draws}} or \code{\link{gather_draws}}
#' in order to extract samples in a tidy format.
#'
#' @param model A supported Bayesian model fit. Tidybayes supports a variety of model objects;
#' for a full list of supported models, see \link{tidybayes-models}.
#' @return A character vector of variable names in the fitted model.
#' @author Matthew Kay
#' @seealso \code{\link{spread_draws}}, \code{\link{gather_draws}}.
#' @keywords manip
#' @examples
#'
#' data(line, package = "coda")
#' get_variables(line)
#'
#' data(RankCorr, package = "tidybayes")
#' get_variables(RankCorr)
#'
#' @importFrom magrittr %>%
#' @export
get_variables = function(model) UseMethod("get_variables")

#' @rdname get_variables
#' @export
get_variables.default = function(model) {
  #default method just uses as_sample_tibble; could add faster model-type-specific methods
  model %>%
    as_sample_tibble() %>%
    names() %>%
    setdiff(c(".chain", ".iteration", ".draw"))
}