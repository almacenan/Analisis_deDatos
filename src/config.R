#'@filename: congig.R
#'@description: En este archivo están las configuraciones básicas del proyecto de analitica


rm(list = ls())
inPath <- file.path("input/")
outPath <- file.path("output/")
srcPath <- file.path("src/")

source(file.path(srcPath,"dependencies.R"))
