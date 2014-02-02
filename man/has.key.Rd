\docType{methods}
\name{has.key}
\alias{has.key}
\alias{has.key,ANY,hash-method}
\title{Test for existence of key(s) on a hash}
\usage{
has.key(key, hash, ...)

\S4method{has.key}{ANY,hash}(key, hash, ...)
}
\arguments{
  \item{key}{A vector whose entries will be coerced to
  valid keys.}

  \item{hash}{A \code{\link{hash}} object.}

  \item{...}{arguments passed to further functions

  \code{has.key} is a wrapper around
  \code{\link[base]{exists}}}
}
\value{
logical A logical vector of length \code{key} indicating
whether the key is defined in the hash.  \code{has.key}
also accepts \code{...} to be passed to underlying
\code{sapply}
}
\description{
\code{has.key} returns a logical vector as long as
\code{keys}, indicating which keys are defined on the hash.
}
\examples{
h <- hash( letters, 1:26 )
    all( has.key( letters, h ) ) # TRUE
}
\author{
Christopher Brown
}
\seealso{
\code{\link[base]{exists}} \code{\link{hash}}
}

