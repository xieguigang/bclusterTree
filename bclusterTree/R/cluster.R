#Region "Microsoft.ROpen::ba084093cfbeb321b56712ee3daf518a, R\cluster.R"

# Summaries:


#End Region

#' Clustering the given objects sequence
#' 
#' @param objects a list of data objects
#' @param compares evaluate the orders between any element object in \code{objects},
#'     see \code{\link{buildBTree}}.
#'
#' @returns a list of list key collection with multiple cluster bins
#' 
bcluster = function(objects, compares) {
  # each tree node in the created binary
  # tree is an object cluster
  btree = buildBTree(objects, compares);
  keys = names(objects);

  if (is.null(keys)) {
    keys = 1:length(objects);
  }

  names(btree) = sprintf("BIN-%s", 1:length(btree));

  lapply(btree, function(bin) {
    keys[bin@members];
  });
}
