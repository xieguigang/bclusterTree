#' Create a new tree node
#'
#' @param x a node content data object
#'
#' @details the initial node content data object \code{x} is already includes into the
#'     \code{members} slot of the created new binary tree node list object.
#'
binaryTree.node <- function(key, x, name) {
  values         <- list();
  values[[name]] <- x;

  list(key     = key,
       members = values,
       left    = -1,
       right   = -1
  );
}

setClass("binTree", representation(index = "any", members = "binTree", left = "integer", right = "integer"));