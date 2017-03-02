library(hash)
library(testthat)

context('constructor methods')

context('.. empty hash')
test_that( 'empty hash', {
  hash() %>% expect_is('hash')           # hash constructor
  hash() %>% length %>% expect_equal(0)
  
  h <- hash() 
  h %>% expect_is('hash')
  h %>% is.hash %>% expect_true()
  h %>% length %>% expect_equal(0)
  h %>% keys %>% length %>% expect_equal(0)
  h %>% values %>% length %>% expect_equal(0)
})

context('.. from environment') 
test_that( 'from environment', {
  h <- hash( new.env() )               # from environment 
  h %>% expect_is('hash')
  h %>% is.hash %>% expect_true()
  h %>% length %>% expect_equal(0)
  h %>% keys %>% length %>% expect_equal(0)
  h %>% values %>% length %>% expect_equal(0)
})

context('.. from list') 
test_that( 'from list', {
  h <- hash( list() )               # from environment 
  h %>% expect_is('hash')
  h %>% is.hash %>% expect_true()
  h %>% length %>% expect_equal(0)
  h %>% keys %>% length %>% expect_equal(0)
  h %>% values %>% length %>% expect_equal(0)
})


context('.. from key-value pairs')
test_that( 'from key-value pairs', {
  h <- hash( a=1, b=2, c=3 )           # Set hash from key-value pairs
  h %>% expect_is('hash')
  h %>% is.hash %>% expect_true()
  h %>% length %>% expect_equal(3)
  h %>% keys %>% length %>% expect_equal(3)
  h %>% values %>% length %>% expect_equal(3)
  h %>% values %>% expect_equivalent(1:3)
  h %>% keys %>% expect_equal( letters[1:3] )
  h %>% names %>% expect_equal( letters[1:3] )
})

context('.. from unnamed args, equal-length vectors')
test_that( 'from unnamed args, equal-length vectors', {
  h <- hash( letters[1:3], 1:3 )                # unanmed args: two equal length vectors
  h %>% expect_is('hash')
  h %>% is.hash %>% expect_true()
  h %>% length %>% expect_equal(3)
  h %>% keys %>% length %>% expect_equal(3)
  h %>% values %>% length %>% expect_equal(3)
  h %>% values %>% expect_equivalent(1:3)
  h %>% names %>% expect_equal( letters[1:3] )
})

context('.. from unamed, all values the same')
test_that( 'from unamed, all values the same', {
  h <- hash( letters[1:3], 1 )                  # unamed args: all values thes same value
  h %>% expect_is('hash')
  h %>% is.hash %>% expect_true()
  h %>% length %>% expect_equal(3)
  h %>% keys %>% length %>% expect_equal(3)
  h %>% values %>% length %>% expect_equal(3)
  h %>% values %>% expect_equivalent( rep(1,3) )
  h %>% names %>% expect_equal( letters[1:3] )
})

context('.. character & list')
test_that( 'character & list', {
  h <- hash( letters[1:3], lapply(1:3, seq, 1 )) # same, complex values
  h %>% expect_is('hash')
  h %>% is.hash %>% expect_true()
  h %>% length %>% expect_equal(3)
  h %>% keys %>% length %>% expect_equal(3)
  h %>% values %>% length %>% expect_equal(3)
  
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
  expect_equal( keys(h, sorted=TRUE), letters[1:3] )
  expect_equivalent( values(h) %>% unlist %>% sort, 1:3  )
  expect_equal( names(values(h)) %>% unlist %>% sort, letters[1:3] )
})

