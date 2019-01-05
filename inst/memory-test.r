# memory-test.r
#
# Cf. Issue#16
# Conclusion: Cannot confirm existence of memory leak.

library(hash)
library(pryr)

size=1e4

gc(full=TRUE)
used_0 <- mem_used()  # Baseline

for( i in 1:20 ) { 
  
  # Define Hash
  # Numeric Key => sample from normal dist.
  h <- hash( keys=sample(size), values=rnorm(size))

  # Delete Hash
  rm(h)
  gc()
  
}

gc(full=TRUE)

# Compare 
used_1 <- mem_used()

used_0; used_1;

( used_2 - used_0 ) <= 0
