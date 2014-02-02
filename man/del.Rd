\docType{methods}
\name{del}
\alias{del}
\alias{del,ANY,hash-method}
\alias{del-methods}
\alias{delete}
\alias{delete,ANY,hash-method}
\alias{delete-methods}
\title{del, delete - remove key-value pair(s) from a hash}
\usage{
del(x, hash)

\S4method{del}{ANY,hash}(x, hash)

delete(x, hash)

\S4method{delete}{ANY,hash}(x, hash)
}
\arguments{
  \item{x}{An object that will be coerced to valid key(s)
  to be removed from the hash.  \code{x} will be coerced to
  a valid hash keys using \code{\link{make.keys}}}

  \item{hash}{A \code{\link{hash}} object}
}
\value{
None. This method exists solely for the side-effects of
removing items from the hash.
}
\description{
Removes key-value pair(s) from a hash by name of the
object. To delete all keys, use the \code{\link{clear}}
method.
}
\examples{
h <- hash( letters, 1:26 )
  h # 26 elements
  del( "a", h )
  h # 25 elements
}
\author{
Christopher Brown
}
\seealso{
See Also as \code{\link{hash}}, \code{\link{make.keys}}.
}
\keyword{data}
\keyword{manip}
\keyword{methods}

