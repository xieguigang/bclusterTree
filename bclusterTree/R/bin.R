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
setClass("binTree", representation(
	# the location of key object in the input data sequence
	index   = "integer",
	# a vector of object index that contains in current 
	# binary tree cluster node
	members = "integer", 
	# the location of the left node
	left    = "integer", 
	# the location of the right node
	right   = "integer"
));