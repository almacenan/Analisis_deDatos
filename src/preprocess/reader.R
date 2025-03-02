#'@filename: reader.R
#'@description: Archivo de lectura de los datos

url <- "https://www.datos.gov.co/resource/v29b-znjj.json?$limit=5000"
datos_nv <- fromJSON(url) %>% tibble()



serie_poblacion <- read.xlsx("input/01. Raw/DCD-area-proypoblacion-dep-2020-2050-ActPostCOVID-19.xlsx",
                             startRow = 12) %>% 
  tibble()

