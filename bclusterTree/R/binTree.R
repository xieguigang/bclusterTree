#Region "Microsoft.ROpen::b305b112c18b2404cfc0e0de2ed50061, R\binTree.R"

# Summaries:


#End Region

#' Build a binary tree
#'
#' @param compares a comparision function that compares the order of
#'     any two elements in \code{objects} list. this function should generates
#'     3 values for build a tree cluster:
#' 
#' \enumerate{
#'     \item \code{0} for identical, means clustering
#'     \item \code{1} for great than, means append to right node and
#'     \item \code{-1} means less than, which will append to left node
#' }
#' 
#' @param objects this parameter should be an object list.
#'
buildBTree = function(objects, compares, verbose = FALSE, show_progress = TRUE) {
  tree = list();
  tree[[1]] = binaryTree(1, 1);
  closure   = environment();

  save = function(x) assign("tree", x, envir = closure);
  read = function() {
    get("tree", envir = closure);
  };

  evalIndex = function(bin, y) {
    x = objects[[bin@index]];
    i = compares(x, y);
    i;
  }

  save(tree);

  index    = 1;
  internal = function(bin, index, item) {
    order = evalIndex(bin, item);
    tree = read();

    if (order == 0) {
      if (verbose) {
        print(sprintf("[=] append %s", bin@ref));
        # str(bin);
      }

      # is a cluster member
      bin@members = append(bin@members, index);
      tree[[bin@ref]] = bin;
      bin = NULL;
    } else if (order == 1) {
      if (bin@right <= 0) {
        # append right
        i = length(tree) + 1;
        bin@right = i;
        tree[[i]] = binaryTree(index, i);
        tree[[bin@ref]] = bin;
        bin = NULL;
      } else {
        bin = tree[[bin@right]];
      }
    } else {
      if (bin@left <= 0) {
        i = length(tree) + 1;
        bin@left  = i;
        tree[[i]] = binaryTree(index, i);
        tree[[bin@ref]] = bin;
        bin = NULL;
      } else {
        bin = tree[[bin@left]];
      }
    }

    save(tree);

    bin;
  }

  tick = VisualBasic.R::tick.helper(length(objects));

  if (show_progress) {
	cat("build a binary tree for object clustering...\n\n");
  }

  for(item in objects[2:length(objects)]) {
    bin   = read()[[1]];
    index = index + 1;

    repeat {
      bin = internal(bin, index, item);

      if (is.null(bin)) {
        break;
      }
    }
	
	if (show_progress) {
		tick();
	}
  }

  if (show_progress) {
	cat("\n\n");
  }  

  tree;
}
