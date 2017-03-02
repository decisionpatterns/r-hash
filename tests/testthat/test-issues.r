
context("Isues")
test_that( '#6', { 

  context('  #6')
    tm <- Sys.time()
    h <- hash()
    h$tm <- tm 
  
    expect_equal( class(h$tm), class(tm) ) 
    expect_equal( h$tm, tm )
    
})
