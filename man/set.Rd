\name{.set}

\alias{.set}

\title{assign key-value pair(s) to a hash }

\description{

 \code{.set} is an internal method for assigning key-value pairs to a 
 \code{\link{hash}}.  Normally, there is no need to use this function.  
 Convenient access is provided by: \code{ hash, \$, [ and [[ } and their 
 corresponding replacement methods.
 
 \code{.set} takes 4 types of arguments:
   explicitly named key and value vectors
   named key-value pairs
   named vectors
   implicit key-value pairs

 The keys are automatically coerced to valid keys and are restricted to
 character classes.  Values are free to be any valid R object.

}

\usage{
  .set( hash, ... )
}

\arguments{
  \item{hash}{ 
    An hash object on which to set the key-value pair(s)
  }

  \item{...}{ 
  	Any of several ways to specify keys and values.  See Details.
  }

}

\details{

  \code{.set} sets zero or more key-value pairs.  If the key(s) already 
  exist, existing values are silently clobbered.  Otherwise, a new 
  value is saved for each key.  Keys and values are by the \code{...}
  argument. If \code{...} is:

      made only of  explicitly named \code{keys} and \code{values} 
	  arguments then these are taken as the keys and values respectively.

	  a named list, then the names are taken as keys and 
	  list elements are taken as values.

	  a named vector, then the names are taken as keys.  Vector elements
	  are taken as values.

	  of length two, keys are taken from the first element, values from
	  the second.


	Keys are coerced to type \code{character}.


	Keys and values are assigned to the hash as follows: 

       IF \code{keys} and \code{values} are the same length, key-value 
	   pairs are added to the hash pairwise.  

       IF \code{keys} is a vector of length 1, then this key is assigned  
       the entire \code{values} vector.

       IF \code{values} is a vector of length 1, each key of \code{keys}  
       is assigned the value given by \code{values} 

       IF \code{keys} and \code{values} are of different lengths, both 
	   greater than one, then the assignment is considered ambiguous and 
	   an error is thrown.
}

\value{
  \code{.set} exists solely for its side-effects.  An invisible NULL is 
  returned.
}

\author{ Christopher Brown }

\seealso{ See also \code{\link{hash}}, \code{\link{environment}} }

\examples{

  h <- hash()

  .set( h, keys=letters, values=1:26 )
  .set( h, a="foo", b="bar", c="baz" )
  .set( h, c( aa="foo", ab="bar", ac="baz" ) )
  clear(h)
  .set( h, letters, values )

}

\keyword{ methods }
\keyword{ data }
\keyword{ manip }

