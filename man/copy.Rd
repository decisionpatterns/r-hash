\name{copy-methods}
\docType{methods}

\alias{copy}
\alias{copy-methods}
\alias{copy,hash-method}

\title{ Create a seperate copy of a hash object. } 

\description{
  The copy hash method creates a independent copy of a hash object.  Creating
  a copy using the assingment operator, \code{<-}, does not work as expected,
  since hashes are based on environments and environments are reference objects
  in R.  The assignment operator consequently creates a linked copy to the 
  original hash and not an independent copy.  The \code{copy} method provides
  an identical unlinked copy of the hash.

}
\section{Methods}{
\describe{

   \item{\code{signature(x = "hash")}}{
     Creates and returns an identical, independent, unreferenced copy of the
     the hash.
   }
}}

\value{ A hash object. }

\author{ Christopher Brown }

\seealso{ \code{\link{environment}} }


\keyword{methods}
