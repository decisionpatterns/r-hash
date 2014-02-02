\docType{package}
\name{hash-package}
\alias{hash-package}
\title{hash package}
\description{
Hash/associative array/dictionary data structure for the R
language.
}
\details{
This S4 class is designed to provide a hash-like data
structure in a native R style and provides the general
methods for hash/dictionary operations.
}
\note{
The hash package is the only full featured hash
implementation for the R language. It provides more
features and finer control of the hash behavior than the
native features. It hss similar and some cases better
performance, e.g. compared to lists with a large number of
elements.
}
\examples{
h <- hash( keys=letters, values=1:26 )
  h <- hash( letters, 1:26 )

  h$a # 1

  h$foo <- "bar"
  h[ "foo" ]
  h[[ "foo" ]]

  clear(h)
  rm(h)
}
\author{
Christopher Brown

Maintainer: Christopher Brown <chris.brown -at-
decisionpatterns -dot- com>
}
\references{
Some discussion can be found here:
}
\seealso{
\code{\link{hash} }, \code{\link{Extract}} and
\code{\link{environment} }
}

