# Library -----------------------------------------------------------------
library(shiny)
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
source("server.R", local = TRUE)
source("ui.R", local = TRUE)

options(scipen = 999)  
# Data --------------------------------------------------------------------

ods <- read.xlsx("data/ODS.xlsx")
ods <- select(ods, Objetivo, Meta, Indicador)
ods_vars <- unique(ods$Objetivo)
ods_numbers <- as.data.frame(ods_vars) %>%
  mutate(ods_numbers = str_remove_all(ods_vars, "[^0-9]"))

#> Lista geral de ODS por Programa
prog <- read.xlsx("data/programas_clean.xlsx", sep.names = " ")

prog_ods <- prog %>%
  group_by(`Código do Programa`, `Nome do Programa`) %>%
  summarise(ODS = str_flatten(ODS, collapse = "; "))

row.names(prog) <- 1:nrow(prog)

#> Lista geral dos Programas
prog_list <- prog %>%
  group_by(`Código do Programa`, `Nome do Programa`) %>%
  summarise(`Órgão Responsável pelo Programa` = first(`Órgão Responsável pelo Programa`), 
            `Previsão Orçamentária 2022` = first(`Previsão Orçamentária 2022`),
            Objetivo = first(Objetivo)) %>%
  mutate(`Previsão Orçamentária 2022` = format(`Previsão Orçamentária 2022`, big.mark = ".", decimal.mark = ","),
         `Previsão Orçamentária 2022` = paste("R$", `Previsão Orçamentária 2022`))

#> Lista geral dos indicadores por Programa
indicadores <- read.xlsx("data/indicadores_planejamento.xlsx", sep.names = " ") %>%
  mutate(across(c(2, 4), str_to_sentence)) %>%
  group_by(`Código do Programa`, `Nome do Programa`) %>%
  summarise(Indicador = paste(seq_along(Indicador), "-", Indicador, sep = " ")) %>%
  summarise(Indicador = str_flatten(Indicador, collapse = ". "))

#  summarise(Indicador = str_flatten(Indicador, collapse = "; "))

#> Lista geral das açoes
acoes <- read.xlsx("data/acoes_planejamento.xlsx", sep.names = " ") %>%
  select(1,2, `Título da Ação`, 39:46) %>%
  mutate(across(2:3, str_to_sentence))


#> Programa, Unidade, Indicador, ODS Vinculado, Orçamento, Tabela com ação e orçamento das ações


# Define UI ---------------------------------------------------------------



# Define the server code


# Return a Shiny app object
shinyApp(ui = ui, server = server)
