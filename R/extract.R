# ----------------------- ACCESSOR METHODS ------------------------------
#' Extract 
#' 
#' These are the hash accessor methods. They closely follow the R style. 
#' 
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
#' \code{[} is a slice operator.  It returns a subset of key value pairs of the
#' hash, i.e. another hash with specifies keys-value paris. Unlike the other 
#' accessor methods, \code{[} returns a \emph{copy}.
#' 
#'   NAMED ACCESS/REPLACEMENT:
#'   
#'   h$x             : returns value of key \code{x}; 
#'   h$x <- value    : sets key \code{x} to \code{value}; 
#'   h$x <- NULL     : deletes key-value pair \code{x}
#'    
#'    
#'   INTERPRETED ACCES/REPLACEMENT:
#'     
#'   h[[x]]          : returns value of key \code{x}; \code{x} is interpreted.
#'   h[[x]] <- value : sets the values of key \code{x}; \code{x} is interpreted.
#'   h[[x]] <- NULL  : deletes key-value pair \code{x}; \code{x} is interpreted.  
#'   
#'   
#'   HASH SLICING:
#'   h[]             : returns a copy of h, same as \code{copy(h)}
#'   h[x]            : a hash slice of keys 
#'   
#'   h[] <- value    : error, undefined key
#'   h[x] <- value   : set values for keys \code{x} to \code{value}(s)
#'   h[x] <- NULL    : delete keys \code{x}
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
#'   \code{\link{del}} for removing keys
#'   \code{\link{clear}} for removing all keys
#'   
#'   \code{\link{keys}} to get/set/rename keys
#'   \code{\link{values}} to get/set/edit values
#'
#'   \code{\link{set}}    to set values internal method
#'   
#'   \code{\link{hash}}  
#'   
#'   
#' @examples
#' 
#'   h <- hash( c('a','b','c'), 1:3 )
#'
#'   # NAMED ACCESS
#'   
#'   h$a  # 1
#'   h$c  # 3
#'   
#'   # class of values change automatically
#'   class(h$a)  # integer
#'   h$a <- 1.1 
#'   class(h$a)  # numeric
#'   
#'   # values can contain more complex objects
#'   h$a <- 1:6
#'   h
#'
#'   h$a <- NULL  # DELETE key 'a', will return null
#'   
#'   
#'   # INTERPRETED ACCESS
#'   
#'   h[[ "a" ]] <-"foo"    # Assigns letters, a vector to "foo"
#'   nm = "a"
#'   
#'   # SLICE ACCESS
#'   h[ nm ] <- "bar"   # h$a == bar
#'   h[ nm ] <- NULL
#'   
#'   
#'   # Slice 
#'   h[ keys(h) ]
#'   h[ keys(h) ] <- list( 1:2, 1:3 )
#'   h
#'
#' @name Extract      
#' @rdname Extract
#' @docType methods
#' @aliases Extract

NULL


## --------------------------------------------------------------------- 
## [ : SLICE METHOD
## ---------------------------------------------------------------------

#' @name [,hash,ANY,missing,missing-method
#' @rdname Extract


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


#' @name [,hash,missing,missing,missing-method
#' @rdname Extract

setMethod( '[', signature( 'hash', 'missing', 'missing', 'missing' ),
  function(x,i,j, ..., drop ) {
    return( x )                  
  }
)

## --------------------------------------------------------------------
## [<- : SLICE REPLACEMENT
## ---------------------------------------------------------------------
#   NB.  Although we would like to use assign directly, we use set 
#        because it deals with the ambiguity of the lengths of the 
#        key and value vectors.


#' @name [<-,hash,ANY,missing,ANY-method
#' @rdname Extract

setReplaceMethod( '[', c(x ="hash", i="ANY" ,j="missing", value="ANY") ,
	function( x, i, ...,  value ) {
	  .set( x, i, value, ...  )  
	  return( x )
    }
)



#' @name [<-,hash,ANY,missing,NULL-method 
#' @rdname Extract

setReplaceMethod( '[', c(x="hash", i="ANY", j="missing", value="NULL") ,
    function( x, i, ...,  value ) {
      del( i, x )
      return( x )
    }
)
  

# TEST:
# h[ "foo" ] <- letters # Assigns letters, a vector to "foo"
# h[ letters ] <- 1:26
# h[ keys ] <- value
# h[ 'a' ] <- NULL 



## --------------------------------------------------------------------
## $ - named accessor
##
##  $ -- DEPRECATED
##   This is deprecated since '$' is defined on environments and 
##   environments can be inherited in objects. There is not need for a
##   special functions
# ---------------------------------------------------------------------

## --------------------------------------------------------------------
## $<- - named replacement 
## --------------------------------------------------------------------
# SPECIAL CASE: NULL value
#   When assign a null values to a hash the key is deleted. It is 
#   idiomatic when setting a value to NULL in R that that value is
#   removed from a list or environment. 
#   
#   If R's behavior changes this will go away.
#   It is interesting to note that [[ behaves this way


#' @name $<-,hash,NULL-method
#' @rdname Extract

setReplaceMethod( '$', c( x="hash", value="NULL"),
  function(x, name, value) {
    remove( list=name, envir=x@.xData )
    x
  }
)


## ---------------------------------------------------------------------
## [[ -- interpret accessor (DEPRECATED)
##
##   This is deprecated since this is handled by R natively.
##   Return single value, key,i, is a name/gets interpretted.
## 
## ---------------------------------------------------------------------

## ---------------------------------------------------------------------
## [[ -- interpreted replacement 
## ---------------------------------------------------------------------

#' @name [[<-,hash,ANY,missing,ANY-method
#' @rdname Extract 

setReplaceMethod( '[[', c(x="hash", i="ANY", j="missing", value="ANY") ,
  function(x,i,value) {
    assign( i, value, x@.xData )
    return( x )
  }
)


#' @name [[<-,hash,ANY,missing,NULL-method
#' @rdname Extract
  
setReplaceMethod( '[[', c(x="hash", i="ANY", j="missing", value="NULL") ,
  function(x,i,value) {
    rm( list=i, envir=x@.xData )
    return( x )
  }
)


