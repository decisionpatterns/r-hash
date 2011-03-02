
library(hash)
h <- hash()
h[ letters ] <- 1:26
h
h$a
h[['a']]
h$a <- 2
h$a
h$a <- NULL
h$a
h
h[['b']]
h[['b']] <- 3
h$b
h[['b']]<- NULL
h$b
h

