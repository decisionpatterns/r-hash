# -----------------------------------------------------------------------------
# make.keys.R
#
# FUNCTION: make.keys
#
#  Coerces arguments to a valid value that can be be passed to various hash 
#  utilitites.
#  
# -----------------------------------------------------------------------------



#' creates/coerces objects to proper hash keys
#' 
#' Given an vector of any type, \code{make.keys} tries to coerce it into a
#' character vector that can be used as a hash key.  This is used internally by
#' the hash package and should not be normally needed.
#' 
#' This function is used internally by the \code{\link{hash}} class to ensure
#' that the keys are valid. There should be no need to use this externally and
#' is only documented for completeness.
#' 
#' @param key An object that represents the key(s) to be coerced to a valid
#' hash keys.
#' @return A character vector of valid keys
#' @author Christopher Brown
#' @seealso See also as \code{\link{hash}}
#' @keywords methods data manip
#' @examples
#' 
#' 
#'   make.keys( letters )
#'   make.keys( 1:26 ) 
#' 
#' 
make.keys <- function(key) {

	key <- as.character( key )  

	if ( length(key) == 0 ) stop( 
  	    "You must provide at least one key to the hash" 
    )

	if ( any(key=="") ) stop(
	  "\nThe empty character string, '', cannot be used for a key at key(s): ", 
	  paste( which( key == "" ), collapse=", " )
	)	

	return( key )

}


