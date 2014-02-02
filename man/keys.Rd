\docType{methods}
\name{keys}
\alias{keys}
\alias{keys,hash-method}
\alias{keys-methods}
\alias{keys<-}
\alias{keys<-,hash,ANY-method}
\alias{keys<-,hash,NULL-method}
\alias{keys<--methods}
\alias{names}
\alias{names.hash}
\title{keys - get/set key(s) from a hash}
\usage{
keys(x)

\S4method{keys}{hash}(x)

\method{names}{hash}(x)

keys(x) <- value
}
\arguments{
  \item{x}{A \code{\link{hash}} object.}

  \item{value}{character or object coercable to character}
}
\value{
For \code{keys} and \code{names}, a character vector of key
names For the replacement methods \code{keys<-}, a hash
object with the keys renamed to \code{value}
}
\description{
Returns the key(s) from a hash
}
\details{
Returns the character vector containing the keys of a hash
object.
}
\examples{
h <- hash( letters, 1:26 )
  keys(h)  # letters

  names(h) # same

  #' Rename keys
  # keys( h ) <- rev( keys(h) )
}
\author{
Christopher Brown
}
\seealso{
\code{\link{setkeys}} : rename specific hash keys.
\code{\link{hash}} : hash object
}

