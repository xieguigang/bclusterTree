#Region "Microsoft.ROpen::112bec74cd1c1dab943d0d5a76b0e1ce, R\zzz.R"

    # Summaries:

    # .onLoad <- function(libname, pkgname) {...

#End Region

#' Package loader
#'
.onLoad <- function(libname, pkgname) {
  require(VisualBasic.R);

  # set class information for 
  # run build btree clustering
  # .setBtreeClass();
}

.flashLoad <- function() .onLoad(NULL, NULL);
