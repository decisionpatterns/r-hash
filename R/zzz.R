
.onLoad <- function( libname, pkgname ) {

#  if( is.null( getOption( "odg.logo" ) ) && ! getOption("verbose") ) {
#    width <- getOption("width")
#    options( width=80 )
#
#    cat(
#      "                            _       _        ",
#      "  ___  _ __   ___ _ __   __| | __ _| |_ __ _ ",
#      " / _ \\| '_ \\ / _ \\ '_ \\ / _` |/ _' | __/ _' |",
#      "| (_) | |_) |  __/ | | | (_| | (_| | || (_| |",
#      " \\___/| .__/ \\___|_| |_|\\__,_|\\__,_|\\__\\__,_|",
#      "      |_|       http://www.opendatagroup.com\n",
#      sep="\n"
#    )
#    options( width=width )
#    options( odg.logo = TRUE )
#
#  } 
  
  cat( 
    "\n  ", 
    pkgname , 
    "-" , 
    utils::installed.packages()[ pkgname , "Version"], 
    " provided by Open Data.\n" ,
    sep = ""
  )

}


