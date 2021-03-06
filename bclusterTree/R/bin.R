#Region "Microsoft.ROpen::36920007762967649fff8c66d3c8a6dd, R\bin.R"

    # Summaries:

    # binaryTree <- function(i) {...

#End Region

#' Create a new tree node
#'
#' @param x a node content data object
#'
#' @details the initial node content data object \code{x} is already includes into the
#'     \code{members} slot of the created new binary tree node list object.
#'
binaryTree <- function(i) {
  new("binTree",
      index   = i,
      members = i,
      left    = -1,
      right   = -1
  );
}

.setBtreeClass = function() {
  # the index pointer just store in binTree S4 class object
  setClass("binTree", representation(
    # the location of key object in the input data sequence
    index   = "numeric",
    # a vector of object index that contains in current
    # binary tree cluster node
    members = "numeric",
    # the location of the left node
    left    = "numeric",
    # the location of the right node
    right   = "numeric"
  ));
}
