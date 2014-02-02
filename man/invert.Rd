\docType{methods}
\name{invert}
\alias{invert}
\alias{invert,hash-method}
\alias{inverted.hash}
\title{Create/invert a hash.}
\usage{
invert(x)

\S4method{invert}{hash}(x)

inverted.hash(...)
}
\arguments{
  \item{x}{A \code{\link{hash}} object}

  \item{...}{Arguments passed to the \code{\link{hash}}
  function.}
}
\value{
A hash object with: keys as the unique elements of
\code{values(x)} and values as the associated
\code{keys{x}}
}
\description{
THIS IS AN EXPERIMENTAL FUNCTION. THE IMPLEMENTATION OR
INTERFACE MAY CHANGE IN THE FUTURE.
}
\details{
\code{invert} exchanges the keys and values of a hash.

\code{inverted.hash} is a constructor method that directly
makes an inverted hash.

Each element of the \code{values(x)} becomes a key in a new
hash; the associatedis coerced to a key value is the The
value becomes the associated key.

For \code{inverted.hash}, a hash is created thnn inverted.
It is defined as:

\code{ function(...) invert(hash(...)) }
}
\examples{
h <- hash( a=1, b=1:2, c=1:3 )
  invert(h)

  inverted.hash( a=1, b=1:2, c=1:3 )
}
\author{
Christopher Brown
}
\seealso{
See also \code{link{hash}} and \code{\link{make.keys}}
}

