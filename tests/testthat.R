library(testthat)

`%>%` <- function( lhs, rhs ) { 

    lr <- lazy(rhs)
    r <- substitute(rhs)
    
    if( is.call(r) ) { 
      lst_r <- as.list(r)
      do.call( as.character(lst_r[[1]]), c( substitute(lhs), lst_r[-1] ) )
    } else {
      do.call( eval(r), list(lhs))
    }
    
} 
