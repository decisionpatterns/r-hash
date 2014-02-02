#  ---------------------------------------------------------------------
# length.R
#   return the number of keys in a hash
#   NB:
#     - This doesn't work: env.profile(x@.xData)$nchains
#  ---------------------------------------------------------------------

#' length Returns the number of key-value pairs in a hash
#' 
#' Returns the number of items in a hash
#' 
#' Return the number of items in the hash by calling \code{\link{length}} on
#' the internal environment.
#' 
#' @aliases length 
#' @return integer Number of items in the hash.
#' @author Christpher Brown
#' @seealso See Also \code{\link{hash}}, \code{\link{length}}
#' @keywords methods
#' @examples
#' 
#' 
#'   h <- hash( letters, 1:26 )
#'   length(h) # 26
#' 
#' @rdname hash

setMethod( "length", "hash", function(x) length( x@.xData ) )


