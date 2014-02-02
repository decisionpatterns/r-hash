\name{is.empty}
\alias{is.empty}
\title{Test if a hash has no key-value pairs.}
\usage{
is.empty(x)
}
\arguments{
  \item{x}{hash object.

  Returns \code{TRUE} if no key-value pairs are defined for
  the hash, \code{FALSE} otherwise.}
}
\value{
logical.
}
\description{
\code{is.empty} tests to see if any key value pairs are
assigned on a \code{hash} object.
}
\examples{
h <- hash( a=1, b=2, c=3 )

    is.empty(h)    # FALSE
    clear(h)
    is.empty(h)    # TRUE
    h <- hash()
    is.empty(h)    # TRUE
}
\author{
Christopher Brown
}
\seealso{
\code{\link{hash}} \code{\link{exists}}
\code{\link{length}}
}

