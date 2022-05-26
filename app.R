# Library -----------------------------------------------------------------
library(shiny)
library(tidyverse)
library(DT)
library(shinydashboard)
library(htmltools)
library(openxlsx)


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

# Return a Shiny app object
shinyApp(ui = ui, server = server)