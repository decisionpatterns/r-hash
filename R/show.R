# -----------------------------------------------------------------------------
# show.r
# 
# METHODS: show 
#  The default method on the class.  Perhaps this should return the 
#  length.
#
#  See Also: print
# -----------------------------------------------------------------------------

setMethod( "show" , "hash" ,
  function( object )  { 
    message( "<hash> containing ", length(object), " key-value pair(s)." )
    for( k in keys(object) ) {
      
      message( "  ", k, " : ", appendLF=FALSE )
      
      vals <- object[[k]]
      len <- length(vals)
      max.print <- getOption("max.print")
      too_large <- len > max.print
      
      if( too_large ) vals <- vals[ 1:max.print ]  
      cat( paste( as.character( object[[k]] ), collapse=", " ) )
      
      if( too_large ) 
        message( "  Reached max.print (", max.print, ") -- omitted ",
          len - max.print, " entries.\n", appendLF=FALSE   )
      
      cat("\n" )
    }
  }
)

# setMethod( "show" , "hash" ,
#	function(object) cat(format(object))
# )
    
    
    
