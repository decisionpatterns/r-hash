library(hash)
library(testthat)

# TEST FILE FOR hash METHODS set

context( '.set')

h <- hash()

test_that( ".set", {
  
  # SET: key-value pairs
  .set( h, "a", 1:2 ) 
  expect_equal( h[["a"]], 1:2 )
  
  .set( h, letters, 1:26  )
  expect_equal( h[["a"]], 1 )
  
  .set( h, 1:5, 1:5 ) 
  expect_equal( h[["1"]], 1  )
  
  .set( h, letters, 12  )
  expect_equal( h[["a"]], 12  )
  
  # SET: key-hash pair added in version 1.0.4
  .set( h, "ha", hash( a=1, b=2 ) )
  class( h[["ha"]] ) == "hash"
  
  
  
  # SET: data.frame
  .set( h, "df", data.frame( a=1:10, b=11:20) )
  class( h[["df"]] ) == "data.frame" 
  
  # SET: list
  .set( h, "li", list( a=1, b=1:5, c=letters[1:3] ) )
  class( h[["li"]] ) == "list" 
  
  # SET: environment
})
