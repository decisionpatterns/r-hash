#' keys - get/set key(s) from a hash
#' 
#' Returns the key(s) from a hash
#' 
#' Returns the character vector containing the keys of a hash object.
#' 
#' @param x A \code{\link{hash}} object.
#' @param value character or object coercable to character
#' 
#' @return For \code{keys} and \code{names}, a character vector of key names
#'   For the replacement methods \code{keys<-}, a hash object with the keys 
#'   renamed to \code{value}
#'    
#' @author Christopher Brown
#' 
#' @seealso
#'   \code{\link{setkeys}} : rename specific hash keys. 
#'   \code{\link{hash}} : hash object
#'   
#' @examples
#' 
#'   h <- hash( letters, 1:26 )
#'   keys(h)  # letters
#' 
#'   names(h) # same
#'   
#'   #' Rename keys
#'   # keys( h ) <- rev( keys(h) ) 
#'
#' @docType methods
#' @rdname keys
#' @aliases keys keys-methods
#' @export 

setGeneric( "keys", function(x) standardGeneric("keys") )


#' @rdname keys
#' @aliases keys,hash-method

setMethod( "keys" , "hash" ,
	function(x) ls(x@.Data, all.names=T )
)


#' @rdname keys
#' @aliases names names.hash 

names.hash <- function(x) keys(x)


# ----------------------------------------------------
# REPLACE METHOD 
#' @rdname keys
#' @docType methods
#' @aliases keys<--methods
#' @export

setGeneric( "keys<-", function(x,value) standardGeneric( "keys<-") )


#' @name keys<-,hash,ANY-method 
#' @rdname keys

setReplaceMethod( "keys", c('hash','ANY'), 
  function( x, value) { 
    value <- as.character(value)
    return( setkeys(x, keys(x), value ) )
  }
)  


#' @name keys<-,hash,ANY-method
#' @rdname keys

setReplaceMethod( "keys", c('hash','ANY'), 
  function( x, value) { 
    value <- as.character(value)
    return( setkeys(x, keys(x), value ) )
  }
) 


#' @name keys<-,hash,NULL-method
#' @rdname keys

setReplaceMethod( "keys", c('hash','NULL'), 
  function( x, value) 
    warning( "Keys cannot be set to NULL. " ,
             "If you wish to delete the hash entry use the `del` method."
    )
) 


