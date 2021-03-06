#' Package loader
#'
.onLoad <- function(libname, pkgname) {
.setBtreeClass();
}

.flashLoad <- function() .onLoad(NULL, NULL);