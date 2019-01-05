#' Test for existence of key(s) on a hash
#' 
#' **Note:** `has.key()` will be replaced by `has_key()` in the future.
#' ` 
#' @param hash **hash** object. 
#' @param key vector whose entries will be coerced to valid keys.
#' @param ...  arguments passed to sapply.
#' 
#' @details
#' 
#' `has_key` indicates whether the key exists on the hash. 
#'   
#' `has_key` is a wrapper around [base::exists()] vectorized over `key` using 
#' [base::sapply()]. Additional arguments, `...` are passed to [base::sapply()].
#' The inherits method is always `FALSE` 
#'
#' `has_key()` is replacing `has.key` and switching the order of arguments. This
#' makes `has_key()` more pipe-able and readable. `has.key()` will be deprecated
#' in a future release.
#' 
#' @return logical vector with `length(key)`` indicating whether
#' the key is defined in the hash.
#'    
#' @seealso
#'   - [base::exists()] 
#'   
#' @examples
#'     h <- hash( letters, 1:26 )
#'     all( has.key( letters, h ) ) # TRUE
#'     
#' @export

has_key <- function(hash, key, ...) UseMethod('has_key')

#' @export
has_key.hash <- function(hash,key, ...) { 
  sapply( make_keys(key), exists, hash@.Data, inherits=FALSE, ... )  
}


# @name has.key
#' @rdname has_key
#' @docType methods
# @aliases has.key   
#' @import methods  
#' @export

setGeneric( 
    "has.key", 
    function( key, hash, ... ) standardGeneric( "has.key" ) 
)


#' @rdname has_key
#' @aliases has.key,ANY,hash-method

setMethod( 
    "has.key" ,
    methods::signature( "ANY", "hash" ) ,
    function( key, hash, ... ) {
      # .Deprecated("has_key"
      #   , msg=paste0( sep=" "
      #         , "has.key() will be deprecated in the future in favor of has_key().\n" 
      #         , "has_key() changes the order of arguments accepting the hash "
      #         , "first in order to make has_key pipable." )
      # )
      sapply( key, exists, hash@.Data, inherits=FALSE )
    }
)
