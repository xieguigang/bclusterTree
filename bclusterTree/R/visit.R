#Region "Microsoft.ROpen::ac680ac7f7bed5c01fc7c28056daba8d, R\visit.R"

# Summaries:


#End Region

#' Get node on current left
#'
#' @param ref the reference location of current node
#' @param tree a binary tree list that produced by \code{\link{buildBTree}}.
#'
#' @return a S4 class object of \code{binTree}
#'
left = function(ref, tree) {
    if (class(ref) == "binTree") {
        bin = ref;
    } else {
        bin = tree[[ref]];
    }

    if (bin@left <= 0) {
        NULL;
    } else {
        tree[[bin@left]];
    }
}

#' Get node on current right
#'
#' @param ref the reference location of current node
#' @param tree a binary tree list that produced by \code{\link{buildBTree}}.
#'
#' @return a S4 class object of \code{binTree}
#'
right = function(ref, tree) {
    if (class(ref) == "binTree") {
        bin = ref;
    } else {
        bin = tree[[ref]];
    }

    if (bin@right <= 0) {
        NULL;
    } else {
        tree[[bin@right]];
    }
}
