# hash 

## hash/dictionary/maps in R

![](https://img.shields.io/cran/v/hash.svg) <!-- Version --> 
![](https://img.shields.io/cran/l/hash.svg) <!-- License --> 
[![lifecycle](https://img.shields.io/badge/lifecycle-stable-brightgreen.svg)](https://www.tidyverse.org/lifecycle/#stable)
[![Downloads](https://cranlogs.r-pkg.org/badges/hash?color=brightgreen)](https://www.r-pkg.org/pkg/hash)
[![](http://cranlogs.r-pkg.org/badges/grand-total/hash)](https://cran.r-project.org/package=hash)
<!-- [![Research software impact](http://depsy.org/api/package/cran/searchable/badge.svg)](http://depsy.org/package/r/searchable) -->

The *hash* package provides a fully-functional hash/dictionaryfor the R language. It provides richer features and finer control of hash behavior than using native R structures like list or environments and has as a user-friendly interface. Performance-wise it has similar and sometimes better performance than these structures especially for larger objects.


## Installation

Latest Release:

    install.packages('hash')


Development Version:

    install.packages('devtools')
    devtools::install_github('decisionpatterns/r-hash')


## Examples 

    # Create a hash 
    h <- hash(a=1, b=2, c=3)
    h <- hash( letters[1:3], 1:3 )
    h <- hash( list(a=1,b=2,c=3) )  
     
    # Keys 
    keys(h)
     
    # Values (named list)
    values(h)
     
    # Assign to single key hash
    h$a <- "foo"
    h[['a']] <- "bar"
     
    # Slice
    h[ c('a','c') ]
    

## Allowable Values  


**KEYS** must be a valid character value and may not be the empty string (""). Keys must be unique.

**VALUES** can be any R value, vector, object, etc. 


## Usage Notes

Hashes probably work about how you would expect, but since there are built from R's native environments. There are three things to Remember:

**PASS-BY REFERENCE**. hashes are environments, special objects in R where only one copy exists globally. When passed as an argument to a function, no local copy is made and any changes to the hash in the functions are reflected globally, i.e. in the caller's namespace.

**PERFORMANCE**.  Hashes are designed to be exceedingly fast using R environment's internal hash table.  The hash function is not without its cost. For small data structures, a named lists and vectors will out-perform a hash in nearly every case. After approximately 500+ elements, the performance of the hash becomes faster than native lists and vectors.  
