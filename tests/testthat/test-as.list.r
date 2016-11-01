library(hash)
library(testthat)


context('as.list')
test_that( 'as.list', {
  h <- hash( a=1, b=2, c=3 )
  li <- as.list( h )
  expect_is( li, 'list' )
  expect_true( length(li) == 3  )
  expect_equal( names(li), letters[1:3] )
  expect_equivalent( unlist(li), 1:3 )
})
