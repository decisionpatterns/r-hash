\docType{class}
\name{hash-class}
\alias{hash-class}
\title{Class "hash"}
\description{
Implements a S4 hash class in R similar to hashes /
associatesd arrays / dictionaries in other programming
languages.  Where possible, the hash class uses the
standard R accessors: \code{\$}, \code{[} and \code{[[} as
well as other common hash methods.  Hash construction is
flexible and takes several syntaxes and all hash operations
are supported.
}
\details{
For shorter key-value pairs, lists yield higher performance
but hashes outperform list once the have an appreciable
length (>100 elements). Hash objects have defined methods
that (should) make them flexible, intuitive and easy to use
especially from those coming form other languages.

This class provides a hash/dictionary that provides the
accessors and other methods common to other programming
languages. The \code{haah} class inherits from environment
and has no defined slots. It is essentially a wrapper
arounf \code{\link[base]{environment}} and is very similar
to reference classes in that most of the semantic are
pass-by-reference rather than pass-by-value. For this
reason, some of the behaviour is not as expected.
}
\section{Slots}{

\describe{
\item{\code{.xData}}{an \code{\link[base]{environment}}}
}}
\examples{
h <- new( "hash" )   # new empty hash
  h <- hash()          # same
  class(h)             # "hash"
  is.hash(h)           # TRUE

  h[ letters ] <- 1:26 # populate the hash

  as.list( h )         # convert to a list

  showClass("hash")
}
\author{
Christopher Brown
}
\seealso{
\link{Extract} \code{\link{is.hash}}
\code{\link{as.list.hash}}
}

