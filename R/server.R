server <- function(input, output, session) {


# Main Page ---------------------------------------------------------------

  observeEvent(input$ir_tab_ods, {
    updateTabsetPanel(session, "inTabset",
                      selected = "ods_panel")
  })
  observeEvent(input$ir_tab_programs, {
    updateTabsetPanel(session, "inTabset",
                      selected = "programs_panel")
  })  
  
# ODS Data Table ----------------------------------------------------------
  output$ods <- renderDataTable(ods, 
                                caption = 'Tabela 1: Tabela com a lista dos indicadores do ODS.',
                                filter = 'top',
                                options = list(
                                  autowidth = TRUE,
                                  pageLength = 25
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

# ODS Action Buttons ------------------------------------------------------
  observeEvent(input$ods1_button, {
    updateNavbarPage(session, "inTabset",
                      selected = "ods_table")
  })
  
  
}