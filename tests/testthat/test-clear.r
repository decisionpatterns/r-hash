library(hash)
library( testthat )

context('clear')

h <- hash( letters, 1 )

  expect_is( h, "hash" )
  expect_that( length(h), equals(26) )
  clear(h)

  expect_that( length(h), equals(0) ) 


