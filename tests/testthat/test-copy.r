context( "copy")

context( '.. basic' )
test_that( 'copy', { 

  h <- hash( letters[1:3], 1:3 )
  h_copy <- copy(h)
  
  h_copy %>% expect_is('hash')
  h_copy %>% expect_equal(h)
  
  if( require(pryr) ) 
    expect_true( pryr::address(h) != pryr::address(h_copy))
  
})

context( '.. empty hash [#12]')
test_that( 'empty hash [#12]', {
  
  h <- hash() 
  h_copy <- copy(h)
  
  h_copy %>% expect_is('hash')
  h_copy %>% length %>% expect_equal(0)
  h_copy %>% expect_equal(h)
  
  if( require(pryr) )
    expect_true( pryr::address(h) != pryr::address(h_copy))

})

context( '.. single key-value pair [#14]')
test_that( 'single key-value pair [#14]', {
  
  h <- hash( a=1 ) 
  h_copy <- copy(h)
  
  h_copy %>% expect_is('hash')
  h_copy %>% length %>% expect_equal(1)
  expect_equivalent(h_copy, h)
  
  if( require(pryr) )
    expect_true( pryr::address(h) != pryr::address(h_copy))

})