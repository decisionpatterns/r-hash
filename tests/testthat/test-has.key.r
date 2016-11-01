library(hash)
library(testthat)

context('has.key')

test_that("has.key", {
  #' Ensure that there are no keys on emptyhash
  h <- hash()
  'c' %>% has.key(h) %>% expect_false()
  
})
