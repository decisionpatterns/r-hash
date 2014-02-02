#' Test for existence of key(s) on a hash
#' 
#' \code{has.key} returns a logical vector as long as \code{keys}, indicating
#' which keys are defined on the hash.
#' 
#' @param key A vector whose entries will be coerced to valid keys.
#' @param hash A \code{\link{hash}} object.
#' @param ...  arguments passed to further functions
#' 
#' \code{has.key} is a wrapper around \code{\link[base]{exists}}
#' 
#' @return logical A logical vector of length \code{key} indicating whether
#' the key is defined in the hash.  \code{has.key} also accepts \code{...} to
#' be passed to underlying \code{sapply}
#' 
#' @author Christopher Brown
#' 
#' @seealso
#'   \code{\link[base]{exists}} 
#'   \code{\link{hash}}
#' 
#' @examples
#'     h <- hash( letters, 1:26 )
#'     all( has.key( letters, h ) ) # TRUE
#'     
#' @name has.key
#' @rdname has.key
#' @docType methods
#' @aliases has.key     
#' @export
setGeneric( 
    "has.key", 
    function( key, hash, ... ) standardGeneric( "has.key" ) 
)


#' @rdname has.key
#' @aliases has.key,ANY,hash-method
setMethod( 
    "has.key" ,
    signature( "ANY", "hash" ) ,
    function( key, hash, ... ) {
      sapply( key, exists, hash@.Data, inherits=FALSE )
    }
)
