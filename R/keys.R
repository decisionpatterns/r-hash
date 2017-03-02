#' keys - get/set key(s) from a hash
#' 
#' Returns the key(s) from a hash, unsorted by default
#' 
#' @param x A \code{\link{hash}} object.
#' @param value character or object coercable to character
#' @param sorted logical; whether the keys should be sorted 
#'        (DEFAULT: \code{getOption('hash.sorted', FALSE)})
#' @param ... Used to allow for additional arguments for keys
#' 
#' @details 
#' Returns the character vector containing the keys of a hash object. By 
#' default, the responses are not sorted. Set \code{sorted=TRUE} to return 
#' keys in sort order.
#' 
#' \code{names} uses \code{base::names} and will always return a sorted list of
#' names. \code{keys} should generally be used in favor of \code{names}, but 
#' names can be useful if you want sorted names for one instance when all others
#' don't provide a sorted list.
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

setGeneric( "keys", function(x, ...) standardGeneric("keys") )


#' @rdname keys
#' @aliases keys,hash-method

setMethod( "keys" , "hash" ,
	function(x, sorted=getOption('hash.sorted', FALSE) ) ls(x@.Data, all.names=T, sorted=sorted )
)

#' @rdname keys
#' @aliases names names.hash
#' @export

setMethod( "names", "hash", function(x) base::names( x@.xData ) )


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


