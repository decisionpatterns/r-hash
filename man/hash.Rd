\name{hash}

\alias{hash}
\alias{is.hash}
\alias{as.list.hash}

\title{ hash/associative array/dictionary data structure for the R language }

\description{

  Preferred constructor for the \code{\link{hash-class}}.
  
}

\usage{
  hash(...)

  is.hash(x)

  as.list.hash(x, all.names = FALSE, ... )

}

\arguments{

  \item{x}{ A hash object. }

  \item{all.names}{ 
    a logical indicating whether to copy all values or (default)
    only those whose names do not begin with a dot
  }

  \item{...}{ Additional arguments passed to the function  }
}

\details{

  \code{hash} returns a hash object.  Key-value pairs may be specified
  via the \code{...} argument as explicity arguments \code{keys} and
  \code{values}, as named key-value pairs, as a named vector or as implicit
  key, value vectors.  See examples below for each type.  
  
  Keys must be a valid R name, must be a character vector and must not be 
  the empty string, \code{""}. Values are restricted to any valid R objects.

  See \code{\link{.set}} for further details and how key-value vectors of 
  unequal length are interpretted.

  Hashes may be accessed via the standard R accessors \code{[}, \code{[[} 
  and \code{\$}.  See \code{\link{hash-accessors}} for details.
 
  \code{is.hash} returns a boolean value indicating if the argument is
  a hash object.

  \code{as.list.hash} coerces the hash to a list.

}

\value{
  For \code{hash}, an object of class hash.   
}

\author{ Christopher Brown }
\seealso{ \code{\link{.set}}, \code{\link{hash-accessors}} }

\examples{

  hash()

  hash( key=letters, values=1:26 )
  
  hash( 1:3, lapply(1:3, seq, 1 ))
  
  hash( a=1, b=2, c=3 )
  hash( c(a=1, b=2, c=3) ) 
  hash( list(a=1,b=2,c=3) )

  hash( c("foo","bar","baz"), 1:3 )
  hash( c("foo","bar","baz"),  lapply(1:3, seq, 1 ) )
  hash( letters, 1:26 )

  h <- hash( letters, 1:26 )
  h$a
  h$b
  h[[ "a" ]]
  h[ letters[1:3] ]

  h$a<-100
  # h[['a']]<-letters

  is.hash(h)
  as.list(h)

  clear(h)
  rm(h)

}

\keyword{ data }
\keyword{ manip }
