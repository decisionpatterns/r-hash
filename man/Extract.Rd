\docType{methods}
\name{Extract}
\alias{$<-,hash,NULL-method}
\alias{Extract}
\alias{[,hash,ANY,missing,missing-method}
\alias{[,hash,missing,missing,missing-method}
\alias{[<-,hash,ANY,missing,ANY-method}
\alias{[<-,hash,ANY,missing,NULL-method}
\alias{[[<-,hash,ANY,missing,ANY-method}
\alias{[[<-,hash,ANY,missing,NULL-method}
\title{Extract}
\usage{
\S4method{[}{hash,ANY,missing,missing}(x, i, j, ..., drop)

\S4method{[}{hash,missing,missing,missing}(x, i, j, ..., drop)
}
\arguments{
  \item{x}{\code{\link{hash}} object}

  \item{i}{keys to get or set}

  \item{j}{unused; retained to be compatoble with base
  package}

  \item{drop}{unused; retained to be compatible with base
  package}

  \item{...}{Arguments passed to additional methods
  \code{\link{sapply}}

  \code{$} is a look-up operator for a single key.  The
  base \code{$} method are used directly on the inherited
  environment.  The supplied key is taken as a string
  literal and is not interpreted.  The replaement form,
  \code{$<-} mutates the hash in place.

  \code{[[} is the look-up, extraction operator.  It
  returns the values of a single key. The replacement
  method, \code{[[<-} mutates the hash in place.

  \code{[} is a slice operator.  It returns a subset of key
  value pairs of the hash, i.e. another hash with specifies
  keys-value paris. Unlike the other accessor methods,
  \code{[} returns a \emph{copy}.

  NAMED ACCESS/REPLACEMENT:

  h$x : returns value of key \code{x}; h$x <- value : sets
  key \code{x} to \code{value}; h$x <- NULL : deletes
  key-value pair \code{x}

  INTERPRETED ACCES/REPLACEMENT:

  h[[x]] : returns value of key \code{x}; \code{x} is
  interpreted.  h[[x]] <- value : sets the values of key
  \code{x}; \code{x} is interpreted.  h[[x]] <- NULL :
  deletes key-value pair \code{x}; \code{x} is interpreted.

  HASH SLICING: h[] : returns a copy of h, same as
  \code{copy(h)} h[x] : a hash slice of keys

  h[] <- value : error, undefined key h[x] <- value : set
  values for keys \code{x} to \code{value}(s) h[x] <- NULL
  : delete keys \code{x}

  \code{$} and \code{[[} return the value for the supplied
  argument. If \code{i} is not a key of \code{x},
  \code{NULL} is returned with a warning.

  \code{[} returns a hash slice, a subhash copy \code{x}
  with only the keys \code{i} defined.

  See details above for the complete explanation.}
}
\description{
These are the hash accessor methods. They closely follow
the R style.
}
\examples{
h <- hash( c('a','b','c'), 1:3 )

  # NAMED ACCESS

  h$a  # 1
  h$c  # 3

  # class of values change automatically
  class(h$a)  # integer
  h$a <- 1.1
  class(h$a)  # numeric

  # values can contain more complex objects
  h$a <- 1:6
  h

  h$a <- NULL  # DELETE key 'a', will return null


  # INTERPRETED ACCESS

  h[[ "a" ]] <-"foo"    # Assigns letters, a vector to "foo"
  nm = "a"

  # SLICE ACCESS
  h[ nm ] <- "bar"   # h$a == bar
  h[ nm ] <- NULL


  # Slice
  h[ keys(h) ]
  h[ keys(h) ] <- list( 1:2, 1:3 )
  h
}
\author{
Christopher Brown
}
\seealso{
\code{\link{del}} for removing keys \code{\link{clear}} for
removing all keys

\code{\link{keys}} to get/set/rename keys
\code{\link{values}} to get/set/edit values

\code{\link{set}} to set values internal method

\code{\link{hash}}
}

