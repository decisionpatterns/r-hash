#' format - format a hash object for prinint Methods for Function format in Package 'hash'
#' 
#' Format a hash for printing/showing.
#' 
#' @param x hash object
#' @param max.print maximum numbers of rows to print
#' 
#' @seealso 
#'   \code{\link{format}}
#'   
#' @name format
#' @aliases format,hash-method format
#' @docType methods

setMethod( "format", "hash", 

  function( x, max.print = getOption('max.print'), ... ) {

    indent <- list(...)$indent

    if( is.null(indent) ) {
      indent <- "" 
    } else {
      indent <- paste( indent, "    ", sep="" )
    }

    indent2 <- paste( indent, "  ", sep="" )

    ret <- paste( "<hash> containing ", length(x), " key-value pair(s).\n", sep="" )
    
    i <- 0
    for ( k in keys(x)[1:min(length(x),max.print)] ) {
      
      # vals <-  paste( format( x[[k]], indent=indent ), collapse = " " )  
      # THERE ARE SOME CASES WHERE FORMAT DOESN'T WORK, WE TRAP THESE.

      vals <- try( paste( format( x[[k]], indent=indent ), collapse = " " ), silent=T )  
      if( inherits( vals, "try-error" ) ) vals <- paste( as.character( x[[k]] ), collapse=", " )
      
      ret <-  paste( ret, indent2, k, " : ", vals, "\n", sep=""  )    

      i <- i + 1 
      if( i >= max.print ) { 
        ret <- paste( ret, "Reached getOption(max.print)=", max.print, " -- omitted ",
                      length(x) - max.print, " entries.\n", sep=""
                    ) 
        break
      }

    }

    ret <- gsub( "\n\n", "\n", ret ) 
    ret

  }
)

                                       


  

