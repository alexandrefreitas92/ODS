server <- function(input, output, session) {
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