#' creates/coerces objects to proper hash keys
#' 
#' **Notes:** 
#' - This function is not exported. 
#' - `make.keys()` will be deprecated in a future release; Use `make_keys()` 
#'   instead.
#'  
#' @param key An object that represents the key(s) to be coerced to a valid
#' hash keys.
#'
#' @details 

#' Given a vector of any type, `make_keys` tries to coerce it into a
#' character vector that can be used as a hash key. It is just a wrapper 
#' around [base::as_character()] with some additional error checking.
#' 
#' #' `make_keys` will replace `make.keys` in a future release.
#'
#' @note 
#' This is used internally by the hash package and should not be normally 
#' needed.  It is *not* exported.
#' 
#' @return A character vector of valid keys/names
#' 
#' @seealso 
#'   - [base::as_character()] - which this function wraps 
#'   - [base::make.names()] - related method
#'   
#' @examples
#'   make_keys( letters )
#'   make_keys( 1:26 )
#'    
# @export   
make_keys <- function(key) {

	key <- as.character(key)  

	if( length(key) == 0 ) 
	  stop("You must provide at least one key to the hash")

	if( any(key=="") ) 
	  stop(
	    "\nThe empty character string, '', cannot be used for a key at key(s): ", 
	    paste( which( key == "" ), collapse=", " )
	  )	

	key 
}


#' @rdname make_keys
# @export 

make.keys <- make_keys 