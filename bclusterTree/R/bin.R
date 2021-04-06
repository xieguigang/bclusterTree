#Region "Microsoft.ROpen::36920007762967649fff8c66d3c8a6dd, R\bin.R"

# Summaries:

# binaryTree <- function(i) {...

#End Region

#' Create a new tree node
#'
#' @param i the index position of the content data object
#' @param ref the reference location of the current tree node
#'
#' @details the initial node content data object \code{i} is already includes into the
#'     \code{members} slot of the created new binary tree node list object.
#'
binaryTree <- function(i, ref) {
  new("binTree",
    index   = i,
    members = i,
    left    = -1,
    right   = -1,
    ref     = ref
  );
}

.setBtreeClass = function() {
  # the index pointer just store in binTree S4 class object
  setClass("binTree", representation(
    # the location of key object in the input data sequence
    index   = "numeric",
    # the reference location of current tree node in the tree list data
    ref     = "numeric",
    # a vector of object index that contains in current
    # binary tree cluster node
    members = "numeric",
    # the location of the left node
    left    = "numeric",
    # the location of the right node
    right   = "numeric"
  ));
}
