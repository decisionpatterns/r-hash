hash 
====

[![CRAN](http://www.r-pkg.org/badges/version/hash)](https://cran.rstudio.com/web/packages/hash/index.html) 
[![License](http://img.shields.io/badge/license-GPL%20%28%3E=%202%29-brightgreen.svg?style=flat)](http://www.gnu.org/licenses/gpl-2.0.html) 
[![Downloads](http://cranlogs.r-pkg.org/badges/hash?color=brightgreen)](http://www.r-pkg.org/pkg/hash)
 

The *hash* package provides the only fully-functional hash/dictionaryfor the R language. It provides richer features and 
finer control of hash behavior than using native R structures like list or environments and has as a user-friendly interface. Performance-wise it has similar and sometimes better performance. 


Installation
----

Latest Release:

    install.packages('hash')


Development Version:

    install.packages('devtools')
    devtools::install_github('decisionpatterns/hash')



Allowable Values  
----

**KEYS** must be a valid character value and may not be the empty string \code{""}. Keys must be unique.

**VALUES** can be any R value, vector, object, etc. 


Usage Notes
----

Hashes probably work about how you would expect, but since there are built from R's native environments. There are three things to Remember:

**PASS-BY REFERENCE**. hashes are environments, special objects in R where only one copy exists globally. When passed as an argument to a function, no local copy is made and any changes to the hash in the functions are reflected globally, i.e. in the caller's namespace.

**PERFORMANCE**.  Hashes are designed to be exceedingly fast using R environment's internal hash table.  The hash function is not without its cost. For small data structures, a named lists and vectors will out-perform a hash in nearly every case. After approximately 500+ elements, the performance of the hash becomes faster than native lists.  

**MEMORY**. Objects of class hash do not release memory with a call to *rm*.  *clear* must be called before *rm* to properly
release the memory. (This may change in the future) 
