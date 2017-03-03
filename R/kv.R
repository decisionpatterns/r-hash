#' Key value iteration
#' 
#' Create a list with \code{k} and \code{v} elements that is useful for 
#' explicit iteration 
#' 
#' @param x object such as vector or list to separate into key value pairs
#' @param ... additional arguments
#' @details 
#' 
#' No magic here, just something simple to convert \code{x} into a list of 
#' lists. Each element of \code{x} is broken into a list with elements \code{k} 
#' (key) and \code{v} (value). See examples.
#'
#' For many cases, key-value iteration can be done with \code{*apply} or
#' \code{paste} functions. This is made to be explicit and work on a variery of
#' objects.  
#' 
#' @references 
#' * \url{http://stackoverflow.com/questions/18572921/for-loop-in-r-with-key-value]} \cr
#' * \url{http://stackoverflow.com/questions/4500106/iterate-over-key-value-pair-from-a-list]} \cr
#' 
#' @return  
#' A named list of list; each element of \code{x} becomes a one element list 
#' with elements \code{k} and \code{v} representing the keys and values
#' 
#' @examples 
#' 
#'   h <- hash(a=1,b=2,c=3) 
#'   kv(h)
#' 
#'   for( kv in kv(h) )
#'     cat( kv$k, ":", kv$v, "\n")
#' 
#' @export 

kv <- function(x, ...) UseMethod('kv')

#' @rdname kv

kv.hash <- function(x) {
  x <- values(x)
  kv =list() 
  for( i in 1:length(x) ) { 
    kv[[i]] = list( k=names(x)[[i]], v=x[[i]] )  
  }
  names(kv)=names(x)  
  return(kv)
}

