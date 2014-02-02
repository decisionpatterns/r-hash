#' values
#' 
#' Get/set values for a hash object
#' 
#' @param x hash object
#' @param keys to get or set
#' @param value to be set 
#' @param ... additional arguments
#' 
#' The \code{values} method returns the values from a hash. It is similar to
#' \code{ h[[ keys(h) ]] } except that a named vector or list is returned
#' instead of a hash.  : By default, the returned values are simplified by
#' coercing to a vector or matrix if possible; elements are named after the
#' corresponding key. If the values are of different types or of a complex
#' class than a named list is returned.  Argument \code{simplify} can be used
#' to control this behavior.
#' 
#' #' If a character vector of \code{keys} is provided, only these keys are
#' returned. This also allows for returning values mulitple times as in:
#' 
#' \code{ values(h, keys=c('a','a','b' ) ) }
#' 
#' This is now the preferred method for returning multiple values for the same
#' key.
#' 
#' The replacement method, \code{values<-} can replace all the values or simply
#' those associated with the supplied \code{keys}.  Use of the accessor '[' is
#' almost always preferred.
#' 
#' @seealso 
#'   \code{\link[hash]{Extract}} for R-like accessors
#'   
#' @name values
#' @rdname values
#' @docType methods
#' @export

setGeneric( 'values', function(x, ...) standardGeneric( 'values' ) )


#' @name values,hash-method
#' @rdname values

setMethod( 'values', 'hash', 
	function(x, keys=NULL, ... ) { 
      if( is.null(keys) ) keys <- keys(x)
      if( ! is.character(keys) ) keys <- make.keys(keys) 
      return(sapply( keys, get, x, ... ))
	}
) 



#' @rdname values
#' @aliases values<--method

setGeneric( 'values<-', function(x, ..., value) standardGeneric( 'values<-' ) ) 


#' @name values<-,hash,ANY-mehtod
#' @rdname values

setReplaceMethod( 'values', c('hash', 'ANY' ), 
  function(x, ..., value ) {
    keys <- list(...)$keys
    if ( is.null(keys) ) keys <- keys(x) 
    if ( ! is.character(keys) ) keys <- make.keys(keys)

    x[ keys ] <- value
    return(x)
  }
)
