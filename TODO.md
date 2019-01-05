TODO:

  - [] fix argument order has.key(x, hash) to has_key(hash,x)

  - [] Fix behavior on values to reduce and retain class
  - implement drop argument? Is there a use case when drop would reduce the
    object to something other than a hash?

  - implement mget in slice operation

  - Create a mapping from Python's dictionary to hash package
    c.f. http://docs.python.org/2/library/stdtypes.html#dictionary-view-objects

  - automatic coercion for hash[ x , ... ] where x is a 'name'
 
  - Is there a happly function that is like lapply that either passes keys and 
    values to the functions happly( h, function(k,v,...) ), will it return a 
    hash object?


  - [x] Increase perfomance of `[` and `hash` methods

  - [x] Be able to create a loop that assigns both key and value, e.g.:
    for( k,v in ha ) ...
    - use itertools to iterate over keys and values


## Defaults

  - (LOW PRIORITY) default MISSING behavior should be customizable at the hash
    instance level.
      Requires a slot: @na.action  that can be a function or value. This default
      should exist between the global default and the call level.
    This is low priority since missing customization only applies to hash slices
    now.

  x Default of missing key should be NULL. 
    - option to fail on missing key?
    - customizable missing 

  - Should the default value of non-existant keys be NA or NULL.
    - The default of the environemnet is NULL
    - NA is the norm when data is missing, i.e. from  a frame.
    - N.B. When access these objects the missing values are returned:
      - vectors : NA
      - list    : NULL
      - data.frames : NULL
    - since getOption( 'na.action.hash' ) returns NULL if undefined, we can 
      use this as  getOption( 'na.action.hash' )  as the na.action only . . .
      but this sets the value of the Hash to NULL.  Setting the value to NULL
      is equal to deleting the key.  h$key <- NULL deletes the key.  

  - [x] Handle any type for a key, especially integers.
  
  - [?] Keep track of the type of the key: `hash@key.class`
    Asking for `keys(h)` would return the original type via coercion.

  - [x] Method to coerce value to key
      even through the make.key or make.name functions.
      ? Do we allow mixing of types ? :: NO
      

  - [?] IxHash : Indexed Hash.  Allow access by integer position?
      There becomes a problem of keeping track of replacements.

  - [ ] Keys can have muliple values / be recursive?
     how would this be implemented as an md5hash of the args?
     h[[ vector ]] <- values ?  
     h[[ paste( as.character( vector ) ) ]] <- value
     How can we make each of the keys searchable?  i.e. get all where the second
     key field = 7.  Each of the key fields would have to be hashed?  
                           
  - Coersion functions 
    - as.vector, 
    - pairlist, 
    - [x] as.data.frame, 
    - [x] as.environment, 
    - [x] as.list
    
  - other coercions : 
       as.environment,  not possible without clobbering base h@env anyhow 
       as.vector ,      yes
      
  - Implement clear as initializing of hash rather than rm
   
  - R/clear.R bug? :: SHOULD THIS COPY THE HASH?
     h <- hash( letters, 1:26 )
     hh <- h
     clear(hh)
     h   # EMPTY. 

     Does not work the same with 'rm'. Will this require overloading the 
     assignment operators?

  - test functions    
       x is.hash : object is a hash
       is.vector : test values to see if they are expressible as a vector
       is.list   : "

  - assign <==> set : it is to bad that assign is used instead of get 
    get/set seems better aligned than get/assign.

  
