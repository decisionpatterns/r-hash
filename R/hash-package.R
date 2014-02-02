#' hash package
#' 
#' Hash/associative array/dictionary data structure for the R language.
#' 
#' This S4 class is designed to provide a hash-like data structure in a native
#' R style and provides the general methods for hash/dictionary operations.
#' 
#'
#' @note
#' 
#' The hash package is the only full featured hash implementation for the R
#' language. It provides more features and finer control of the hash behavior
#' than the native features. It hss similar and some cases better
#' performance, e.g. compared to lists with a large number of elements.
#'  
#' @author Christopher Brown
#' 
#' Maintainer: Christopher Brown <chris.brown -at- decisionpatterns -dot- com>
#' @seealso 
#'   \code{\link{hash} }, 
#'   \code{\link{Extract}} and
#'   \code{\link{environment} }
#'   
#' @references
#' Some discussion can be found here:
# \href{\url{http://www.mail-archive.com/r-help@r-project.org/msg37637.html}}
# \href{\url{http://www.mail-archive.com/r-help@r-project.org/msg37650.html}}
# \href{\url{http://tolstoy.newcastle.edu.au/R/help/05/12/index.html\#18192}}
#'   
#' @examples
#' 
#'   h <- hash( keys=letters, values=1:26 )
#'   h <- hash( letters, 1:26 )
#' 
#'   h$a # 1
#' 
#'   h$foo <- "bar"
#'   h[ "foo" ] 
#'   h[[ "foo" ]]
#' 
#'   clear(h)
#'   rm(h)
#' 
#' @name hash-package
#' @docType package

NULL