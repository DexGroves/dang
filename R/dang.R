#' Fix errors in the last command in the history.
#'
#' Call without one unnamed argument to replace the old calling function with
#' the new argument. Call with one or more named arguments to replace or
#' inject new arguments into the last call.
#'
#' @param ... Either a single unnamed argument or a series of named arguments.
#' @export
#' @examples
#' pritn("Hello world!")
#' # Error: could not find function "pritn"
#' dang(print)
#'
#' sample(letters, size = 26, replace = FALSE)
#' dang(replace = TRUE)
dang <- function(...) {
  this_call <- match.call()
  args <- as.list(this_call)[2:length(this_call)]

  hist_txt <- retrieve_last_command()
  hist_call <- parse(text = hist_txt)[[1]]

  if (as.character(hist_call[[1]]) == "dang") {
    stop("Can't dang on dang!", call. = FALSE)
  }

  if (is.null(names(args))) {
    hist_call <- replace_function_name(hist_call, args[[1]])
  } else {
    hist_call <- new_named_arguments(hist_call, args)
  }

  eval.parent(hist_call)
}

#' Grab the second most recent command in the history
retrieve_last_command <- function() {
  tmp <- tempfile()
  savehistory(tmp)
  hist_txt <- system(paste("tail -2", tmp), intern = TRUE)[1]
  unlink(tmp)
  hist_txt
}

#' Replace the top level function name of a call.
replace_function_name <- function(call, new_fn) {
  call[[1]] <- new_fn
  call
}

#' Replace existing or insert new named arguments into a call.
new_named_arguments <- function(call, args) {
  for (i in seq_along(args)) {
    call[names(args[i])] <- args[i]
  }
  call
}
