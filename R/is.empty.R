#' Test if a hash has no key-value pairs.
#' 
#' `is.empty` tests to see if any key value pairs are assigned on a
#' `hash` object.
#' 
#' @param x hash object.
#' 
#' Returns `TRUE` if no key-value pairs are defined for the hash,
#' `FALSE` otherwise.
#' 
#' @return logical.
#' 
#' @author Christopher Brown
#' 
#' @seealso 
#'   [hash()]
#'   [exists()]
#'   [length()]
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
