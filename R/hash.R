#' hash/associative array/dictionary data structure for the R language
#' 
#' Functions for creating and working with hash objects: 
#' 
#' \code{hash} Class constructor 
#' 
#' \code{is.hash} test if object is of class "hash"
#' 
#' \code{as.list}
#' \code{as.list.hash} convert a hash object to a list
#' 
#' @param x a hash object.
#' 
#' @param all.names a logical indicating whether to copy all values or
#' (default) only those whose names do not begin with a dot
#' 
#' @param ...  Additional arguments passed to the function
#' #' HASH KEYS must be a valid character value and may not be the empty string
#' \code{""}.
#' 
#' 
#' @details
#' 
#' \emph{KEYS} must be a valid R name, must be a character vector and must not 
#' be the empty string, \code{""}. When supplied by the used methods will try to coerce 
#' the keys to valid names using \code{\link{make.keys}}
#' 
#' \emph{VALUES} are restricted to any valid R objects.
#' HASH VALUES can be any R value, vector or object.
#' 
#' \emph{code{hash}} returns a hash object.  Key-value pairs may be specified via the
#' \code{...} argument as explicity arguments \code{keys} and \code{values}, as
#' named key-value pairs, as a named vector or as implicit key, value vectors.
#' See examples below for each type. See \code{\link{.set}} for further details and how key-value vectors of
#' unequal length are interpretted.
#' 
#' \emph{ACCESSORS.} Hashes may be accessed via the standard R accessors \code{[}, \code{[[} and
#' \code{\$}.  See \code{\link[hash]{Extract}} for details.
#' 
#' \emph{PASS-BY REFERENCE.} Environments and hashes are special objects in R because
#' only one copy exists globally. When provided as an argument to a function, no
#' local copy is made. When passes to functions, those functions can change the
#' value of the hash. This is not typical of R.
#' 
#' \emph{PERFORMANCE.}  Hashes are based on R's native environments and are designed
#' to be exceedingly fast using the environments internal hash table.  For
#' small data structures, a list will out-perform a hash in nearly every case.
#' For larger data structure, i.e. > 500 key value pair the performance of the
#' hash becomes faster.  Much beyond that the performance of the hash far
#' outperforms native lists.
#' 
#' 
#' @return 
#'    \code{hash} hash object
#'    
#'    \code{is.hash} logical value indicating if the argument is a hash.
#'    
#'    \code{as.list} list conversion from hash
#'    
#'    \code{length} integer; number of key-value pairs in the hash
#' 
#' @author Christopher Brown
#' 
#' @seealso 
#'   \code{\link{Extract}}
#' 
#' @examples
#' 
#'   hash()      # Empty 
#'   h <- hash() # give a name to the hash 
#' 
#'   hash( key=letters, values=1:26 )  # Two lists/vectors or equal length
#'   
#'   hash( 1:3, lapply(1:3, seq, 1 ))
#'   
#'   hash( a=1, b=2, c=3 )             # key-value pairs   
#'   hash( c(a=1, b=2, c=3) )          # vector of key-value pairs
#'   hash( list(a=1,b=2,c=3) )         # list of key-value pairs
#' 
#'   hash( c("foo","bar","baz"), 1:3 )
#'   hash( c("foo","bar","baz"),  lapply(1:3, seq, 1 ) )
#'  
#'   is.hash( hash() )
#'   as.list(h)   # CONVERT TO LIST
#' 
#' @rdname hash
#' @aliases hash 
#' @export hash

hash <- function( ... ) {

  li <- list(...)  

  # INITIALIZE A NEW HASH   
  h <- new( 
    "hash" , 
     new.env( hash = TRUE , parent=emptyenv() )  
  )

  if ( length(li) >  0  ) { 
    if( length(li) > 0 ) .set( h, ... )
  }

  return(h)

}
	

# ---------------------------------------------------------------------
# MISC. FUNCTIONS
# ---------------------------------------------------------------------

#' @aliases is.hash
#' @rdname  hash
#' @export is.hash

is.hash <- function(x) is( x, "hash" )


#' @aliases as.list.hash
#' @rdname hash
#' @export as.list.hash

as.list.hash <- function(x, all.names=FALSE, ...) 
  as.list( x@.Data, all.names, ... )

