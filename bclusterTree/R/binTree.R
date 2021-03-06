#Region "Microsoft.ROpen::b305b112c18b2404cfc0e0de2ed50061, R\binTree.R"

    # Summaries:


#End Region

#' Build a binary tree
#'
#' @param compares a comparision function that compares the order of
#'     any two elements in objects list. this function should generates
#'     3 values for build a tree cluster:
#'     0 for identical, means clustering
#'     1 for great than, means append to right node and
#'     -1 means less than, which will append to left node
#'
#' @param objects this parameter should be an object list.
#'
buildBTree = function(objects, compares) {
  root = binaryTree(1);
  tree = list();
  tree[[1]] = root;
  closure   = environment();

  evalIndex = function(bin, y) {
    x = objects[[bin @ index]];
    i = compares(x, y);
    i;
  }

  save = function(x) assign("tree", x, envir = closure);
  read = function() get("tree", envir = closure);

  index    = 1;
  internal = function(bin, index, item) {
    order = evalIndex(bin, item);

    if (order == 0) {
      # is a cluster member
      bin@members = append(bin@members, index);
      bin = NULL;
    } else if (order == 1) {
      tree = read();

      if (bin@right <= 0) {
        # append right
        i = length(tree) + 1;
        tree[[i]] = binaryTree(index);
        bin@right = i;
        save(tree);
        bin = NULL;
      } else {
        bin = tree[[bin@right]];
      }
    } else {   
      tree = read();

      if (bin@left <= 0) {
        i = length(tree) + 1;
        tree[[i]] = binaryTree(index);
        bin@left  = i;
        save(tree);

        bin = NULL;
      } else {
        bin = tree[[bin@left]];
      }
    }

    bin;
  }

  for(item in objects) {
    bin   = root;
    index = index + 1;

    repeat {
      bin = internal(bin, index, item);

      if (is.null(bin)) {
        break;
      }
    }
  }

  tree;
}
