\name{keys}

\alias{keys}
\alias{names}
\alias{names.hash}
\alias{keys-methods}
\alias{keys,hash-method} 

\title{ Returns key(s) from a hash }

\description{
    Returns the key(s) from a hash
}

\usage{
  keys(x)

  \method{names}{hash}(x)
}

\arguments{
  \item{x}{ A \code{\link{hash}} object. }
}

\details{
  Returns the character vector containing the keys of a hash object.
}

\value{
  \item{keys}{A vector of type character}
}

\author{ Christopher Brown }

\seealso{ See Also \code{\link{hash}}. }

\examples{

  h <- hash( letters, 1:26 )
  keys(h)  # letters

  names(h) # same
}   

\keyword{ methods }
\keyword{ data }
\keyword{ manip }
