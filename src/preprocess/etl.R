#'@filename: etl.R
#'@description: Preprocesamiento por fecha, tipo y depto

# Generando los datos intermedios -----------------------------------------

datos_by_categoria <- datos_nv %>%
  group_by(a_o_a_o_de_registro,departamento_donde_se,sector_al_cual_pertenece) %>%
  summarise(n_negocios = n()) %>%
  rename(anio = "a_o_a_o_de_registro",
         dpto = "departamento_donde_se",
         sector = "sector_al_cual_pertenece") %>%
  ungroup() %>%
  mutate(dpto= ifelse(dpto=="BOYACA","Boyacá" ,dpto),
         dpto= ifelse(dpto=="Archipiélago de San Andrés, Providencia y Santa Catalina","San Andrés", dpto),
         dpto= ifelse(dpto=="Quindío","Quindio", dpto))

datos_by_categoria$dpto %>% unique()

# Exportando los datos ----------------------------------------------------

wb <- createWorkbook()
addWorksheet(wb,"Data_anos_depto")
writeData(wb, "Data_anos_depto", datos_by_categoria)
saveWorkbook(file="output/datos_by_cat.xlsx",wb, overwrite = T)

#CRUCE POR DEPARTAMENTO

left_join(datos_by_categoria, serie_pob_2022, by = c("dpto"="DPNOM"))%>%
  filter(is.na(DP)) %>%
  PULL(dpto) %>%
  unique() 





# FILTRO DE SERIE POBLACIONAL


serie_pob_2022 <- serie_poblacion %>%
  filter( ÁREA.GEOGRÁFICA =="Total", AÑO=='2022')

# Filtro d serie departamental
serie_pob_2022 <- serie_poblacion %>%
  filter(ÁREA.GEOGRÁFICA =="Total", AÑO =='2022')%>%
  mutate(dpnom =ifelse(DPNOM =="Archipiélago de San Andrés", "San Andres", DPNOM))
  