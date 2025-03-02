#'@filename: main.R
#' @description: Archivo de centralización de la ejecución del 
#' #análisis de negocios verdes

# setwd("")
#setwd("C:/Users/dsant/Documents/AED2025")
#Configuración del proyecto
source("src/config.R")
#Lectura de datos
source("src/preprocess/reader.R")
source("src/preprocess/etl.R")

