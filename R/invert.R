# ----------------------------------------------------------------------------------
# METHOD: invert( hash )
#  produces a hash with the values as keys and the keys as values
# ----------------------------------------------------------------------------------

#' Create/invert a hash.
#' 
#' THIS IS AN EXPERIMENTAL FUNCTION. THE IMPLEMENTATION OR INTERFACE MAY CHANGE
#' IN THE FUTURE.
#' 
#' \code{invert} exchanges the keys and values of a hash. 
#' 
#' \code{inverted.hash} is a constructor method that directly makes an inverted
#' hash.
#'
#' @param x A \code{\link{hash}} object
#' @param ...  Arguments passed to the \code{\link{hash}} function.
#' 
#' @details
#' Each element of the \code{values(x)} becomes a key in a new hash; the 
#' associatedis coerced to a key value is the  
#' The value becomes the associated key.
#' 
#' For \code{inverted.hash}, a hash is created thnn inverted.  It is defined
#' as:
#' 
#' \code{ function(...) invert(hash(...)) }
#' 
#' 
#' @return A hash object with: keys as the unique elements of \code{values(x)}
#' and values as the associated \code{keys{x}}
#' 
#' @author Christopher Brown
#' 
#' @seealso See also \code{link{hash}} and \code{\link{make.keys}}
#'
#' @examples
#' 
#'   h <- hash( a=1, b=1:2, c=1:3 )
#'   invert(h)
#' 
#'   inverted.hash( a=1, b=1:2, c=1:3 )
#'   
#' @rdname invert
#' @docType methods
#' @export

setGeneric( "invert", function(x) standardGeneric( "invert" ) )


#' @rdname invert

setMethod( 'invert', 'hash',
  function(x) {
    h <- hash() 
    for( k in keys(x) ) {
      for( v in make.keys(x[[k]]) ) {
          if ( ! has.key(v,h) ) h[[v]] <- k 
            else h[[v]] <- append( h[[v]], k )
      }
    }

    return(h)
  }

)

#' @rdname invert
#' @export
inverted.hash <- function(...) invert( hash(...) )


