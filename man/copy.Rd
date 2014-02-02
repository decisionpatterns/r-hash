\docType{methods}
\name{copy}
\alias{copy}
\alias{copy,hash-method}
\title{copy}
\usage{
copy(x, ...)

\S4method{copy}{hash}(x, ...)
}
\arguments{
  \item{x}{hash}

  \item{...}{additional arguments

  Creatinga copy using the assingment operator, \code{<-},
  does not work as expected, since hashes are based on
  environments and environments are reference objects in R.
  The assignment operator consequently creates a linked
  copy the original hash and not an independent copy.  The
  \code{copy} method provides an identical unlinked copy of
  the hash.}
}
\value{
hash, copy of hash \code{x}
}
\description{
Create a copy of a hash.
}
\examples{
h <- hash( a=1, b=2 )
  h.new <- copy( h )
}
\author{
Christopher Brown
}
\seealso{
\code{\link[base]{environment}}
}

