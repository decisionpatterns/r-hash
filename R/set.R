# ---------------------------------------------------------------------
# METHOD: set.R
#   Sets a key-value pair for the hash object
# 
#  The .set method is an internal method for assigning key-value pairs
#  if handles both constructor and settor cases.  It handles a variety
#  of forms and performs a number of checks.  When a certain type of 
#  input is known to exist.  It is faster to use assign.  See assign.
# 
#  For hash construction it accepts the following formal methods.
#    
#    EXPLICIT key AND value ARGUMENTS
#    NAMED kv PAIRS
#    NAMED VECTORS
#    IMPLICIT KEY-VALUES 
#    
# ---------------------------------------------------------------------




#' assign key-value pair(s) to a hash
#' 
#' 
#' \code{.set} is an internal method for assigning key-value pairs to a
#' \code{\link{hash}}.  Normally, there is no need to use this function.
#' Convenient access is provided by: \code{ hash, \$, [ and [[ } and their
#' corresponding replacement methods.
#' 
#' \code{.set} takes 4 types of arguments: explicitly named key and value
#' vectors named key-value pairs named vectors implicit key-value pairs
#' 
#' The keys are automatically coerced to valid keys and are restricted to
#' character classes.  Values are free to be any valid R object.
#' 
#' 
#' \code{.set} sets zero or more key-value pairs.  If the key(s) already exist,
#' existing values are silently clobbered.  Otherwise, a new value is saved for
#' each key.  Keys and values are by the \code{...} argument. If \code{...} is:
#' 
#' made only of explicitly named \code{keys} and \code{values} arguments then
#' these are taken as the keys and values respectively.
#' 
#' a named list, then the names are taken as keys and list elements are taken
#' as values.
#' 
#' a named vector, then the names are taken as keys.  Vector elements are taken
#' as values.
#' 
#' of length two, keys are taken from the first element, values from the
#' second.
#' 
#' Keys are coerced to type \code{character}.
#' 
#' Keys and values are assigned to the hash as follows:
#' 
#' IF \code{keys} and \code{values} are the same length, key-value pairs are
#' added to the hash pairwise.
#' 
#' IF \code{keys} is a vector of length 1, then this key is assigned the entire
#' \code{values} vector.
#' 
#' IF \code{values} is a vector of length 1, each key of \code{keys} is
#' assigned the value given by \code{values}
#' 
#' IF \code{keys} and \code{values} are of different lengths, both greater than
#' one, then the assignment is considered ambiguous and an error is thrown.
#' 
#' @param hash An hash object on which to set the key-value pair(s)
#' @param ...  Any of several ways to specify keys and values.  See Details.
#' @return \code{.set} exists solely for its side-effects.  An invisible NULL
#' is returned.
#' @author Christopher Brown
#' @seealso See also \code{\link{hash}}, \code{\link{environment}}
#' @keywords methods data manip
#' @examples
#' 
#' 
#'   h <- hash()
#' 
#'   .set( h, keys=letters, values=1:26 )
#'   .set( h, a="foo", b="bar", c="baz" )
#'   .set( h, c( aa="foo", ab="bar", ac="baz" ) )
#'   clear(h)
#'   .set( h, letters, values )
#' 
#' 
.set <-
    function( hash, ... ) {

        li <- list(...) 

      # EXPLICIT 'keys' AND 'values' ARGUMENTS
      #   .set( keys=letters, values=1:26 )
      #     if( identical( names(li) , c('keys', 'values') ) ) {
        if( 
            'keys'   %in% names(li) && 
            'values' %in% names(li) 
        ) {


#' Returns key(s) from a hash
#' 
#' Returns the key(s) from a hash
#' 
#' Returns the character vector containing the keys of a hash object.
#' 
#' @aliases keys names names.hash keys-methods keys,hash-method
#' @param x A \code{\link{hash}} object.
#' @return
#' @returnItem keys A vector of type character
#' @author Christopher Brown
#' @seealso See Also \code{\link{hash}}.
#' @keywords methods data manip
#' @examples
#' 
#' 
#'   h <- hash( letters, 1:26 )
#'   keys(h)  # letters
#' 
#'   names(h) # same
#' 
            keys   <- li[['keys']]


#' Extract values of a hash object.
#' 
#' 
#' Extract \code{values} from a \code{hash} object.  This is a pseudo- accessor
#' method that returns hash values (without keys) as a vector if possible, a
#' list otherwise.
#' 
#' simplifies them to the lowest order (c.f. simplify).  It is very similar to
#' \code{ h[[ keys(h) ]] }, An optional key.  It is identical to \code{ h[[
#' keys(h) ]] }.
#' 
#' For details about hash accessors, please see \code{\link{hash-class}}
#' 
#' 
#' The \code{values} method returns the values from a hash. It is similar to
#' \code{ h[[ keys(h) ]] } except that a named vector or list is returned
#' instead of a hash.  : By default, the returned values are simplified by
#' coercing to a vector or matrix if possible; elements are named after the
#' corresponding key. If the values are of different types or of a complex
#' class than a named list is returned.  Argument \code{simplify} can be used
#' to control this behavior.
#' 
#' If a character vector of \code{keys} is provided, only these keys are
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
#' @aliases values values-methods values,hash-method values<- values<--methods
#' values<-,hash-method values<-,hash,ANY-method
#' @param x The \code{\link{hash}} from where the values retrieved
#' @param keys A vector of keys to be returned.
#' @param ...  Arguments passed to \code{\link{sapply}}
#' @param value For the replacement method, the value(s) to be set.
#' @return Please see details for which value will be returned:
#' @returnItem vector Vector with the type as the values of the hash
#' @returnItem list list containing the values of the hash
#' @author Christopher Brown
#' @seealso See also \code{\link{hash}}, \code{\link{sapply}}.
#' @references http://blog.opendatagroup.com/2009/10/21/r-accessors-explained/
#' @keywords methods data manip
#' @examples
#' 
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
#' 
            values <- li[['values']]
        } else 

      # NAMED KV PAIRS 
      #   .set( a=1, b=2, c=3 )
        if( ! is.null( names( li ) ) ) {
            keys   <- names(li)
            values <- li 
        } else 
 
      # NAMED VECTOR:
      #   .set( c(a=1, b=2, c=3) )
        if( length(li) == 1 ) {
            v <- li[[1]] 
            if( length(names(v) == length(v) ) ) {
                keys   <- names(v)
                values <- v
            } 
        } else 

      # IMPLICIT keys AND values VECTORS
        if( length(li) == 2 ) {
            keys   <- li[[1]]
            values <- li[[2]]    
        }

        keys <- make.keys(keys)

        # cat( length(keys), ", ", keys, "\n" )
        # cat( length(values), ", ", values, "\n" )

      # UNEQUAL keys and values both greater than one
        if (
            length(keys) > 1 &
            length(values) > 1 &
            length(keys) != length(values)
        ) {
            stop(
              "Keys of length ", length( keys ),
              " do not match values of length ", length( values ) , 
              "\n"
            )
        }


      # ASSIGNMENT: 

        if( length(keys) == 1 ) {

            assign( keys, values, envir = hash@.Data )  

        } else if( length( keys ) == length( values ) ) {

            for( i in 1:length(keys) )
              assign( keys[[i]], values[[i]], envir = hash@.Data )
              # assign( keys[[i]], hash( b=12 ), envir = hash@.Data )

        } else {

            if( length( keys ) == 1 )
                assign( keys, values, envir = hash@.Data )

            if( length( values ) == 1 )
                for( i in 1:length(keys) )
                    assign( keys[[i]], values, envir = hash@.Data )
        }

        return( invisible(NULL) )

}


