library(tidyverse)
library(DT)

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
  

  

# Programs ----------------------------------------------------------------

  output$name <- renderText({
    input$name
  })

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
  
  output$ods <- renderDataTable({
    datatable(
      filter(ods, Objetivo %in% ods_vars$vars),
      caption = 'Tabela 1: Tabela com a lista dos indicadores do ODS.',
      extensions = 'Buttons',
      options = list(
        autowidth = FALSE,
        pageLength = 25,
        columnDefs = list(list(width = '20%', targets = 1), list(width = '40%', targets = c(2, 3))),
        dom = 'Bfrtip',
        buttons = 
          list('copy', 'print', list(
            extend = 'collection',
            buttons = c('csv', 'excel', 'pdf'),
            text = 'Download'
          ))
        )
      )
    }
  )
  
  # Programas Data Table ---------------------------------------------------------- 
#  prog_vars <- reactiveValues(vars = prog$`Nome do Programa`, selected = prog$`Nome do Programa`)
  #selectODS <- reactive(input$selectODS)

    output$table_acoes <- renderDataTable({
      
      if (input$selectProgram == "Escolha aqui o Programa") {
        datatable(
          acoes[0,3:ncol(acoes)],
          caption = 'Tabela 1: Tabela com a lista das ações do Programa selecionado.'
        )
      } else {
        datatable(
          select(filter(acoes, `Nome do Programa` == input$selectProgram), -c(1,2)),
          caption = 'Tabela 1: Tabela com a lista das ações do Programa selecionado.',
          rownames = FALSE,
          extensions = 'Scroller', 
          options = list(
            deferRender = TRUE,
            scrollX = 200,
            scroller = TRUE
          )
        ) %>%
          formatCurrency(2:5, currency = "R$", mark = ".", dec.mark = ",") %>%
          formatRound(6:9, mark = ".", dec.mark = ",", digits = 0)
      }
  })
  
  observeEvent(input$selectOrgao,
               {
                 if (input$selectOrgao != "Escolha aqui o Órgão") {
                 updateSelectInput(session,
                                  inputId = "selectProgram",
                                  choices = sort(unique(prog
                                                 [prog$`Órgão Responsável pelo Programa` == input$selectOrgao,"Nome do Programa"])))
                 } else {
                   updateSelectInput(session,
                                     inputId = "selectProgram",
                                     choices = c("Escolha aqui o Programa", sort(unique(prog$`Nome do Programa`))))
                   }
                 }
  )
  
  output$textUnidadeName <- renderText({
    if (input$selectOrgao == "Escolha aqui o Órgão" & input$selectProgram == "Escolha aqui o Programa") {
      txt_orgao <- "Selecione o órgão responsável pela política ao lado."       
    } else if (input$selectProgram != "Escolha aqui o Programa") {
      txt_orgao <- filter(prog_list, `Nome do Programa` == input$selectProgram)
      txt_orgao <- txt_orgao$`Órgão Responsável pelo Programa`
    } else {
      txt_orgao <- input$selectOrgao
    }
    paste0(txt_orgao)
  })
  
  output$textProgramName <- renderText({ 
    if (input$selectProgram == "Escolha aqui o Programa") {
      txt_programa <- "Selecione o Programa ao lado."       
    } else {
      txt_programa <- input$selectProgram
    }
    paste0(txt_programa)
    })
  
  output$textProgramOrcament <- renderText({ 
    if (input$selectProgram == "Escolha aqui o Programa") {
      txt_orcament <- "Selecione o Programa ao lado."       
    } else {
      txt_orcament <- filter(prog_list, `Nome do Programa` == input$selectProgram)
      txt_orcament <- txt_orcament$`Previsão Orçamentária 2022`
    }
    paste0(txt_orcament)
  })
  
  output$textProgramOrcament <- renderText({ 
    if (input$selectProgram == "Escolha aqui o Programa") {
      txt_orcament <- "Selecione o Programa ao lado."       
    } else {
      txt_orcament <- filter(prog_list, `Nome do Programa` == input$selectProgram)
      txt_orcament <- txt_orcament$`Previsão Orçamentária 2022`
    }
    paste0(txt_orcament)
  })
  
  output$textProgramObjective <- renderText({ 
    if (input$selectProgram == "Escolha aqui o Programa") {
      txt_objective <- "Selecione o Programa ao lado."       
    } else {
      txt_objective <- filter(prog_list, `Nome do Programa` == input$selectProgram)
      txt_objective <- txt_objective$Objetivo
    }
    paste0(txt_objective)
  })
  
  output$textProgramIndicators <- renderText({ 
    if (input$selectProgram == "Escolha aqui o Programa") {
      txt_indicators <- "Selecione o Programa ao lado."       
    } else {
      txt_indicators <- filter(indicadores, `Nome do Programa` == input$selectProgram)
      txt_indicators <- txt_indicators$Indicador
    }
    paste0(txt_indicators)
  })
  

# Programas - ODS ---------------------------------------------------------
  
  #> ODS 1
  output$program_ods1 <- renderImage({
    ods1 <- "Objetivo 1 - Erradicação da Pobreza"
    if (req(input$selectProgram != "Escolha aqui o Programa")){
      programa_ods <- filter(prog, `Nome do Programa` == input$selectProgram)
      if(req(ods1 %in% programa_ods$ODS)) {
        list(src = "www/images/ods/1.png",
             height="100", 
             width="100",
             alt="Test")
      }
    }
  }, deleteFile = FALSE)
  outputOptions(output, "program_ods1", suspendWhenHidden = FALSE)
  
  #> ODS 2
  output$program_ods2 <- renderImage({
    ods2 <- "Objetivo 2 - Fome Zero e Agricultura Sustentável"
    if (req(input$selectProgram != "Escolha aqui o Programa")){
      programa_ods <- filter(prog, `Nome do Programa` == input$selectProgram)
      if(req(ods2 %in% programa_ods$ODS)) {
        list(src = "www/images/ods/2.png",
             height="100", 
             width="100",
             alt="Test")
      } else {return(NULL)}
    } else {return(NULL)}
    
  }, deleteFile = FALSE)
  
  #> ODS 3
  output$program_ods3 <- renderImage({
    ods3 <- "Objetivo 3 - Boa Saúde e Bem-Estar"
    if (req(input$selectProgram != "Escolha aqui o Programa")){
      programa_ods <- filter(prog, `Nome do Programa` == input$selectProgram)
      if(req(ods3 %in% programa_ods$ODS)) {
        list(src = "www/images/ods/3.png",
             height="100", 
             width="100",
             alt="Test")
      }
    }
    
  }, deleteFile = FALSE)

# Program - ODS Modal Table -----------------------------------------------

  output$ods_table_modal = renderDataTable({
    
    #> Não renderizar DataTable se nao houver Programa escolhido
    if (req(input$selectProgram != "Escolha aqui o Programa")){
      
      #> Filtrar programa
      programa_ods <- filter(prog, `Nome do Programa` == input$selectProgram)
      
      #> Salvar ODS do Programa
      programa_ods_reactive <- reactiveValues(ODS = programa_ods$ODS)
      
      #> Renderizar tabela
      datatable(filter(ods, ODS %in% programa_ods_reactive$ODS),
      )
      
    }
    
    
    
  })


# Frame -------------------------------------------------------------------

  output$frame <- renderUI({
    forms <- "https://docs.google.com/forms/d/e/1FAIpQLSf1VOg8CtPaVbBjI_ISAnEAAqxmOr9zdhqEiqx3vZw2zsVzKA/viewform"
    my_test <- tags$iframe(src=forms, height=600, width=535)
    print(my_test)
    my_test
  })  
  
# Github link -------------------------------------------------------------

  url <- a("Google Homepage", href="https://www.google.com/")
  output$GitHub <- renderUI({
    tagList("URL link:", url)
  })
}