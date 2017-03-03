#' values
#' 
#' Get/set values for a hash object
#' 
#' @param x hash object
#' @param keys character; names of keys to get 
#' @param value to be set 
#' @param ... additional arguments passed to sapply
#' 
#' The \code{values} method returns a named-list of key value pairs from a hash.
#' If a hash is desired, use the hash slice method, \code{h[x]}. 
#' 
#' List elements are named after the corresponding key. In previous versions,
#' the return was simplified. This is no longer the case. Users should 
#' simplify arguments if needed using \code{unlist} or similar. See examples.
#' 
#' If argument \code{keys} is provided, only these keys are
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
#' @return 
#' 
#' A named list. Names are those of the keys, values are the associated hash 
#' values. 
#' 
#' @seealso 
#'   \code{\link[hash]{Extract}} for R-like accessors
#'
#' @examples
#'   h <- hash( letters, 1:26 )
#'   values(h)  # 1:26
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
#'   class( unlist(vals) )            # numeric
#'   class( Reduce( c, vals ) )       # "POSIXct" "POSIXt" 
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
      return( 
        structure( 
          sapply( keys, get, x, ..., simplify=FALSE, USE.NAMES = FALSE ), 
          names=keys 
        )
      )
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
