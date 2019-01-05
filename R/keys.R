#' keys - get/set key(s) from a hash
#' 
#' Returns the key(s) from a hash, unsorted by default
#' 
#' @param x A [hash()] object.
#' @param value character or object coercable to character
#' @param sorted logical; whether the keys should be sorted 
#'        (DEFAULT: `getOption('hash.sorted', FALSE)`)
#' @param ... Used to allow for additional arguments for keys
#' 
#' @details 
#' Returns the character vector containing the keys of a hash object. By 
#' default, the responses are not sorted. Set `sorted=TRUE` to return 
#' keys in sort order.
#' 
#' `names` uses `base::names` and will always return a sorted list of
#' names. `keys` should generally be used in favor of `names`, but 
#' names can be useful if you want sorted names for one instance when all others
#' don't provide a sorted list.
#' 
#' @return For `keys` and `names`, a character vector of key names
#'   For the replacement methods `keys<-`, a hash object with the keys 
#'   renamed to `value`
#'    
#' @author Christopher Brown
#' 
#' @seealso
#'   - [setkeys()] : rename specific hash keys. 
#'   - [hash()] : hash object
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
    setkeys(x, keys(x), value ) 
  }
)  


#' @name keys<-,hash,ANY-method
#' @rdname keys

setReplaceMethod( "keys", c('hash','ANY'), 
  function( x, value) { 
    value <- as.character(value)
    setkeys(x, keys(x), value ) 
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


