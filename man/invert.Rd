\name{invert}
\Rdversion{1.1}
\alias{invert}
\alias{inverted.hash}
\alias{invert-methods}
\alias{invert,hash-method}                
\title{ Create an inverted hash.}
\description{
  THIS IS AN EXPERIMENTAL FUNCTION. THE IMPLEMENTATION OR INTERFACE MAY
  CHANGE WITHOUT WARNING.

  Invert creates an inverted hash from an existing hash.  An inverted hash 
  is one in which the keys and values are exchanged.  
}
\usage{
invert(x)
inverted.hash(...)
}
\arguments{
  \item{x}{ A \code{\link{hash}} object }
  \item{...}{ Arguments passed to the \code{\link{hash}} function. }
}
\details{
  
  For \code{invert}, keys and value elements switch.  Each element of the 
  \code{values(x)} is coerced to a key.  The value becomes the associated key. 

  For \code{inverted.hash}, a hash is created than inverted.  It is defined as:

     \code{ function(...) invert(hash(...)) }

}

\value{
  A hash object with:
  keys as the unique elements of \code{values(x)} and 
  values as the associated \code{keys{x}}
}

\author{
  Christopher Brown
}

\seealso{
See also \code{link{hash}} and \code{\link{make.keys}} 
}

\examples{
  h <- hash( a=1, b=1:2, c=1:3 )
  invert(h)

  inverted.hash( a=1, b=1:2, c=1:3 )

}

\keyword{ methods }
\keyword{ data }
\keyword{ manip }

