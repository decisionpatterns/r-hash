#' Head or tail of a hash
#' 
#' Returns the first or last part of a hash
#' 
#' @param x hash;
#' @param ... Additional arguments passed to [utils::head()]
#' 
#' @description 
#' 
#' There is no guaranteed order to the keys-values are produced. This may change
#' in the futures.
#' 
#' @return 
#' A hash object display the first `n` key-value pairs.
#' 
#' @seealso 
#'   - [utils::head()]
#'   
#' @examples
#' 
#'   h <- hash( letters, 1:26)
#'   head(h)
#'   tail(h)
#'    
#' @importFrom utils head 
#' @importFrom utils tail 
#' @rdname head
#' @export 

head.hash <- function(x, ...) 
  x[ head( keys(x), ... ) ]

#' @rdname head
#' @export 

tail.hash <- function(x, ...)
  x[ tail( keys(x), ... ) ]
