library(hash)
library(testthat)

context('clear')

test_that( "clear", {
  h <- hash( letters, 1 )

  h %>% expect_is("hash")
  h %>% length %>% expect_equal(26) 

  clear(h)
  h %>% length %>% expect_equal(0)

  rm(h)
  exists('h') %>% expect_false()
})