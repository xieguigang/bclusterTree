#' Create a new tree node
#'
#' @param x a node content data object
#'
#' @details the initial node content data object \code{x} is already includes into the
#'     \code{members} slot of the created new binary tree node list object.
#'
binaryTree.node <- function(key, i) {
  new("binTree", 
	  index = key, 
	  members = i,
	  left = -1,
	  right = -1
  );
}

# the index pointer just store in binTree S4 class object
setClass("binTree", representation(index = "integer", members = "integer", left = "integer", right = "integer"));