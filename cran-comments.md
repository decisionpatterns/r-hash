## Check results

* Package CITAN requires external library  libgtk-2.8+
* Package KoNLP requires rJava requiring external library
* Package MXM uses internal/non-exported function .set 
  Maintainer contacted
* Package orderbook does not instal

=========================================================================
Reverse dependency check for hash 3.0.2
=========================================================================
 setting  value                       
 version  R version 3.1.0 (2014-04-10)
 system   x86_64, linux-gnu           
 ui       RStudio (0.98.1060)         
 language en                          
 collate  en_US.UTF-8                 
 tz       <NA>                        

 package    * version    date       source                          
 chron        2.3.45     2014-02-11 CRAN (R 3.1.0)                  
 data.table * 1.9.4      2014-10-02 CRAN (R 3.1.0)                  
 devtools   * 1.6.0.9000 2014-10-30 Github (hadley/devtools@5f0e3ed)
 digest       0.6.4      2013-12-03 CRAN (R 3.1.0)                  
 hash       * 3.0.2      <NA>       local                           
 magrittr   * 1.0.1      2014-05-15 CRAN (R 3.1.0)                  
 memoise      0.2.1      2014-04-22 CRAN (R 3.1.0)                  
 plyr         1.8.1      2014-02-26 CRAN (R 3.1.0)                  
 Rcpp         0.11.1     2014-03-14 CRAN (R 3.1.0)                  
 RCurl        1.95.4.1   2013-03-06 CRAN (R 3.1.0)                  
 reshape2     1.4        2014-04-23 CRAN (R 3.1.0)                  
 roxygen2     4.0.2      2014-09-02 CRAN (R 3.1.0)                  
 rstudioapi   0.1        2014-03-27 CRAN (R 3.1.0)                  
 stringr      0.6.2      2012-12-06 CRAN (R 3.1.0)                  

CITAN =================================================================== 
 *  checking package dependencies ... ERROR
Package required but not available: ‘RGtk2’

See the information on DESCRIPTION files in the chapter ‘Creating R
packages’ of the ‘Writing R Extensions’ manual. 


GABi ==================================================================== 
 


HAP.ROR ================================================================= 
 


KoNLP =================================================================== 
 *  checking package dependencies ... ERROR
Package required but not available: ‘rJava’

See the information on DESCRIPTION files in the chapter ‘Creating R
packages’ of the ‘Writing R Extensions’ manual. 


MXM ===================================================================== 
 *  checking examples ... ERROR
Running examples in ‘MXM-Ex.R’ failed
The error most likely occurred in:

> base::assign(".ptime", proc.time(), pos = "CheckExEnv")
> ### Name: SES
> ### Title: Feature selection algorithm for identifying multiple minimal,
> ###   statistically-equivalent and equally-predictive feature signatures.
> ### Aliases: SES
> ### Keywords: SES Multiple Feature Signatures Feature Selection Variable
> ###   Selection
> 
> ### ** Examples
> 
> set.seed(123)
> #require(gRbase) #for faster computations in the internal functions
> require(hash)
Loading required package: hash
hash-3.0.2 provided by Decision Patterns
> 
> #simulate a dataset with continuous data
> dataset <- matrix(nrow = 1000 , ncol = 300)
> dataset <- apply(dataset, 1:2, function(i) runif(1, 1, 100))
> 
> #define a simulated class variable 
> target = 3*dataset[,10] + 2*dataset[,200] + 3*dataset[,20] + runif(1, 0, 1);
> 
> #define some simulated equivalences
> dataset[,15] = dataset[,10]
> dataset[,250] = dataset[,200] 
> dataset[,230] = dataset[,200] 
> 
> #run the SES algorithm
> sesObject <- SES(target , dataset , max_k=5 , threshold=0.2 , test="testIndFisher", 
+ hash = TRUE, hashObject=NULL);

Conditional independence test used: testIndFisher
error in try catch of the testIndFisher test
Here's the original error message:
could not find function ".set"Error in value[[3L]](cond) : 
Calls: SES ... tryCatch -> tryCatchList -> tryCatchOne -> <Anonymous>
Execution halted 


neuroim ================================================================= 
 


orderbook =============================================================== 
 *  checking whether package ‘orderbook’ can be installed ... ERROR
Installation failed.
See ‘/tmp/RtmpH4OO6G/check_cran6a467fa2b45c/orderbook.Rcheck/00install.out’ for details. 


rpartitions ============================================================= 
 


stream ==================================================================