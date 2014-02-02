#' setkeys - change/rename the keys of a hash 
#' 
#' Changes the keys of a hash from \code{old} keys to \code{new}
#'
#' @param x hash object to rename keys on 
#' @param old character (or coerciable to character); old keys/names
#' @param new character (or coerciable to character); new keys/names
#' 
#' This methods renames keys in a hash. If there is a collision between old
#' and new names, the old names are first copied to a temporary slot to 
#' ensure  
#' 
#' \code{setkeys} is S4 generic so that other packages might also use the 
#' generic functions
#' 
#' @return Invisiblly returns \code{x} with its keys renamed. 
#' 
#' @seealso 
#'   \code{\link{keys}} 
#'   \code{\link{hash}}
#'   
#' @examples 
#' 
#'    h <- hash( letters, 1:26 )
#'    
#'    h2 <- copy(h)
#'    setkeys( h2, keys(h), paste0( keys(h), "1" ) )
#'    h2 
#'    
#'    h3 <- copy(h)
#'    setkeys( h3, keys(h), rev( keys(h) ) )
#'    h3 
#'    
#' @note setkeys is modeled after \code{setnames} in the data.table package.  
#' @name setkeys  
#' @rdname setkeys
#' @export 

setGeneric( 'setkeys', function(x, old, new) standardGeneric("setkeys") )


#' @name setkeys,hash,ANY,ANY-method
#' @aliases setkeys,hash-method
#' @rdname setkeys 

setMethod( "setkeys", c("hash","ANY","ANY"),
  function( x, old, new ) {
    
    old <- as.character(old)
    new <- as.character(new)
    
    
    # old keys don't match existing keys
    if( any( ! old %in% keys(x) ) ) {
      wh <- old[ which( ! old %in% keys(x) ) ]
      stop( 
        "\n  keys: "
        ,paste0( wh, ",", collapse=" " )
        , " not found in ", deparse(substitute(x)) 
      )
    }
    
    # old = new
    if( all(old==new) ) return( invisible(x) )
    
    # duplicated keyname in new.
    if( any( wh <- duplicated( new) ) ) 
      stop( "duplicated keys names were supplied to setkeys - ", paste0( new[wh], collapse=", " ) )
    
    # old and new don't align
    if( length(old) != length(new) ) 
      stop( "Length of old and new keys differ." )
    
    
    # Detect collison of new keys with old. If they 
    # exist create an intermediate set of names.
    intermediate <- new
    while( any( intermediate %in% old ) )
      if( is.null(intermediate) )
        intermediate <- paste0( "..", new ) else 
          intermediate <- paste0( "..", intermediate ) 
    
    if( any( intermediate != new ) ) {
      
      for( i in 1:length(old) )
        assign( intermediate[[i]], x[[ old[[i]] ]], x )
      
      for( i in 1:length(old) )
        del( old[[i]], x )
      
      for( i in 1:length(old) )
        assign( new[[i]], x[[ intermediate[[i]] ]], x )
      
      for( i in 1:length(old) ) 
        del( intermediate[[i]], x )
      
    } else { 
      
      for( i in 1:length(old) ) {
        assign( new[[i]], x[[ old[[i]] ]], x )
        del( old[[i]], x )
      }  
      
    }
    
    return( invisible(x) )
    
  }
    
)
