bcluster = function(objects, compares) {
    # each tree node in the created binary
    # tree is an object cluster
    btree = buildBTree(objects, compares);
    keys = names(objects);

      if (is.null(keys)) {
    keys = 1:length(objects);
  }

    
}