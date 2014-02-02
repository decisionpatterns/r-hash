\docType{methods}
\name{Extract}
\alias{#}
\alias{$<-,hash,NULL-method}
\alias{Extract}
\alias{[,hash,ANY,missing,missing-method}
\alias{[,hash,mising-method}
\alias{[,hash,missing,missing,missing-method}
\alias{[,hash-method}
\alias{[<-,hash,ANY-method}
\alias{[[,hash,ANY-method}
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

  \code{[} is a subseting operator.  It returns a hash
  slice, i.e. another hash of of the specified keys. Unlike
  the other accessor methods, \code{[} returns a
  \emph{copy}.

  simplifies them to the lowest order (c.f. simplify).  It
  is very similar to \code{ h[[ keys(h) ]] }, An optional
  key.  It is identical to \code{ h[[ keys(h) ]] }.

  h$x : returns value associated with key \code{x};
  \code{x} is taken as a literal and not interpreted.  h$x
  <- value : sets valie associated witk key \code{x} to
  \code{value}; \code{x} is taken as a literal and not
  interpreted.

  h[[x]] : returns values associated with key(s) \code{x};
  \code{x} is interpreted h[[x]] <- value : sets the values
  with the associated keys.

  h[] : returns a copy of h h[x] : a hash slice

  h[] <- values : error, undefined h[x] <- values : set
  values for x

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

#
}
\examples{
h <- hash( letters, 1:26 )
  values(h)  # 1:26
  values(h, simplify = FALSE )
  values(h, USE.NAMES = FALSE )

  h <- hash( 1:26, letters )
  values(h)
  values(h, keys=1:5 )
  values(h, keys=c(1,1,1:5) )
  values(h, keys=1:5) <- 6:10
  values(h) <- rev( letters )

  h[ "foo" ] <- letters # Assigns letters, a vector to "foo"
  h[ letters ] <- 1:26
  h[ keys ] <- value
  h[ 'a' ] <- NULL
h <- hash()
  h <- hash( letters, 1:26 )

  h$a
  h$a <- "2"
  h$z <- NULL          # Removes 'z' from

  h[['a']]
  h[['a']] <- 23

  h[ letters[1:4] ]    # hash with a,b,c,d
  h[ letters[1:4] ] <- 4:1
}
\author{
Christopher Brown

Christopher Brown
}
\seealso{
\code{\link{hash}} \code{\link{sapply}}
\code{\link[base]{drop}}

\code{\link{hash}}, \code{\link{values}},
\code{\link{set}}, \code{\link{as.list}}
}
\keyword{data}
\keyword{manip}
\keyword{methods}

