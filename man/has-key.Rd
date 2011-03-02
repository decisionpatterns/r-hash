\name{has.key}

\alias{has.key}
\alias{has.key-methods}
\alias{has.key,ANY,hash-method}

\title{  Test for existence of key(s) on a hash }

\description{
    \code{has.key} returns a logical vector as long as \code{keys}, indicating
    which keys are defined on the hash.  
}

\usage{
  has.key(key, hash, ...)
}

\arguments{
  \item{key}{ A vector whose entries will be coerced to valid keys. }
  \item{hash}{ A \code{\link{hash}} object. }
  \item{...}{ arguments passed to further functions }
}

\details{
  None.
}

\value{
  \item{logical}{
    A logical vector of length \code{key} indicating whether the key is 
    defined in the hash.  \code{has.key} also accepts \code{...} 
    to be passed to underlying \code{sapply}
  }
}

\author{ Christopher Brown }

\seealso{ See also \code{\link{hash}}  }

\examples{                            

    h <- hash( letters, 1:26 )
    all( has.key( letters, h ) ) # TRUE
}

\keyword{ methods }
\keyword{ data }
\keyword{ manip }
