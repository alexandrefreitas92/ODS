# Library -----------------------------------------------------------------
library(shiny)
library(tidyverse)
library(DT)
library(shinydashboard)
library(htmltools)


# Data --------------------------------------------------------------------

ods <- read.xlsx("data/ODS.xlsx")
ods <- select(ods, Objetivo, Meta, Indicador)

# Define the UI
ui = tagList(
  navbarPage(
    # theme = "cerulean",  # <--- To use a theme, uncomment this
    "ODS - MG",
    tabPanel("Página Inicial", "Aqui vai ter as imagens para escolher para qual painel a pessoa quer ir"),
    tabPanel("Programas",
             sidebarPanel(
               fileInput("file", "File input:"),
               textInput("txt", "Text input:", "general"),
               sliderInput("slider", "Slider input:", 1, 100, 30),
               tags$h5("Default actionButton:"),
               actionButton("action", "Search"),
               
               tags$h5("actionButton with CSS class:"),
               actionButton("action2", "Action button", class = "btn-primary")
             ),
             mainPanel(
               tabsetPanel(
                 tabPanel("Tab 1",
                          h4("Table"),
                          tableOutput("table"),
                          h4("Verbatim text output"),
                          verbatimTextOutput("txtout"),
                          h1("Header 1"),
                          h2("Header 2"),
                          h3("Header 3"),
                          h4("Header 4"),
                          h5("Header 5")
                 ),
                 tabPanel("Tab 2", "This panel is intentionally left blank"),
                 tabPanel("Tab 3", "This panel is intentionally left blank")
               )
             )
    ),
    tabPanel("ODS", DT::dataTableOutput('ods')),
    tabPanel("Sobre"),
#    tabPanel(actionButton("github",
#                           label = "Code",
#                           icon = icon("github"),
#                           onclick ="window.open(`https://github.com/howardbaik/nhl-pbp`, '_blank')"),
#                           #style="color: #fff; background-color: #767676; border-color: #767676"),
#              #data.step = 6,
#              data.intro = "View Code"),
    tabPanel("GitHub", icon = icon("fab fa-github"), href = "https://github.com/ods-sedese/bolsa-merenda", target="_blank")
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
}


# Return a Shiny app object
shinyApp(ui = ui, server = server)