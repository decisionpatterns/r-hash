

#' Removes all key-value pairs from a hash
#' 
#' \code{clear} removes all key-values from a hash.
#' 
#' Currently \code{clear} removes (\code{rm}) the key-value pairs on the hash.
#' For large hashes it might be faster to reinitialize the hash, though this
#' might cause memory leaks.
#' 
#' @aliases clear clear-methods clear,hash-method
#' @param x A \code{hash} object.
#' @return None. Method clear exists entirely for its side effects.
#' @note \code{clear} should be called prior to removing a hash.  This ensures
#' that the memory from the environment is freed.
#' @author Christopher Brown
#' @seealso \code{\link{del}} to remove specific key-values from the hash.
#' \code{\link{hash}}.
#' @keywords methods data manip
#' @examples
#' 
#' 
#'   h <- hash( letters, 1:26 )
#'   h # An object of type 'hash' containing 26 key-value pairs.
#'   clear(h)  
#'   h # An object of type 'hash' containing 0 key-value pairs.
#' 
#' 
NULL





#' Create a seperate copy of a hash object.
#' 
#' The copy hash method creates a independent copy of a hash object.  Creating
#' a copy using the assingment operator, \code{<-}, does not work as expected,
#' since hashes are based on environments and environments are reference
#' objects in R.  The assignment operator consequently creates a linked copy to
#' the original hash and not an independent copy.  The \code{copy} method
#' provides an identical unlinked copy of the hash.
#' 
#' 
#' @name copy-methods
#' @aliases copy copy-methods copy,hash-method
#' @docType methods
#' @return A hash object.
#' @section Methods: \describe{
#' 
#' \item{list("signature(x = \"hash\")")}{ Creates and returns an identical,
#' independent, unreferenced copy of the the hash.  } }
#' @author Christopher Brown
#' @seealso \code{\link{environment}}
#' @keywords methods
#' @examples
#' 
#' 
#'   h <- hash( a=1, b=2 )
#'   h.new <- copy( h )
#' 
#' 
NULL





#' Remove key-value pair(s) from a hash
#' 
#' Removes key-value pair(s) from a hash.
#' 
#' 
#' @aliases del del-methods del,ANY,hash-method delete delete-methods
#' delete,ANY,hash-method
#' @param x An object that will be coerced to valid key(s) to be removed from
#' the hash.  \code{x} will be coerced to a valid hash keys using
#' \code{\link{make.keys}}
#' @param hash A \code{\link{hash}} object
#' @return None. This method exists solely for the side-effects of removing
#' items from the hash.
#' @author Christopher Brown
#' @seealso See Also as \code{\link{hash}}, \code{\link{make.keys}}.
#' @keywords methods data manip
#' @examples
#' 
#' 
#'   h <- hash( letters, 1:26 )
#'   h # 26 elements
#'   del( "a", h )
#'   h # 25 elements
#' 
#' 
NULL





#' Methods for Function format in Package 'hash'
#' 
#' Format a hash for printing.
#' 
#' 
#' @name Format hash object for pretty printing
#' @aliases format,hash-method format
#' @docType methods
#' @section Methods: \describe{ \item{x = "hash"}{ Format a hash for pretty
#' printing. } }
#' @seealso See also \code{\link{format}}
#' @keywords methods
NULL





#' Test for existence of key(s) on a hash
#' 
#' \code{has.key} returns a logical vector as long as \code{keys}, indicating
#' which keys are defined on the hash.
#' 
#' None.
#' 
#' @aliases has.key has.key-methods has.key,ANY,hash-method
#' @param key A vector whose entries will be coerced to valid keys.
#' @param hash A \code{\link{hash}} object.
#' @param ...  arguments passed to further functions
#' @return
#' @returnItem logical A logical vector of length \code{key} indicating whether
#' the key is defined in the hash.  \code{has.key} also accepts \code{...} to
#' be passed to underlying \code{sapply}
#' @author Christopher Brown
#' @seealso See also \code{\link{hash}}
#' @keywords methods data manip
#' @examples
#'                             
#' 
#'     h <- hash( letters, 1:26 )
#'     all( has.key( letters, h ) ) # TRUE
#' 
NULL





#' Accessor methods for the hash class.
#' 
#' R style accesors for the \code{\link{hash-class}}.
#' 
#' These are the hash accessor methods. They closely follow an R style.
#' 
#' \code{$} is a look-up operator for a single key.  The native \code{$} method
#' is used.  The key is taken as a string literal and is not interpreted.
#' 
#' \code{[[} is the look-up, extraction operator.  It returns the values of a
#' single key.
#' 
#' \code{[} is a subseting operator.  It returns a (sub) hash with the
#' specified keys.  All other keys are removed.
#' 
#' @aliases hash-accessors $,hash-method $<-,hash-method $<-,hash,ANY-method
#' $<-,hash,ANY,NULL-method $<-,hash,ANY,ANY-method
#' $<-,hash,missing,NULL-method $<-,hash,NULL-method
#' [,hash,missing,missing,missing-method [,hash,ANY,missing,missing-method
#' [<-,hash,ANY,missing-method [<-,hash,ANY,missing,ANY-method
#' [<-,hash,ANY,missing,NULL-method [[,hash,ANY,missing-method
#' [[<-,hash,ANY,missing-method [[<-,hash,ANY,missing,ANY-method
#' [[<-,hash,ANY,missing,NULL-method
#' @return
#' 
#' \$ and [[ return the value for the supplied argument. If a key does not
#' match an existing key, then \code{NULL} is returned with a warning.
#' 
#' [ returns a hash slice, a sub hash with only the defined keys.
#' @author Christopher Brown
#' @seealso \code{\link{hash}}, \code{\link{values}}, \code{\link{.set}},
#' \code{\link{as.list}}
#' @keywords methods data manip
#' @examples
#' 
#' 
#'   h <- hash()
#'   h <- hash( letters, 1:26 )
#' 
#'   h$a 			
#'   h$a <- "2"   
#'   h$z <- NULL          # Removes 'z' from 
#' 
#'   h[['a']] 
#'   h[['a']] <- 23
#' 
#'   h[ letters[1:4] ]    # hash with a,b,c,d
#'   h[ letters[1:4] ] <- 4:1
#' 
#' 
NULL





#' Class "hash"
#' 
#' 
#' Implements a S4 hash class in R similar to hashes / associatesd arrays /
#' dictionaries in other programming languages.  Where possible, the hash class
#' uses the standard R accessors: \code{\$}, \code{[} and \code{[[}.  Hash
#' construction is flexible and takes several syntaxes and all hash operations
#' are supported.
#' 
#' For shorter key-value pairs, lists might yield higher performance, but for
#' lists of appreciable length hash objects handly outperform native lists.
#' 
#' 
#' @name hash-class
#' @docType class
#' @note
#' 
#' HASH KEYS must be a valid character value and may not be the empty string
#' \code{""}.
#' 
#' HASH VALUES can be any R value, vector or object.
#' 
#' PASS-BY REFERENCE. Environments and hashes are special objects in R because
#' only one copy exists globally. When provide as an argument to a function, no
#' local copy is made and any changes to the hash in the functions are
#' reflected globally.
#' 
#' PERFORMANCE.  Hashes are based on environments and are designed to be
#' exceedingly fast using the environments internal hash table.  For small data
#' structures, a list will out-perform a hash in nearly every case.  For larger
#' data structure, i.e. >100-1000 key value pair the performance of the hash
#' becomes faster.  Much beyond that the performance of the hash far
#' outperforms native lists.
#' 
#' MEMORY. Objects of class \code{hash} do not release memory with a call to
#' \code{rm}.  \code{clear} must be called before \code{rm} to properly release
#' the memory.
#' @section Slots: \describe{ \item{list(".xData")}{ Object of class
#' \code{"environment"}.  This is the hashed environment used for key-value
#' storage. }\item{:}{ Object of class \code{"environment"}.  This is the
#' hashed environment used for key-value storage. } }
#' @author Christopher Brown
#' @seealso \code{\link{hash-accessors}}, \code{\link{environment}}.
#' @references
#' 
#' http://en.wikipedia.org/wiki/Hash_table
#' 
#' http://en.wikipedia.org/wiki/Associative_array
#' @keywords classes
#' @examples
#' 
#'   showClass("hash")
#' 
NULL





#' Hash/associative array/dictionary data structure for the R language.
#' 
#' 
#' This S4 class is designed to provide a hash-like data structure in a native
#' R style and provides the necessary methods for all general methods for hash
#' operations.
#' 
#' \tabular{ll}{ Package: \tab hash\cr Type: \tab Package\cr Version: \tab
#' 2.2.6\cr Date: \tab 2013-02-20\cr License: \tab GPL (>= 2)\cr LazyLoad: \tab
#' yes\cr Depends: \tab R (>= 2.12.0), utils, methods\cr }
#' 
#' @name hash-package
#' @docType package
#' @note
#' 
#' R is slowly moving toward a native implementation of hashes using
#' enviroments, (cf. \code{\link{Extract}}. Access to environments using $ and
#' [[ has been available for some time and recently objects can inherit from
#' environments, etc. But many features that make hashes/dictionaries great are
#' still lacking, such as the slice operation, [.
#' 
#' The hash package is the only full featured hash implementation for the R
#' language. It provides more features and finer control of the hash behavior
#' than the native feature set and has similar and sometimes better
#' performance.
#' 
#' HASH KEYS must be a valid character value and may not be the empty string
#' \code{""}.
#' 
#' HASH VALUES can be any R value, vector or object.
#' 
#' PASS-BY REFERENCE. Environments and hashes are special objects in R because
#' only one copy exists globally. When provide as an argument to a function, no
#' local copy is made and any changes to the hash in the functions are
#' reflected globally.
#' 
#' PERFORMANCE.  Hashes are based on R's native environments and are designed
#' to be exceedingly fast using the environments internal hash table.  For
#' small data structures, a list will out-perform a hash in nearly every case.
#' For larger data structure, i.e. > 500 key value pair the performance of the
#' hash becomes faster.  Much beyond that the performance of the hash far
#' outperforms native lists.
#' 
#' MEMORY. Objects of class \code{hash} do not release memory with a call to
#' \code{rm}.  \code{clear} must be called before \code{rm} to properly release
#' the memory.
#' @author Christopher Brown
#' 
#' Maintainer: Christopher Brown <chris.brown -at- decisionpatterns -dot- com>
#' @seealso See also \code{\link{hash} }, \code{\link{hash-accessors}} and
#' \code{\link{environment} }
#' @references
#' 
#' http://www.mail-archive.com/r-help@r-project.org/msg37637.html
#' 
#' http://www.mail-archive.com/r-help@r-project.org/msg37650.html
#' 
#' http://tolstoy.newcastle.edu.au/R/help/05/12/index.html\#18192
#' @keywords package
#' @examples
#' 
#' 
#'   h <- hash( keys=letters, values=1:26 )
#'   h <- hash( letters, 1:26 )
#' 
#'   h$a # 1
#' 
#'   h$foo <- "bar"
#'   h[ "foo" ] 
#'   h[[ "foo" ]]
#' 
#'   clear(h)
#'   rm(h)
#' 
#' 
NULL





#' Create an inverted hash.
#' 
#' THIS IS AN EXPERIMENTAL FUNCTION. THE IMPLEMENTATION OR INTERFACE MAY CHANGE
#' WITHOUT WARNING.
#' 
#' Invert creates an inverted hash from an existing hash.  An inverted hash is
#' one in which the keys and values are exchanged.
#' 
#' 
#' For \code{invert}, keys and value elements switch.  Each element of the
#' \code{values(x)} is coerced to a key.  The value becomes the associated key.
#' 
#' For \code{inverted.hash}, a hash is created than inverted.  It is defined
#' as:
#' 
#' \code{ function(...) invert(hash(...)) }
#' 
#' @aliases invert inverted.hash invert-methods invert,hash-method
#' @param x A \code{\link{hash}} object
#' @param ...  Arguments passed to the \code{\link{hash}} function.
#' @return A hash object with: keys as the unique elements of \code{values(x)}
#' and values as the associated \code{keys{x}}
#' @author Christopher Brown
#' @seealso See also \code{link{hash}} and \code{\link{make.keys}}
#' @keywords methods data manip
#' @examples
#' 
#'   h <- hash( a=1, b=1:2, c=1:3 )
#'   invert(h)
#' 
#'   inverted.hash( a=1, b=1:2, c=1:3 )
#' 
#' 
NULL





#' Returns the number of items in a hash
#' 
#' Returns the number of items in a hash
#' 
#' Return the number of items in the hash by calling \code{\link{length}} on
#' the internal environment.
#' 
#' @aliases length length-methods length,hash-method
#' @return
#' @returnItem integer Number of items in the hash.
#' @author Christpher Brown
#' @seealso See Also \code{\link{hash}}, \code{\link{length}}
#' @keywords methods
#' @examples
#' 
#' 
#'   h <- hash( letters, 1:26 )
#'   length(h) # 26
#' 
#' 
NULL



