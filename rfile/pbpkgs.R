local({r = getOption("repos")
r["CRAN"] = "https://cloud.r-project.org/"
options(repos=r)})

pkgs = c("devtools", "lattice", "GGally", "lubridate", "stringr", "ggplot2", "scales",
 "reshape2", "data.table", "coefplot", "broom", "RJDBC", "XLConnect", "RJSONIO", "sp", "png", "pixmap", "mapdata", "maptools", "maps", "rgeos", "Rcmdr")

pkgs = pkgs[!( pkgs %in% installed.packages()[,"Package"] )]

# install
if(length(pkgs)){
	install.packages(pkgs)
}

require(devtools)
install_github('rCharts', 'ramnathv')


