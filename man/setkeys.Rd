\docType{methods}
\name{setkeys}
\alias{setkeys}
\alias{setkeys,hash,ANY,ANY-method}
\alias{setkeys,hash-method}
\title{setkeys - change/rename the keys of a hash}
\usage{
setkeys(x, old, new)

\S4method{setkeys}{hash}(x, old, new)
}
\arguments{
  \item{x}{hash object to rename keys on}

  \item{old}{character (or coerciable to character); old
  keys/names}

  \item{new}{character (or coerciable to character); new
  keys/names

  This methods renames keys in a hash. If there is a
  collision between old and new names, the old names are
  first copied to a temporary slot to ensure

  \code{setkeys} is S4 generic so that other packages might
  also use the generic functions}
}
\value{
Invisiblly returns \code{x} with its keys renamed.
}
\description{
Changes the keys of a hash from \code{old} keys to
\code{new}
}
\note{
setkeys is modeled after \code{setnames} in the data.table
package.
}
\examples{
h <- hash( letters, 1:26 )

   h2 <- copy(h)
   setkeys( h2, keys(h), paste0( keys(h), "1" ) )
   h2

   h3 <- copy(h)
   setkeys( h3, keys(h), rev( keys(h) ) )
   h3
}
\seealso{
\code{\link{keys}} \code{\link{hash}}
}

