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

# Data --------------------------------------------------------------------

ods <- read.xlsx("data/ODS.xlsx")
ods <- select(ods, Objetivo, Meta, Indicador)


# Define UI ---------------------------------------------------------------
ui = tagList(
  navbarPage(
    #> Title
    "ODS - MG",
# Página Inicial ----------------------------------------------------------
    tabPanel("Página Inicial", 
             main_page()
             ),
# Painel com os Programas -------------------------------------------------
    tabPanel("Programas",
             programas()
             ),

# Painel ODS --------------------------------------------------------------
    tabPanel("ODS",  
      painel_ods()
    ),

# Painel Sobre ------------------------------------------------------------
    tabPanel("Sobre",
             about()
             ),
# Link Github -------------------------------------------------------------
    tabPanel("GitHub",
             github_link()
             )
  )
)


# Define the server code
server = function(input, output) {
  
  output$ods <- renderDataTable(ods, 
                                caption = 'Tabela 1: Tabela com a lista dos indicadores do ODS.',
                                filter = 'top',
                                options = list(
                                  autowidth = FALSE,
                                  pageLength = 1000
                                  )
                                )
  
  output$txtout <- renderText({
    paste(input$txt, input$slider, format(input$date), sep = ", ")
  })
  output$table <- renderTable({
    head(cars, 4)
  })
  out <- reactiveVal("Nothing")
  observeEvent(input$goButton,{
    out("Go Pushed")
  })
  observeEvent(input$reset_button,{
    out("Resetted")
  })
  observeEvent(input$web_button,{
    out("From the web")
  })
  output$text <- renderText({out()})
}


# Return a Shiny app object
shinyApp(ui = ui, server = server)