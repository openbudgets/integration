#Step1: install the devtools package
options(repos=structure(c(CRAN="https://cloud.r-project.org/")))

if(!require(devtools)){
    install.packages("devtools")
    library(devtools)
}

#Step2: install and load the Libraries
#cluster

if(!require(Cluster.OBeu)){
  devtools::install_github("okgreece/Cluster.OBeu", quick=T, local=T, force_deps=F, threads=4)
  library(Cluster.OBeu)
} else {
  devtools::install_github("okgreece/Cluster.OBeu")
}

#timeseries
if(!require(TimeSeries.OBeu)){
  devtools::install_github("okgreece/TimeSeries.OBeu", quick=T, local=T, force_deps=F, threads=4)
  library(TimeSeries.OBeu)
} else {
  devtools::install_github("okgreece/TimeSeries.OBeu")
}

#descriptive
if(!require(DescriptiveStats.OBeu)){
  devtools::install_github("okgreece/DescriptiveStats.OBeu", quick=T, local=T, force_deps=F, threads=4)
  library(DescriptiveStats.OBeu)
} else {
  devtools::install_github("okgreece/DescriptiveStats.OBeu")
}
