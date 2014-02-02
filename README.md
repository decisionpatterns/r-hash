
The *hash* package provides a fully-functional hash / dictionary functionality
for the R language (http://decisionpatters.com).


ALLOWABLE VALUES
----------------------------------------

  HASH KEYS must be a valid character value and may not be the empty 
  string \code{""}. 

  HASH VALUES can be any R value, vector or object. 

NOTES
----------------------------------------
  The hash package is the only full featured hash 
  implementation for the R language. It provides more features and 
  finer control of the hash behavior than the native feature set and 
  has similar and sometimes better performance.

  PASS-BY REFERENCE. Environments and hashes are special objects in R 
  because only one copy exists globally. When provide as an argument to 
  a function, no local copy is made and any changes to the hash in the
  functions are reflected globally.

  PERFORMANCE.  Hashes are based on R's native environments and are 
  designed to be exceedingly fast using the environments internal 
  hash table.  For small data structures, a list will out-perform a hash
  in nearly every case.  For larger data structure, i.e. > 500 key
  value pair the performance of the hash becomes faster.  Much beyond that
  the performance of the hash far outperforms native lists.  

  MEMORY. Objects of class hash do not release memory with a call to 
  *rm*.  *clear* must be called before *rm* to properly
  release the memory.  


