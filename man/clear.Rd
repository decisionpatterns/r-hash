\docType{methods}
\name{clear}
\alias{clear}
\alias{clear,hash-method}
\alias{clear-methods}
\title{Removes all key-value pairs from a hash}
\usage{
clear(x)

\S4method{clear}{hash}(x)
}
\arguments{
  \item{x}{A \code{hash} object.}
}
\value{
None. Method clear exists entirely for its side effects.
}
\description{
\code{clear} removes all key-values from a hash.
}
\details{
Currently \code{clear} removes (\code{rm}) the key-value
pairs on the hash. For large hashes it might be faster to
reinitialize the hash, though this might cause memory
leaks.
}
\note{
\code{clear} should be called prior to removing a hash.
This ensures that the memory from the environment is freed.
}
\examples{
h <- hash( letters, 1:26 )
  h # An object of type 'hash' containing 26 key-value pairs.
  clear(h)
  h # An object of type 'hash' containing 0 key-value pairs.
}
\author{
Christopher Brown
}
\seealso{
\code{\link{del}} to remove specific key-values from the
hash.  \code{\link{hash}}.
}

