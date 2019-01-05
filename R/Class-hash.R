#' Class "hash"
#' 
#' Implements a S4 hash class in R similar to hashes / associatesd arrays /
#' dictionaries in other programming languages.  Where possible, the hash class
#' uses the standard R accessors: `\$`, `[` and `[[` as well as
#' other common hash methods.  Hash construction is flexible and takes several 
#' syntaxes. See the constructor method [hash()] for detaiols
#' 
#' For shorter key-value pairs, lists yield higher performance. Hashes 
#' outperform list once the have an appreciable length typically greater than 
#' 100 elements. Hash objects have defined methods that (should) make them 
#' flexible, intuitive and easy to use especially for developers familar with 
#' other languages.
#'  
#' The `haah` class inherits from environment and has no defined slots. It is 
#' essentially a wrapper around [base::environment()] and is very similar to 
#' reference classes in that  most of the semantic are pass-by-reference rather
#' than pass-by-value. For this reason, some of the behaviour is not as expected.
#' 
#' @slot .xData an [base::environment()]
#' 
#' @author Christopher Brown
#' 
#' @seealso 
#'  - [extract] : for accessor methods
#'  - [is.hash()] : for testing whether the object is a hash
#'  - [as.list.hash()] : for converting hash to a list
#'   
#' @examples
#'   h <- new( "hash" )   # new empty hash
#'   h <- hash()          # same
#'   class(h)             # "hash"
#'   is.hash(h)           # TRUE
#'   
#'   h[ letters ] <- 1:26 # populate the hash
#'   
#'   as.list( h )         # convert to a list
#'
#'   hash( list(a=1,b=1) )
#'   showClass("hash")
#'
#' @name hash-class
#' @rdname hash-class
#' @exportClass hash

setClass( 'hash', contains = 'environment' )
