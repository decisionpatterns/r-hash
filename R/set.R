#' set -assign key-value pair(s) to a hash
#' 
#' \code{.set} is an internal method for assigning key-value pairs to a
#' \code{\link{hash}}.  Normally, there is no need to use this function.
#' Convenient access is provided by: \code{hash}, \code{$}, \code{[}, \code{[[},
#' \code{values} and their corresponding replacement methods.
#' 
#' @param hash An hash object on which to set the key-value pair(s)
#' @param ...  Any of several ways to specify keys and values.  See Details.
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
#' @return 
#' \code{.set} exists solely for its side-effects.  An invisible NULL
#' is returned.
#' 
#' @author Christopher Brown
#' 
#' @seealso \code{\link{hash}}, \code{\link{environment}}
#' 
#' @examples
#' 
#'   h <- hash()
#' 
#'   hash:::.set( h, keys=letters, values=1:26 )
#'   hash:::.set( h, a="foo", b="bar", c="baz" )
#'   hash:::.set( h, c( aa="foo", ab="bar", ac="baz" ) )
#'   clear(h)
#'   hash:::.set( h, letters, values )
#' 
#' @name set
#' @rdname set
#' @aliases set .set

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
            keys   <- li[['keys']]


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


