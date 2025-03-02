#' @filename: descriptives.R
#' @description: Estadisticas descriptivas basicas

neg_by_anios <-datos_by_categoria %>% 
  group_by(anio) %>% 
  summarise(total = sum(n_negocios))

####

neg_by_dep <-datos_by_categoria %>% 
  group_by(dpto) %>% 
  summarise(total = sum(n_negocios))

ggplot(neg_by_anios, aes(x=anio, y=total, fill=factor(anio))) +
  geom_bar(stat="identity") +
  geom_text(aes(label=total), vjust=-0.5, color="black", size=3.5) +
  scale_fill_manual(values = rainbow(length(unique(neg_by_anios$anio)))) +
  labs(x = "Año", y = "Número de negocios verdes", title = "Evolución del número de negocios verdes") +
  theme_minimal() + 
  
    theme(
      
      axis.text = element_text(color = "grey40"),
      axis.title = element_text(color = "grey40"),
      panel.grid.major = element_line(color = "grey80", linetype =  "dotted"),
      panel.grid.minor = element_line(color = "grey80", linetype =  "dotted"),
      panel.background = element_blank()
      
    )


# CALCULO DE NUMERO DE NEGOCIOS POR CAPITA --------------------------------

neg_percapita <- datos_by_categoria %>% 
  group_by(dpto) %>% 
  summarise(n_negocios=sum())


####

ggplot(neg_by_dep, aes(x=total, y=dpto)) +
  geom_bar(stat="identity") +
  geom_text(aes(label=total), vjust=-0.5, color="black", size=3.5) +
  scale_fill_manual(values = rainbow(length(unique(neg_by_dep$dpto)))) +
  labs(x = "Número de negocios verdes", y = "Dpto", title = "Número de negocios verdes por departamento") +
  theme_minimal()
+ 
  
  theme(
    
    axis.text = element_text(color = "grey40"),
    axis.title = element_text(color = "grey40"),
    panel.grid.major = element_line(color = "grey80", linetype =  "dotted"),
    panel.grid.minor = element_line(color = "grey80", linetype =  "dotted"),
    panel.background = element_blank()
    
  )

# EXPORTANDO LOS DATOS ----------------------------------------------------

wb <- createWorkbook()
addWorksheet(WB, "Data_anos_dpto")
writeData(wb, "Data_anos_dpto", datos_by_categoria)
saveWorkbook(file="output/datos_by_cat.xlsx", wb, overwrite=T)
