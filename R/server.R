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
    ods_vars$vars <- ods_vars$selected[[1]]
  })
  observeEvent(input$ods2_button, {
    ods_vars$vars <- ods_vars$selected[[2]]
  })
  observeEvent(input$ods3_button, {
    ods_vars$vars <- ods_vars$selected[[3]]
  })
  observeEvent(input$ods4_button, {
    ods_vars$vars <- ods_vars$selected[[4]]
  })
  observeEvent(input$ods5_button, {
    ods_vars$vars <- ods_vars$selected[[5]]
  })
  observeEvent(input$ods6_button, {
    ods_vars$vars <- ods_vars$selected[[6]]
  })
  observeEvent(input$ods7_button, {
    ods_vars$vars <- ods_vars$selected[[7]]
  })
  observeEvent(input$ods8_button, {
    ods_vars$vars <- ods_vars$selected[[8]]
  })
  observeEvent(input$ods9_button, {
    ods_vars$vars <- ods_vars$selected[[9]]
  })
  observeEvent(input$ods10_button, {
    ods_vars$vars <- ods_vars$selected[[10]]
  })
  observeEvent(input$ods11_button, {
    ods_vars$vars <- ods_vars$selected[[11]]
  })
  observeEvent(input$ods12_button, {
    ods_vars$vars <- ods_vars$selected[[12]]
  })
  observeEvent(input$ods13_button, {
    ods_vars$vars <- ods_vars$selected[[13]]
  })
  observeEvent(input$ods14_button, {
    ods_vars$vars <- ods_vars$selected[[14]]
  })
  observeEvent(input$ods15_button, {
    ods_vars$vars <- ods_vars$selected[[15]]
  })
  observeEvent(input$ods16_button, {
    ods_vars$vars <- ods_vars$selected[[16]]
  })
  observeEvent(input$ods17_button, {
    ods_vars$vars <- ods_vars$selected[[17]]
  })
  observeEvent(input$odsGeral_button, {
    ods_vars$vars <- ods_vars$selected
  })
  # ODS Data Table ----------------------------------------------------------
  ods_vars <- reactiveValues(vars = unique(ods$Objetivo), selected = unique(ods$Objetivo))
  ods_selected <- 
  
  output$ods <- renderDataTable({
    datatable(
      filter(ods, Objetivo %in% ods_vars$vars),
      caption = 'Tabela 1: Tabela com a lista dos indicadores do ODS.',
      filter = 'top',
      #rownames = FALSE,
      options = list(
        autowidth = FALSE,
        pageLength = 25,
        columnDefs = list(list(width = '20%', targets = 1), list(width = '40%', targets = c(2, 3)))
        )
      )
    }
  )
}