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
bcluster = function(objects, compares, show_progress = TRUE) {
  # each tree node in the created binary
  # tree is an object cluster
  btree = buildBTree(objects, compares, show_progress = show_progress);
  keys  = names(objects);

  if (is.null(keys)) {
    keys = 1:length(objects);
  }

  names(btree) = sprintf("BIN-%s", 1:length(btree));

  lapply(btree, function(bin) {
    keys[bin@members];
  });
}

#' Create a similarity network based on the clustering
#'
bnetwork = function(objects, compares, show_progress = TRUE) {
  # each tree node in the created binary
  # tree is an object cluster
  btree = buildBTree(objects, compares, show_progress = show_progress);
  keys  = names(objects);

  if (is.null(keys)) {
    keys = 1:length(objects);
  }

  bins = sprintf("BIN-%s", 1:length(btree));
  names(btree) = bins;

  lapply(btree, function(bin) {
    list(
      "members" = keys[bin@members],
      "next"    = ifelse(bin@right <= 0, NULL, bins[bin@right])
    );
  });
}
