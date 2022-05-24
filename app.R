# Define the UI
ui = tagList(
  navbarPage(
    # theme = "cerulean",  # <--- To use a theme, uncomment this
    "shinythemes",
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
    tabPanel("ODS", "Tabela com os ODS"),
    tabPanel("Sobre", "Informações sobre o Sistema de Monitoramento e link para o Github")
  )
)


# Define the server code
server = function(input, output) {
  output$txtout <- renderText({
    paste(input$txt, input$slider, format(input$date), sep = ", ")
  })
  output$table <- renderTable({
    head(cars, 4)
  })
}


# Return a Shiny app object
shinyApp(ui = ui, server = server)