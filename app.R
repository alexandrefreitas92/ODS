# Library -----------------------------------------------------------------
library(shiny)
library(tidyverse)
library(DT)
library(shinydashboard)
library(htmltools)
library(openxlsx)
library(bslib)
library(lubridate)
library(rio)


# Load scripts ------------------------------------------------------------
source("R/main_page.R")
source("R/programas.R")
source("R/painel_ods.R")
source("R/github_link.R")
source("R/server.R", local = TRUE)
source("R/ui.R", local = TRUE)

# Data --------------------------------------------------------------------

ods <- read.xlsx("data/ODS.xlsx")
ods <- select(ods, Objetivo, Meta, Indicador)
ods_vars <- unique(ods$Objetivo)

prog <- rio::import("data/programas.xlsx") %>% 
  janitor::clean_names() %>% 
  select(nome_do_programa,
         objetivo,
         justificativa,
         unidade_administrativa_responsavel_pelo_programa,
         previsao_orcamentaria_2022,
         titulo_do_objetivo_de_desenvolvimento_sustentavel,
         area_tematica) %>% 
  group_by_all() %>% 
  count() %>%
  rename('Nome do programa' = nome_do_programa,
         'Objetivo' = objetivo,
         'Justificativa' = justificativa,
         'Unidade Administrativa responsável' = unidade_administrativa_responsavel_pelo_programa,
         'Previsão orçamentária (2022)' = previsao_orcamentaria_2022,
         'ODS' = titulo_do_objetivo_de_desenvolvimento_sustentavel,
         'Área Temática' = area_tematica)

prog$`Nome do programa` <- gsub("#","",prog$`Nome do programa`)

columns <- c('Nome do programa', 'Objetivo', 'Justificativa', 'Unidade Administrativa responsável', 'Unidade Administrativa responsável', 'Previsão orçamentária (2022)', 'ODS', 'Área Temática')

prog <- prog %>%
  mutate_at(vars(columns), funs(stringr::str_to_sentence(.)))

#prog <- read.xlsx("data/programas.xlsx", sep.names = " ")
#prog <- select(prog, `Nome do Programa`, Objetivo, Justificativa, `Unidade Administrativa Responsável pelo Programa`, `Previsão Orçamentária 2022`, `Título do Objetivo de Desenvolvimento Sustentável`)

# Define UI ---------------------------------------------------------------



# Define the server code


# Return a Shiny app object
shinyApp(ui = ui, server = server)