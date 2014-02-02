\docType{methods}
\name{values}
\alias{values}
\alias{values,hash-method}
\alias{values<-}
\alias{values<-,hash,ANY-mehtod}
\alias{values<--method}
\title{values}
\usage{
values(x, ...)

\S4method{values}{hash}(x, keys = NULL, ...)

values(x, ...) <- value
}
\arguments{
  \item{x}{hash object}

  \item{keys}{to get or set}

  \item{value}{to be set}

  \item{...}{additional arguments

  The \code{values} method returns the values from a hash.
  It is similar to \code{ h[[ keys(h) ]] } except that a
  named vector or list is returned instead of a hash.  : By
  default, the returned values are simplified by coercing
  to a vector or matrix if possible; elements are named
  after the corresponding key. If the values are of
  different types or of a complex class than a named list
  is returned.  Argument \code{simplify} can be used to
  control this behavior.

  #' If a character vector of \code{keys} is provided, only
  these keys are returned. This also allows for returning
  values mulitple times as in:

  \code{ values(h, keys=c('a','a','b' ) ) }

  This is now the preferred method for returning multiple
  values for the same key.

  The replacement method, \code{values<-} can replace all
  the values or simply those associated with the supplied
  \code{keys}.  Use of the accessor '[' is almost always
  preferred.}
}
\description{
Get/set values for a hash object
}
\seealso{
\code{\link[hash]{Extract}} for R-like accessors
}

