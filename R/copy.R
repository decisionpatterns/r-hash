#' copy 
#' 
#' Create a copy of a hash. 
#'
#' @param x hash
#' @param ... additional arguments
#'       
#' Creatinga copy using the assingment operator, \code{<-}, does not work as 
#' expected, since hashes are based on environments and environments are 
#' reference objects in R.  The assignment operator consequently creates a 
#' linked copy the original hash and not an independent copy.  The \code{copy} 
#' method provides an identical unlinked copy of the hash.
#' 
#' @return hash, copy of hash \code{x}
#' 
#' @author Christopher Brown
#' 
#' @seealso 
#'   \code{\link[base]{environment}}
#' 
#' @examples
#' 
#'   h <- hash( a=1, b=2 )
#'   h.new <- copy( h )
#'   
#' @name copy
#' @rdname copy
#' @docType methods
#' @export

setGeneric( 'copy', function(x,...) standardGeneric( 'copy'  ) )


#' @name copy,hash-method
#' @rdname copy

setMethod( 'copy', 'hash', 
  function(x, ... )     
    hash( mget( keys(x), x@.xData ) ) 
)



