library(hash)
library(testthat)

context('constructor methods')

  expect_is( hash(), 'hash' )           # hash constructor
  expect_equal( length( hash() ), 0 )   # length of empty hash

  h <- hash() 
  expect_is( h , 'hash' )
  expect_true( is.hash(h) )
  expect_equal( length(h), 0)
  expect_equal( length(keys(h)), 0)
  expect_equal( length(values(h)), 0)

  # Set hash using objects of equal length 
  h <- hash( a=1, b=2, c=3 )
  expect_is( h , 'hash' )
  expect_true( is.hash(h) )
  expect_equal( length(h), 3)
  expect_equal( length(keys(h)), 3)
  expect_equal( length(values(h)), 3)
  expect_equal( keys(h), letters[1:3] )
  expect_equivalent( values(h), 1:3  )
  expect_equal( names(values(h)), letters[1:3] )
    
  
  h <- hash( letters[1:3], 1:3 )                # unanmed args: two equal length vectors
  expect_is( h , 'hash' )
  expect_true( is.hash(h) )
  expect_equal( length(h), 3)
  expect_equal( length(keys(h)), 3)
  expect_equal( length(values(h)), 3)
  expect_equal( keys(h), letters[1:3] )
  expect_equivalent( values(h), 1:3  )
  expect_equal( names(values(h)), letters[1:3] )


  h <- hash( letters[1:3], 1 )                  # unamed args: all keys with same value
  expect_is( h , 'hash' )
  expect_true( is.hash(h) )
  expect_equal( length(h), 3)
  expect_equal( length(keys(h)), 3)
  expect_equal( length(values(h)), 3)
  expect_equal( keys(h), letters[1:3] )
  expect_equivalent( values(h), rep(1,3)  )
  expect_equal( names(values(h)), letters[1:3] )


  h <- hash( letters[1:3], lapply(1:3, seq, 1 )) # same, complex values
  expect_is( h , 'hash' )
  expect_true( is.hash(h) )
  expect_equal( length(h), 3)
  expect_equal( length(keys(h)), 3)
  expect_equal( length(values(h)), 3)
  expect_equal( keys(h), letters[1:3] )
  expect_is( values(h), 'list' )
  expect_equivalent( unlist(values(h)) , c(1,2,1,3,2,1)  )
  expect_equal( names(values(h)), letters[1:3] )
  
  
  h <- hash( c(a=1, b=2, c=3) )         # named vector of key-value pairs
  expect_is( h , 'hash' )
  expect_true( is.hash(h) )
  expect_equal( length(h), 3)
  expect_equal( length(keys(h)), 3)
  expect_equal( length(values(h)), 3)
  expect_equal( keys(h), letters[1:3] )
  expect_equivalent( values(h), 1:3  )
  expect_equal( names(values(h)), letters[1:3] )


  h <- hash( list(a=1,b=2,c=3) )         # named list of key-value pairs
  expect_is( h , 'hash' )
  expect_true( is.hash(h) )
  expect_equal( length(h), 3)
  expect_equal( length(keys(h)), 3)
  expect_equal( length(values(h)), 3)
  expect_equal( keys(h), letters[1:3] )
  expect_equivalent( values(h), 1:3  )
  expect_equal( names(values(h)), letters[1:3] )


context('as.list')
  h <- hash( a=1, b=2, c=3 )
  li <- as.list( h )
  expect_is( li, 'list' )
  expect_true( length(li) == 3  )
  expect_equal( names(li), letters[1:3] )
  expect_equivalent( unlist(li), 1:3 )
