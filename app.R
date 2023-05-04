# Library -----------------------------------------------------------------
library(shiny)
library(readxl)
library(tidyverse)
library(DT)
library(shinydashboard)
library(htmltools)
library(openxlsx)
library(bslib)
library(lubridate)
library(scales)
library(shinyBS)


# Load scripts ------------------------------------------------------------
source("R/main_page.R")
source("R/programas.R")
source("R/painel_ods.R")
source("R/github_link.R")
source("R/utils.R")
source("R/server.R", local = TRUE)
source("ui.R", local = TRUE)

options(scipen = 999)  
# Data --------------------------------------------------------------------

ods <- read.xlsx("data/ODS.xlsx")
ods <- ods %>%
  select(Objetivo, Meta, Indicador) %>%
  mutate(Objetivo = factor(Objetivo,
                           levels = c("Objetivo 1 - Erradicação da Pobreza", "Objetivo 2 - Fome Zero e Agricultura Sustentável",
                                      "Objetivo 3 - Boa Saúde e Bem-Estar", "Objetivo 4 - Educação de Qualidade",
                                      "Objetivo 5 - Igualdade de Gênero", "Objetivo 6 - Água Potável e Saneamento",
                                      "Objetivo 7 - Energia Limpa e Acessível", "Objetivo 8 - Emprego Decente e Crescimento Econômico",
                                      "Objetivo 9 - Indústria, Inovação e Infraestrutura", "Objetivo 10 - Redução das Desigualdades",
                                      "Objetivo 11 - Cidades e Comunidades Sustentáveis", "Objetivo 12 - Consumo e Produção Responsáveis",
                                      "Objetivo 13 - Ação Contra a Mudança Global do Clima", "Objetivo 14 - Vida na Água",
                                      "Objetivo 15 - Vida Terrestre", "Objetivo 16 - Paz, Justiça e Instituições Eficazes", "Objetivo 17 - Parcerias e Meios de Implementação"),
                           labels = c("Objetivo 1 - Erradicação da Pobreza", "Objetivo 2 - Fome Zero e Agricultura Sustentável",
                                      "Objetivo 3 - Boa Saúde e Bem-Estar", "Objetivo 4 - Educação de Qualidade",
                                      "Objetivo 5 - Igualdade de Gênero", "Objetivo 6 - Água Potável e Saneamento",
                                      "Objetivo 7 - Energia Limpa e Acessível", "Objetivo 8 - Emprego Decente e Crescimento Econômico",
                                      "Objetivo 9 - Indústria, Inovação e Infraestrutura", "Objetivo 10 - Redução das Desigualdades",
                                      "Objetivo 11 - Cidades e Comunidades Sustentáveis", "Objetivo 12 - Consumo e Produção Responsáveis",
                                      "Objetivo 13 - Ação Contra a Mudança Global do Clima", "Objetivo 14 - Vida na Água",
                                      "Objetivo 15 - Vida Terrestre", "Objetivo 16 - Paz, Justiça e Instituições Eficazes", "Objetivo 17 - Parcerias e Meios de Implementação")))
ods_vars <- unique(ods$Objetivo)
ods_numbers <- as.data.frame(ods_vars) %>%
  mutate(ods_numbers = str_remove_all(ods_vars, "[^0-9]"))

#> Lista geral de ODS por Programa
prog <- read.xlsx("data/programas_clean.xlsx", sep.names = " ") %>%
  mutate(ODS = factor(ODS, 
                      levels = c("Objetivo 1 - Erradicação da Pobreza", "Objetivo 2 - Fome Zero e Agricultura Sustentável",
                                 "Objetivo 3 - Boa Saúde e Bem-Estar", "Objetivo 4 - Educação de Qualidade",
                                 "Objetivo 5 - Igualdade de Gênero", "Objetivo 6 - Água Potável e Saneamento",
                                 "Objetivo 7 - Energia Limpa e Acessível", "Objetivo 8 - Emprego Decente e Crescimento Econômico",
                                 "Objetivo 9 - Indústria, Inovação e Infraestrutura", "Objetivo 10 - Redução das Desigualdades",
                                 "Objetivo 11 - Cidades e Comunidades Sustentáveis", "Objetivo 12 - Consumo e Produção Responsáveis",
                                 "Objetivo 13 - Ação Contra a Mudança Global do Clima", "Objetivo 14 - Vida na Água",
                                 "Objetivo 15 - Vida Terrestre", "Objetivo 16 - Paz, Justiça e Instituições Eficazes", "Objetivo 17 - Parcerias e Meios de Implementação"),
                      labels = c("Objetivo 1 - Erradicação da Pobreza", "Objetivo 2 - Fome Zero e Agricultura Sustentável",
                                 "Objetivo 3 - Boa Saúde e Bem-Estar", "Objetivo 4 - Educação de Qualidade",
                                 "Objetivo 5 - Igualdade de Gênero", "Objetivo 6 - Água Potável e Saneamento",
                                 "Objetivo 7 - Energia Limpa e Acessível", "Objetivo 8 - Emprego Decente e Crescimento Econômico",
                                 "Objetivo 9 - Indústria, Inovação e Infraestrutura", "Objetivo 10 - Redução das Desigualdades",
                                 "Objetivo 11 - Cidades e Comunidades Sustentáveis", "Objetivo 12 - Consumo e Produção Responsáveis",
                                 "Objetivo 13 - Ação Contra a Mudança Global do Clima", "Objetivo 14 - Vida na Água",
                                 "Objetivo 15 - Vida Terrestre", "Objetivo 16 - Paz, Justiça e Instituições Eficazes", "Objetivo 17 - Parcerias e Meios de Implementação")))

ods_lista<-prog %>%
  distinct(ODS)
prog_ods <- prog %>%
  group_by(`Código do Programa`, `Nome do Programa`) %>%
  summarise(ODS = str_flatten(ODS, collapse = "; "))

row.names(prog) <- 1:nrow(prog)

#> Objetivos estrategicos dos Programas
prog_obj_est <- prog %>%
  mutate(`Objetivo Estratégico` = ifelse(`Objetivo Estratégico` == "NÃO HÁ OBJETIVO ESTRATÉGICO VINCULADO.", NA, `Objetivo Estratégico`)) %>%
  group_by(`Código do Programa`, `Nome do Programa`) %>%
  filter(!duplicated(`Objetivo Estratégico`)) %>%
  mutate(`Objetivo Estratégico` = paste(seq_along(`Objetivo Estratégico`), "-", `Objetivo Estratégico`, sep = " ")) %>%
  summarise(`Objetivo Estratégico` = str_flatten(`Objetivo Estratégico`, collapse = " "), .groups = 'drop') %>%
  mutate(`Objetivo Estratégico` = ifelse(str_detect(`Objetivo Estratégico`, "1 - NA"), "NÃO HÁ OBJETIVO ESTRATÉGICO VINCULADO.", `Objetivo Estratégico`))

  
#> Lista geral dos Programas
prog_list <- prog %>%
  group_by(`Código do Programa`, `Nome do Programa`) %>%
  summarise(`Órgão Responsável pelo Programa` = first(`Órgão Responsável pelo Programa`), 
            `Previsão Orçamentária 2023` = first(`Previsão Orçamentária 2023`),
            Objetivo = first(Objetivo)
            ) %>%
  mutate(`Previsão Orçamentária 2023` = format(`Previsão Orçamentária 2023`, big.mark = ".", decimal.mark = ","),
         `Previsão Orçamentária 2023` = paste("R$", `Previsão Orçamentária 2023`)
         ) %>%
  left_join(prog_obj_est, by = c("Código do Programa", "Nome do Programa"))


#> Lista geral dos indicadores por Programa
indicadores <- read_xls("data/indicadores_planejamento.xls") %>%
  mutate(across(c(2, 4), str_to_sentence)) %>%
  group_by(`Código do Programa`, `Nome do Programa`) %>%
  mutate(Indicador = paste(seq_along(Indicador), "-", Indicador, sep = " ")) %>%
  summarise(Indicador = str_flatten(Indicador, collapse = ". "), .groups = 'drop')

#  summarise(Indicador = str_flatten(Indicador, collapse = "; "))

#> Lista geral das açoes
acoes <- read_xls("data/acoes_planejamento.xls") %>%
  mutate(`Nome do Programa` = gsub("#", "", `Nome do Programa`)) %>%
  select(`Nome do Programa`, `Código da Ação`, `Título da Ação`, `Finalidade da Ação`, `Previsão Orçamentária 2023`, `Previsão Física 2023`)

#> Programa, Unidade, Indicador, ODS Vinculado, Orçamento, Tabela com ação e orçamento das ações


# Define UI ---------------------------------------------------------------



# Define the server code


# Return a Shiny app object
shinyApp(ui = ui, server = server)
