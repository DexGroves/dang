#' Execute the last command with a new function, but the same arguments.
#'
#' You mistyped it, but don't want to up-arrow, ctrl+a, delete. dang!
#'
#' @param new_fn Raw new function with which to evaluate the old arguments.
#' @export
#' @examples
#' > pritn("Hello world!")
#' # Error: could not find function "pritn"
#' > dang(print)
#' # [1] "Hello world!"
dang <- function(new_fn) {
  tmp <- tempfile()
  savehistory(tmp)
  hist_txt <- system(paste("tail -2", tmp), intern = TRUE)[1]
  unlink(tmp)
  hist_expr <- parse(text = hist_txt)
  hist_expr[[1]][[1]] <- substitute(new_fn)
  invisible(eval.parent(hist_expr))
}
