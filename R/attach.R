#' attach/detach a hash to the search path 
#' 
#' 
#' @param what hash; hash object to attach to the search path 
#' @param ... additional arguments passed to \code{\link[base]{attach}}
#' 
#' \code{attach} attached the environment part of a hash to the search path. 
#' The keys then become directly accessible. 
#' 
#' @seealso 
#'   \code{\link[base]{attach}}
#'   
#' @examples
#'   h <- hash( a=1, b=2, c=3 )
#'   hash::attach( h )
#'   b                               # 2
#'   b <<- 25 
#'   b                               # 25
#'   h 
#'   detach(h)
#'   
#' @note
#'   this function is not-exported; explicit declaration is necessary

 attach <- function( what, ... ) 
   base::attach( what@.xData, name = deparse(substitute(what)), ... )


# #' @rdname attach 
#  detach <- function( what ) { 
#    browser()
#    name <- substitute(what)
#    name <- as.character(name)
#    base::detach( name=name[[1]] ) 
#  } 
  
  
  