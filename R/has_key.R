#' Test for existence of key(s) on a hash
#' 
#' `has.key` returns a logical vector as long as `keys`, indicating
#' which keys are defined on the hash.
#' 
#' @param key A vector whose entries will be coerced to valid keys.
#' @param hash A [hash()] object.
#' @param ...  arguments passed to further functions
#' 
#' `has.key` is a wrapper around [base::exists()]
#' 
#' @return logical A logical vector of length `key` indicating whether
#' the key is defined in the hash.  `has.key` also accepts `...` to
#' be passed to underlying `sapply`
#' 
#' @author Christopher Brown
#' 
#' @seealso
#'   [base::exists()] 
#'   [hash()]
#' 
#' @examples
#'     h <- hash( letters, 1:26 )
#'     all( has.key( letters, h ) ) # TRUE
#'     
#' @name has.key
#' @rdname has.key
#' @docType methods
#' @aliases has.key   
#' @import methods  
#' @export

setGeneric( 
    "has.key", 
    function( key, hash, ... ) standardGeneric( "has.key" ) 
)


#' @rdname has.key
#' @aliases has.key,ANY,hash-method
setMethod( 
    "has.key" ,
    methods::signature( "ANY", "hash" ) ,
    function( key, hash, ... ) {
      sapply( key, exists, hash@.Data, inherits=FALSE )
    }
)
