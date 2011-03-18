
# .First.lib <- function( libname, pkgname ) {
.onAttach <- function( libname, pkgname ) {

  packageStartupMessage( 
    pkgname ,
    "-" ,
    utils::installed.packages()[ pkgname , "Version"],
    " provided by Decision Patterns\n" ,
    domain = NA
  )

}

