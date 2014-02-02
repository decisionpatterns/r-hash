#' Test if a hash has no key-value pairs.
#' 
#' \code{is.empty} tests to see if any key value pairs are assigned on a
#' \code{hash} object.
#' 
#' @param x hash object.
#' 
#' Returns \code{TRUE} if no key-value pairs are defined for the hash,
#' \code{FALSE} otherwise.
#' 
#' @return logical.
#' 
#' @author Christopher Brown
#' 
#' @seealso 
#'   \code{\link{hash}}
#'   \code{\link{exists}}
#'   \code{\link{length}}
#'   
#' @examples
#' 
#'     h <- hash( a=1, b=2, c=3 )
#'     
#'     is.empty(h)    # FALSE
#'     clear(h)
#'     is.empty(h)    # TRUE
#'     h <- hash()
#'     is.empty(h)    # TRUE
#'     
#' @export

is.empty <- function(x) { 
    if( class(x) != 'hash' ) stop( "is.empty only works on hash objects" )
    if( length(x) == 0 ) TRUE else FALSE  
}
