#' del, delete - remove key-value pair(s) from a hash
#' 
#' Removes key-value pair(s) from a hash by name of the object. To delete all 
#' keys, use the \code{\link{clear}} method.
#' 
#' @aliases del del-methods del,ANY,hash-method delete delete-methods
#' delete,ANY,hash-method
#' @param x An object that will be coerced to valid key(s) to be removed from
#' the hash.  \code{x} will be coerced to a valid hash keys using
#' \code{\link{make.keys}}
#' @param hash A \code{\link{hash}} object
#' @return None. This method exists solely for the side-effects of removing
#' items from the hash.
#' @author Christopher Brown
#' @seealso See Also as \code{\link{hash}}, \code{\link{make.keys}}.
#' @keywords methods data manip
#' @examples
#' 
#' 
#'   h <- hash( letters, 1:26 )
#'   h # 26 elements
#'   del( "a", h )
#'   h # 25 elements
#' 
#' @name del
#' @aliases delete del-methods delete-methods
#' @rdname del
#' @docType methods
#' @export

setGeneric( "del", function( x, hash ) { standardGeneric("del") } )

#' @rdname del
#' @aliases del,ANY,hash-method

setMethod( 
	"del" ,
	signature( "ANY", "hash" ) ,
	function ( x, hash ) {
	  rm( list=make.keys(x), envir=hash@.Data )
	}
)

#' @name delete
#' @aliases delete
#' @rdname del
#' @export

setGeneric( "delete", function( x, hash ) { standardGeneric("delete") } )


#' @rdname del
#' @aliases delete,ANY,hash-method

setMethod(
  "delete",
  signature( "ANY", "hash" ) ,
    function(x,hash) { del(x,hash) }
)
