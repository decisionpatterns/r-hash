#' Removes all key-value pairs from a hash
#' 
#' \code{clear} removes all key-values from a hash.
#' 
#' @param x A \code{hash} object.
#' 
#' @details
#' 
#' \code{clear} removes (\code{rm}) the key-value pairs on the hash.
#' For large hashes it might be faster to reinitialize the hash, though this
#' might cause memory leaks.
#'
#' @note \code{clear} should be called prior to removing a hash.  This ensures
#' that the memory from the environment is freed.
#' 
#' @return None. Method clear exists entirely for its side effects.
#' 
#' @author Christopher Brown
#' 
#' @seealso 
#'   \code{\link{del}} to remove specific key-values from the hash.
#'   \code{\link{hash}}.
#'   
#' @examples
#' 
#'   h <- hash( letters, 1:26 )
#'   h # An object of type 'hash' containing 26 key-value pairs.
#'   clear(h)  
#'   h # An object of type 'hash' containing 0 key-value pairs.
#' 
#' @rdname clear
#' @export

setGeneric( "clear", function(x) standardGeneric("clear") )

#' @export
#' @rdname clear

setMethod( "clear" , "hash" ,
   function(x) rm( list=keys(x), envir=x@.Data )
)
