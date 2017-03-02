
# .First.lib <- function( libname, pkgname ) {
.onAttach <- function( libname, pkgname ) {

  suppressWarnings( try( v <- utils::packageVersion(pkgname, libname), silent = TRUE ))
  version <- if( exists('v') ) paste0("-", v ) else ""

  if( interactive() )
    packageStartupMessage(
      pkgname ,
      version ,
      " - Copyright \u00a9 ", substr(Sys.Date(),1,4),
      " Decision Patterns" ,
      domain = NA
    )

}

