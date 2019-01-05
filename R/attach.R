#' attach/detach a hash to the search path 
#' 
#' @param what hash; hash object to attach to the search path 
#' @param pos integer where to attach the hash
#' @param ... additional arguments passed to [base:attach()]
#' 
#' `attach` attached the environment part of a hash to the search path. 
#' The keys then become directly accessible. 
#' 
#' @seealso 
#'   [base:attach()]
#'   
#' @examples
#'   h <- hash( a=1, b=2, c=3 )
#'   hash:::attach( h )
#'   b                               # 2
#'   b <<- 25 
#'   b                               # 25
#'   h 
#'   detach(h)
#'   
#' @note
#'   this function is not-exported; explicit declaration is necessary

 attach <- function( what, pos=2L, ... ) { 
   nm <- deparse(substitute(what))
   base::attach( what@.xData, name = nm, ... )
   # what@.xData <- as.environment(pos)
   # assign( nm, what, parent.frame() )
 }
 
