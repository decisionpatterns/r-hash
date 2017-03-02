# library(hash)
# library(testthat)

context('accessors')

h0 <- hash()
h <- hash( letters, 1:26 )

# OBJECT CREATION / TYPE
test_that( "OBJECT CREATION / TYPE", {
  h %>% expect_is("hash")
  h0 %>% expect_is("hash")
})


# EMPTY HASH
test_that( "EMPTY HASH", {
  h0 %>% expect_is('hash')
  length(h0) %>% expect_equal(0) 
})

# POPULATED HASH  
test_that( "POPULATED HASH", {
  h %>% expect_is('hash')
  h %>% length %>% expect_equal(26)
  h %>% keys %>% sort %>% expect_identical(letters)
})               

               
# ALL HASHES
test_that( "ALL HASHES", {
  for( h in list( h0, h) ) {
    h[['missing']] %>% expect_identical(NULL, label = "Attempt to retrieve missing key" )
  }
})
             
# TEST [[   
test_that( "[[", {
  for( h in list( h0, h ) ) {
    expect_error( h[[NULL]] )
    expect_error( h[[NA]] )
    expect_error( h[[]] )
    expect_error( h[[letters]] )
  }

  for( n in 1:26 ) 
    h[[ letters[n] ]] %>% expect_identical(n)  
})

               
# TEST $   
test_that("$", {
  h$a %>% expect_equal(1)
  h$z %>% expect_equal(26)             
})        
               
# TEST [
test_that( "[", {
  for( h in list( h0, h ) ) {
    expect_error( h[[NULL]] )
    expect_error( h[[NA]] )
    expect_error( h[[]] )
    expect_error( h[[letters]] )
  }
  
  h[letters] %>% expect_equal(h)
})
               
# TEST [[ <- 
test_that( "[[<-", {
  h[['a']] <- -1             
  expect_that( h[['a']], equals(-1) )             
})

# TEST $<-             
test_that( "$<-", {
  h$b <- -2
  expect_that( h$b, equals(-2) )
})
