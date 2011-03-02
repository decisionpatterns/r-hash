\name{values}

\alias{values}
\alias{values-methods}
\alias{values,hash-method}

\alias{values<-}
\alias{values<--methods}
\alias{values<-,hash-method}
\alias{values<-,hash,ANY-method}


\title{ Extract values of a hash object. }

\description{

    Extract \code{values} from a \code{hash} object.  This is a pseudo-
    accessor method that returns hash values (without keys) as a 
    vector if possible, a list otherwise.

    simplifies them to the lowest order (c.f. simplify).  It is
    very similar to \code{ h[[ keys(h) ]] },  An optional
    key.  It is identical to \code{ h[[ keys(h) ]] }.

    For details about hash accessors, please see \code{\link{hash-class}}

}

\usage{
  \S4method{values}{hash}(x, keys=NULL, ...)
  \S4method{values}{hash}(keys=NULL) <- value
}

\arguments{
  \item{x}{ The \code{\link{hash}} from where the values retrieved }
  \item{keys}{ A vector of keys to be returned. }
  \item{...}{ Arguments passed to \code{\link{sapply}} }
  \item{value}{ For the replacement method, the value(s) to be set. }
}

\details{

  The \code{values} method returns the values from a hash. It is 
  similar to \code{ h[[ keys(h) ]] } except that a named vector or list 
  is returned instead of a hash. 
                                              :
  By default, the returned values are simplified by coercing to
  a vector or matrix if possible; elements are named after the 
  corresponding key. If the values are of different types or of a 
  complex class than a named list is returned.  Argument 
  \code{simplify} can be used to control this behavior.

  If a character vector of \code{keys} is provided, only these keys
  are returned. This also allows for returning values mulitple times
  as in:

    \code{ values(h, keys=c('a','a','b' ) ) }

  This is now the preferred method for returning multiple values for 
  the same key.

  The replacement method, \code{values<-} can replace all the values or
  simply those associated with the supplied \code{keys}.  Use of the 
  accessor '[' is almost always preferred.

}

\value{
  Please see details for which value will be returned:

  \item{vector}{Vector with the type as the values of the hash}
  \item{list}{list containing the values of the hash}
  
}

\references{ 
  http://blog.opendatagroup.com/2009/10/21/r-accessors-explained/
}

\author{ Christopher Brown }

\seealso{ See also \code{\link{hash}}, \code{\link{sapply}}. }

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

}        

\keyword{ methods }
\keyword{ data }
\keyword{ manip }
