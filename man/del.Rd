\name{del}

\alias{del}
\alias{del-methods}
\alias{del,ANY,hash-method}
\alias{delete}
\alias{delete-methods}
\alias{delete,ANY,hash-method}

\title{ Remove key-value pair(s) from a hash }

\description{
    Removes key-value pair(s) from a hash.  
}

\usage{
  del(x,hash)
  delete(x,hash)
}

\arguments{

  \item{x}{ 
    An object that will be coerced to valid key(s) to be removed from the hash. 
    \code{x} will be coerced to a valid hash keys using 
    \code{\link{make.keys}}
  }

  \item{hash}{ A \code{\link{hash}} object }

}

\value{
  None. This method exists solely for the side-effects of removing items 
  from the hash.
}

\author{ Christopher Brown }

\seealso{ 
  See Also as \code{\link{hash}}, \code{\link{make.keys}}. 
}

\examples{

  h <- hash( letters, 1:26 )
  h # 26 elements
  del( "a", h )
  h # 25 elements

}

\keyword{ methods }
\keyword{ data }
\keyword{ manip }
