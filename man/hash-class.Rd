\name{hash-class}
\docType{class}
\alias{hash-class}

\title{Class "hash" }
\description{ 

  Implements a S4 hash class in R similar to hashes / associatesd arrays / 
  dictionaries in other programming languages.  Where possible, the hash
  class uses the standard R accessors:  \code{\$}, \code{[} and \code{[[}. 
  Hash construction is flexible and takes several syntaxes and all hash 
  operations are supported.

  For shorter key-value pairs, lists might yield higher performance, but for
  lists of appreciable length hash objects handly outperform native lists.
    
}

\section{Slots}{
  \describe{ 
     \item{\code{.xData}:}{ 
       Object of class \code{"environment"}.  This is the hashed environment 
       used for key-value storage. }
  }
}

\section{Extends}{
  environment
}


\section{Methods}{
  \describe{
    HASH ACCESSORS:
    \item{[<-}{\code{signature(x = "hash", i = "ANY", j = "missing")}: Slice Replacement }
    \item{[}{\code{signature(x = "hash", i = "ANY", j = "missing", drop = "missing")}
: Slice }

    \item{[[<-}{\code{signature(x = "hash", i = "ANY", j = "missing")}: 
                Single key replacement with interpolation.  }
    \item{[[}{\code{signature(x = "hash", i = "ANY", j = "missing")}: i
              Single key look-up with interpolation  }

    \item{\$<-}{\code{signature(x = "hash")}: Single key replacement no interpolation }
    \item{\$}{\code{signature(x = "hash")}: Single key lookup no interpolation }

    Manipulation:
    \item{clear}{\code{signature(x = "hash")}: Remove all key-value pairs from hash }
    \item{del}{\code{signature(x = "ANY", hash = "hash")}: Remove specified key-value pairs from hash }
    \item{has.key}{\code{signature(key = "ANY", hash = "hash")}: Test for existence of key }
    \item{is.empty}{\code{signature(x = "hash")}: Test if no key-values are assigned }  

    \item{length}{\code{signature(x = "hash")}: Return number of key-value pairs from the hash }
    \item{keys}{\code{signature(hash = "hash")}: Retrieve keys from hash }
    \item{values}{\code{signature(x = "hash")}: Retrieve values from hash }

    \item{copy}{\code{signature(x = "hash")}: Make a copy of a hash using a new environment. }

    \item{format}{\code{signature(x = "hash")}: Internal function for displaying hash }

  }
}

\references{ 

	http://en.wikipedia.org/wiki/Hash_table

	http://en.wikipedia.org/wiki/Associative_array

}
\author{ Christopher Brown }

\note{ 

  HASH KEYS must be a valid character value and may not be the empty 
  string \code{""}. 

  HASH VALUES can be any R value, vector or object. 

  PASS-BY REFERENCE. Environments and hashes are special objects in R 
  because only one copy exists globally. When provide as an argument to 
  a function, no local copy is made and any changes to the hash in the
  functions are reflected globally.

  PERFORMANCE.  Hashes are based on environments and are 
  designed to be exceedingly fast using the environments internal 
  hash table.  For small data structures, a list will out-perform a hash
  in nearly every case.  For larger data structure, i.e. >100-1000 key
  value pair the performance of the hash becomes faster.  Much beyond that
  the performance of the hash far outperforms native lists.  

  MEMORY. Objects of class \code{hash} do not release memory with a call to 
  \code{rm}.  \code{clear} must be called before \code{rm} to properly
  release the memory.

}

\seealso{
	\code{\link{hash-accessors}}, \code{\link{environment}}. 
}

\examples{
  showClass("hash")
}

\keyword{classes}
