\docType{methods}
\name{del}
\alias{del}
\alias{del,ANY,hash-method}
\alias{del,character,hash-method}
\alias{del-methods}
\alias{delete}
\alias{delete,ANY,hash-method}
\alias{delete-methods}
\title{del, delete - remove key-value pair(s) from a hash}
\usage{
del(x, hash)

\S4method{del}{ANY,hash}(x, hash)

\S4method{del}{character,hash}(x, hash)

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
object. There are also R-like methods described in
\code{link{Extract}}. To delete all keys, use the
\code{\link{clear}} method.
}
\examples{
h <- hash( letters, 1:26 )

  # USING del
  del( "a", h )             # delete key  a
  del( c("b","c"), h )      # delete keys b, c

  # USING rm
  rm( "d", envir=h )              # delete key  d
  rm( list= c("e","f"), envir=h ) # delete keys e,f

  # USING R syntsx
  h$g <- NULL               # delete key  g
  h[['h']] <- NULL          # delete key  h
  h['i'] <- NULL            # delete key  i
  h[ c('j','k')] <- NULL    # delete keys e,f

  keys(h)
  D
}
\author{
Christopher Brown
}
\seealso{
\code{\link[base]{rm}} base function used by \code{del}
\code{\link{Extract}} for R-like accessor
\code{\link{clear}} to remove all key-values and return an
empty hash \code{\link{hash}}
}
\keyword{data}
\keyword{manip}
\keyword{methods}

