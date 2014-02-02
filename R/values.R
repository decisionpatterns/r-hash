#' values
#' 
#' Get/set values for a hash object
#' 
#' @param x hash object
#' @param keys to get or set
#' @param value to be set 
#' @param ... additional arguments passed to sapply
#' 
#' The \code{values} method returns the values from a hash. It is similar to
#' \code{ h[[ keys(h) ]] } except that a named vector or list is returned
#' instead of a hash.  : By default, the returned values are simplified by
#' coercing to a vector or matrix if possible; elements are named after the
#' corresponding key. If the values are of different types or of a complex
#' class than a named list is returned.  Argument \code{simplify} can be used
#' to control this behavior.  The default is to simplify the results. 
#' 
#' Because of the way that R works this might produce some unexpected behavior
#' when objects are being returned. R sometimes simplifies these to numeric
#' classes causing the original class to be lost. In these cases, set 
#' \code{simplify} to \code{FALSE}. This will return a list of values that can
#' be manipulated normally, e.g. with \code{Reduce} or \code{c}.  See examples
#' for how this works with dates. This will likely be fixed in a future version. 
#' 
#' If a character vector of \code{keys} is provided, only these keys are
#' returned. This also allows for returning values mulitple times as in:
#' 
#' \code{ values(h, keys=c( 'a','a','b' ) ) }
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
#' @examples
#'   h <- hash( letters, 1:26 )
#'   values(h)  # 1:26
#'   values(h, simplify = FALSE )
#'   values(h, USE.NAMES = FALSE )
#' 
#'   h <- hash( 1:26, letters )
#'   values(h) 
#'   values(h, keys=1:5 )
#'   values(h, keys=c(1,1,1:5) )
#'   
#'   values(h, keys=1:5) <- 6:10 
#'   values(h) <- rev( letters )
#'       
#'   # When values are obejcts     
#'   h <- hash( c('a','b'), Sys.time() )
#'   class(h$a)             # "POSIXct" "POSIXt"
#'   vals <- values( h )    
#'   class(vals)            # Numeric
#'  
#'   vals <- values(h, simplify=FALSE )
#'   class(vals)            # List
#'   class( Reduce( c, vals ) ) # "POSIXct" "POSIXt"
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
      return( sapply( keys, get, x, ... ))
	}
) 



#' @name values<-
#' @rdname values
#' @export

setGeneric( 'values<-', function(x, ..., value) standardGeneric( 'values<-' ) ) 

 
#' @name values<-,hash,ANY-mehtod
#' @aliases values<-,hash-method
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
