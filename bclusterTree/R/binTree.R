
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
  root = binaryTree.node(1);
  tree = list();
  tree[[1]] = root;

  evalIndex = function(bin, y) {
    x = object[[bin @ index]];
    i = compares(x, y);
    i;
  }

  index = 1;

  internal = function(bin, index, item) {
    order = evalIndex(bin, item);

    if (order == 0) {
      # is a cluster member
      bin @ members = append(bin @ members, index);
      bin = NULL;
    } else if (order == 1) {
      right = tree[[bin@right]];

      if (is.null(right)) {
        # append right
        tree[[length(tree) + 1]] = binaryTree.node(index);
        bin = NULL;
      } else {
        bin = right;
      }
    } else {
      left = tree[[bin@left]];

      if (is.null(left)) {
        tree[[length(tree) + 1]] = binaryTree.node(index);
        bin = NULL;
      } else {
        bin = left;
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

