#' Extract 
#' 
#' These are the hash accessor methods. They closely follow the R style.
#' 
#' @param x \code{\link{hash}} object 
#' @param i keys to get or set
#' @param j unused; retained to be compatoble with base package
#' @param drop unused; retained to be compatible with base package
# @param keys a vector of keys to be returned.
# @param value For the replacement method, the value(s) to be set.
#' @param ...  Arguments passed to additional methods \code{\link{sapply}}
#'
#'
#' \code{$} is a look-up operator for a single key.  The base \code{$} method
#' are used directly on the inherited environment.  The supplied key is taken 
#' as a string literal and is not interpreted.  The replaement form, \code{$<-} 
#' mutates the hash in place.
#' 
#' \code{[[} is the look-up, extraction operator.  It returns the values of a
#' single key. The replacement method, \code{[[<-} mutates the hash in place. 
#' 
#' \code{[} is a subseting operator.  It returns a hash slice, i.e. another 
#' hash of  of the specified
#' keys. Unlike the other accessor methods, \code{[} returns a \emph{copy}.
#' 
#' simplifies them to the lowest order (c.f. simplify).  It is very similar to
#' \code{ h[[ keys(h) ]] }, An optional key.  It is identical to \code{ h[[
#' keys(h) ]] }.
#' 
#' 
#'   h$x             : returns value associated with key \code{x}; \code{x} is 
#'                     taken as a literal and not interpreted.
#'   h$x <- value    : sets valie associated witk key \code{x} to \code{value}; \code{x} is taken as a literal and not interpreted.
#'    
#'   h[[x]]          : returns values associated with key(s) \code{x}; \code{x} is interpreted
#'   h[[x]] <- value : sets the values with the associated keys. 
#'   
#'   h[]      : returns a copy of h
#'   h[x]     : a hash slice 
#'   
#'   h[] <- values  : error, undefined
#'   h[x] <- values : set values for x
#'
#'   
#' \code{$} and \code{[[} return the value for the supplied argument. If 
#' \code{i} is not a key of \code{x}, \code{NULL} is returned with a warning.
#' 
#' \code{[} returns a hash slice, a subhash copy \code{x} with only the keys 
#' \code{i} defined. 
#' 
#' See details above for the complete explanation.
#' 
#' @author Christopher Brown
#' 
#' @seealso 
#'   \code{\link{hash}} 
#'   \code{\link{sapply}} 
#'   \code{\link[base]{drop}}
#'   
#' @examples
#' 
#'   h <- hash( letters, 1:26 )
#'   values(h)  # 1:26
#'   values(h, simplify = FALSE )
#'   values(h, USE.NAMES = FALSE )
#' 
#'   h <- hash( 1:26, letters )
#'   values(h) 
#'   values(h, keys=1:5 )
#'   values(h, keys=c(1,1,1:5) )
#'   values(h, keys=1:5) <- 6:10 
#'   values(h) <- rev( letters )
#' 
#'   h[ "foo" ] <- letters # Assigns letters, a vector to "foo"
#'   h[ letters ] <- 1:26
#'   h[ keys ] <- value
#'   h[ 'a' ] <- NULL 
#'
#' @name Extract      
#' @rdname Extract
#' @docType methods
#' @aliases Extract

NULL


#' @author Christopher Brown
#' @seealso \code{\link{hash}}, \code{\link{values}}, \code{\link{set}},
#' \code{\link{as.list}}
#' @keywords methods data manip
#' @examples
#' 
#' 
#'   h <- hash()
#'   h <- hash( letters, 1:26 )
#' 
#'   h$a   		
#'   h$a <- "2"   
#'   h$z <- NULL          # Removes 'z' from 
#' 
#'   h[['a']] 
#'   h[['a']] <- 23
#' 
#'   h[ letters[1:4] ]    # hash with a,b,c,d
#'   h[ letters[1:4] ] <- 4:1
#' 
#' 


  
#' @rdname Extract
#' @aliases [,hash-method

setMethod( 
  '[' , 
  signature( x="hash", i="ANY", j="missing", drop = "missing") ,  
  function( 
    x,i,j, ... , 
    # na.action = 
    #  if( is.null( getOption('hash.na.action') ) ) NULL else 
    #  getOption('hash.na.action') , 
    drop 
  ) {
    
    .h <- hash() # Will be the new hash
    for( k in i ) assign( k, get(k,x), .h@.Data )
    
    return(.h)
    
  }
)


#' @rdname Extract
#' @aliases [,hash,mising-method

setMethod( '[', signature( 'hash', 'missing', 'missing', 'missing' ),
  function(x,i,j, ..., drop ) {
    return( copy(x) )                  
  }
)



#' @name [<-,hash,ANY-method
#' @rdname Extract


setReplaceMethod( '[', c(x ="hash", i="ANY", j="missing", value="ANY") ,
  function( x, i, ...,  value ) {
	  .set( x, i, value, ...  )  
	  return( x )
    }
)



#' @name [<-,hash,ANY-method
#' @rdname Extract

setReplaceMethod( '[', c(x="hash", i="ANY", j="missing", value="NULL") ,
    function( x, i, ...,  value ) {
      del( i, x )
      return( x )
    }
)
  

# # ---------------------------------------------------------------------
# # $ -- DEPRECATED
# #   This is deprecated since '$' is defined on environments and 
# #   environments can be inherited in objects
# #
# # ---------------------------------------------------------------------
# 
# # SPECIAL CASE: NULL value
# #   When assign a null values to a hash the key is deleted. It is 
# #   idiomatic when setting a value to NULL in R that that value is
# #   removed from a list or environment. 
# #   
# #   If R's behavior changes this will go away.
# #   It is interesting to note that [[ behaves this way
# 
# # rdname extract,hash-methods
# #' @aliases $<-,hash,NULL-method
# 
# setReplaceMethod( '$', c( x="hash", value="NULL"),
#   function(x, name, value) {
#     remove( list=name, envir=x@.xData )
#     x
#   }
# )



# # ---------------------------------------------------------------------
# # [[ -- DEPRECATED:
# #   This is deprecated since this is handled by R natively.
# #   Return single value, key,i, is a name/gets interpretted.
# # 
# #   NB: We no longer use .get.
# # ---------------------------------------------------------------------
# 
# # @rdname extract,hash-methods
# #' @aliases [[<-,hash,NULL-method
# setReplaceMethod( '[[', c(x="hash", i="ANY", j="missing", value="ANY") ,
#   function(x,i,value) {
#     assign( i, value, x@.xData )
#     return( x )
#   }
# )

# CASE: hash$value <- NULL
#   Deletes the value  



#' @name [[,hash,ANY-method
#' @rdname Extract

setReplaceMethod( '[[', c(x="hash", i="ANY", j="missing", value="NULL") ,
  function(x,i,value) {
    rm( list=i, envir=x@.xData )
    return( x )
  }
)

