#' attach/detach a hash to the search path 
#' 
#' @param hash,what hash object to attach to the search path.
#' @param name string; name for the environment on the search path
# @param pos integer where to attach the hash
#' @param ... additional arguments passed to [base::attach()]
#' 
#' `attach_hash` attaches the  environment part of a hash to the search path. 
#' The values become  directly accessible by their keys. 
#' 
#' `hash:::attach()` is a non-exported versions of the same.
#' 
#' @seealso 
#'   - [base::attach()]
#'   
#' @examples
#'   h <- hash( a=1, b=2, c=3 )
#'   
#'   attach_hash(h)
#'   search() 
#'   detach_hash(h)
#'   search()
#'   
#'   hash:::attach( h )
#'   b                               # 2
#'   b <<- 25 
#'   b                               # 25
#'   h 
#'   detach(h)
#'   
#' @export

attach_hash <- function(hash, name=deparse(substitute(hash)), ...) {
  base::attach( hash@.xData, name=name, ... )
}

#' @rdname attach_hash
#' @export

detach_hash <- function(...) base::detach(...)


#' @rdname attach_hash
attach <- function( what, name=deparse(substitute(what)), ... ) {
   base::attach( what@.xData, name = name, ... )
}
