library( hash ) 

context('has.key')

  #' Ensure that there are no keys on hash
  h <- hash()
  all( has.key( 'c' , h ) == FALSE )

