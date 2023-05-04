library(tidyverse)
library(openxlsx)
ods <- read.xlsx("data/ODS.xlsx")
ods <- select(ods, Objetivo, Meta, Indicador)
ods_vars <- unique(ods$Objetivo)
ods_numbers <- as.data.frame(ods_vars) %>%
  mutate(ods_numbers = str_remove_all(ods_vars, "[^0-9]"))

#> Lista geral de ODS por Programa
prog <- read_xls("data/programas_planejamento.xls") %>%
  mutate(across(where(is.double), as.numeric)) %>%
  select(`Código do Programa`, `Nome do Programa`, `Objetivo Estratégico`, Objetivo, Justificativa, `Órgão Responsável pelo Programa`, 
         `Previsão Orçamentária 2023`, `Título do Objetivo de Desenvolvimento Sustentável`, `Área Temática`) %>%
  mutate(`Nome do Programa` = gsub("#", "", `Nome do Programa`),
         ods_numbers = str_remove_all(`Título do Objetivo de Desenvolvimento Sustentável`, "[^0-9]")) %>%
  mutate(`Objetivo Estratégico` = str_to_upper(`Objetivo Estratégico`)) %>%
#  mutate(across(3:5, str_to_sentence)) %>%
  unique() %>%
  left_join(ods_numbers, by = "ods_numbers") %>%
  rename("ODS" = ods_vars)

write.xlsx(prog, "data/programas_clean.xlsx", asTable = FALSE)
