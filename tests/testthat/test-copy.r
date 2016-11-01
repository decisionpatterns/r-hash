context( "copy")


test_that( '.. copy', { 

  h <- hash( letters[1:3], 1:3 )
  h_copy <- copy(h)
  
  h %>% expect_is('hash')
  h %>% expect_equal(h_copy)
  
  expect_true( address(h) != address(h_copy))
  
})

test_that( '.. empty hash [#12]', {
  
  h <- hash() 
  h_copy <- copy(h)
  
  h %>% expect_is('hash')
  h %>% expect_equal(h_copy)
  
  expect_true( address(h) != address(h_copy))

})
