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
  validacao <- reactiveValues(ods1 = FALSE, ods2 = FALSE, ods3 = FALSE, ods4 = FALSE, ods5 = FALSE, ods6 = FALSE,
                              ods7 = FALSE, ods8 = FALSE, ods9 = FALSE, ods10 = FALSE, ods11 = FALSE, ods12 = FALSE,
                              ods13 = FALSE, ods14 = FALSE, ods15 = FALSE, ods16 = FALSE, ods17 = FALSE)
  
  observeEvent(input$selectProgram, {
    if (input$selectProgram %in% filter(prog, `Nome do Programa` == input$selectProgram & ODS == 'Objetivo 1 - Erradicação da Pobreza')) {
      validacao$ods1 <- TRUE 
    } else {validacao$ods1 <- FALSE}
    if (input$selectProgram %in% filter(prog, `Nome do Programa` == input$selectProgram & ODS == 'Objetivo 2 - Fome Zero e Agricultura Sustentável')) {
      validacao$ods2 <- TRUE 
    } else {validacao$ods2 <- FALSE}
    if (input$selectProgram %in% filter(prog, `Nome do Programa` == input$selectProgram & ODS == 'Objetivo 3 - Boa Saúde e Bem-Estar')) {
      validacao$ods3 <- TRUE 
    } else {validacao$ods3 <- FALSE}
    if (input$selectProgram %in% filter(prog, `Nome do Programa` == input$selectProgram & ODS == 'Objetivo 4 - Educação de Qualidade')) {
      validacao$ods4 <- TRUE 
    } else {validacao$ods4 <- FALSE}
    if (input$selectProgram %in% filter(prog, `Nome do Programa` == input$selectProgram & ODS == 'Objetivo 5 - Igualdade de Gênero')) {
      validacao$ods5 <- TRUE 
    } else {validacao$ods5 <- FALSE}
    if (input$selectProgram %in% filter(prog, `Nome do Programa` == input$selectProgram & ODS == 'Objetivo 6 - Água Potável e Saneamento')) {
      validacao$ods6 <- TRUE 
    } else {validacao$ods6 <- FALSE}
    if (input$selectProgram %in% filter(prog, `Nome do Programa` == input$selectProgram & ODS == 'Objetivo 7 - Energia Limpa e Acessível')) {
      validacao$ods7 <- TRUE 
    } else {validacao$ods7 <- FALSE}
    if (input$selectProgram %in% filter(prog, `Nome do Programa` == input$selectProgram & ODS == 'Objetivo 8 - Emprego Decente e Crescimento Econômico')) {
      validacao$ods8 <- TRUE 
    } else {validacao$ods8 <- FALSE}
    if (input$selectProgram %in% filter(prog, `Nome do Programa` == input$selectProgram & ODS == 'Objetivo 9 - Indústria, Inovação e Infraestrutura')) {
      validacao$ods9 <- TRUE 
    } else {validacao$ods9 <- FALSE}
    if (input$selectProgram %in% filter(prog, `Nome do Programa` == input$selectProgram & ODS == 'Objetivo 10 - Redução das Desigualdades')) {
      validacao$ods10 <- TRUE 
    } else {validacao$ods10 <- FALSE}
    if (input$selectProgram %in% filter(prog, `Nome do Programa` == input$selectProgram & ODS == 'Objetivo 11 - Cidades e Comunidades Sustentáveis')) {
      validacao$ods11 <- TRUE 
    } else {validacao$ods11 <- FALSE}
    if (input$selectProgram %in% filter(prog, `Nome do Programa` == input$selectProgram & ODS == 'Objetivo 12 - Consumo e Produção Responsáveis')) {
      validacao$ods12 <- TRUE 
    } else {validacao$ods12 <- FALSE}
    if (input$selectProgram %in% filter(prog, `Nome do Programa` == input$selectProgram & ODS == 'Objetivo 13 - Ação Contra a Mudança Global do Clima')) {
      validacao$ods13 <- TRUE 
    } else {validacao$ods13 <- FALSE}
    if (input$selectProgram %in% filter(prog, `Nome do Programa` == input$selectProgram & ODS == "Objetivo 14 - Vida na Água")) {
      validacao$ods14 <- TRUE 
    } else {validacao$ods14 <- FALSE}
    if (input$selectProgram %in% filter(prog, `Nome do Programa` == input$selectProgram & ODS == 'Objetivo 15 - Vida Terrestre')) {
      validacao$ods15 <- TRUE 
    } else {validacao$ods15 <- FALSE}
    if (input$selectProgram %in% filter(prog, `Nome do Programa` == input$selectProgram & ODS == 'Objetivo 16 - Paz, Justiça e Instituições Eficazes')) {
      validacao$ods16 <- TRUE 
    } else {validacao$ods16 <- FALSE}
    if (input$selectProgram %in% filter(prog, `Nome do Programa` == input$selectProgram & ODS == 'Objetivo 17 - Parcerias e Meios de Implementação')) {
      validacao$ods17 <- TRUE 
    } else {validacao$ods17 <- FALSE}
    
   })
  
  output$test_ods1 <- renderText({validacao$ods1})
  output$test_ods2 <- renderText({validacao$ods2})
  output$test_ods3 <- renderText({validacao$ods3})
  output$test_ods4 <- renderText({validacao$ods4})
  output$test_ods5 <- renderText({validacao$ods5})
  output$test_ods6 <- renderText({validacao$ods6})
  output$test_ods7 <- renderText({validacao$ods7})
  output$test_ods8 <- renderText({validacao$ods8})
  output$test_ods9 <- renderText({validacao$ods9})
  output$test_ods10 <- renderText({validacao$ods10})
  output$test_ods11 <- renderText({validacao$ods11})
  output$test_ods12 <- renderText({validacao$ods12})
  output$test_ods13 <- renderText({validacao$ods13})
  output$test_ods14 <- renderText({validacao$ods14})
  output$test_ods15 <- renderText({validacao$ods15})
  output$test_ods16 <- renderText({validacao$ods16})
  output$test_ods17 <- renderText({validacao$ods17})
  
 # outputOptions(output, c("test_ods1", "test_ods2", "test_ods3", "test_ods4", "test_ods5",
#                          "test_ods6", "test_ods7", "test_ods8", "test_ods9", "test_ods10"), suspendWhenHidden = FALSE)
  outputOptions(output, "test_ods1", suspendWhenHidden = FALSE)
  outputOptions(output, "test_ods2", suspendWhenHidden = FALSE)
  outputOptions(output, "test_ods3", suspendWhenHidden = FALSE)
  outputOptions(output, "test_ods4", suspendWhenHidden = FALSE)
  outputOptions(output, "test_ods5", suspendWhenHidden = FALSE)
  outputOptions(output, "test_ods6", suspendWhenHidden = FALSE)
  outputOptions(output, "test_ods7", suspendWhenHidden = FALSE)
  outputOptions(output, "test_ods8", suspendWhenHidden = FALSE)
  outputOptions(output, "test_ods9", suspendWhenHidden = FALSE)
  outputOptions(output, "test_ods10", suspendWhenHidden = FALSE)
  outputOptions(output, "test_ods11", suspendWhenHidden = FALSE)
  outputOptions(output, "test_ods12", suspendWhenHidden = FALSE)
  outputOptions(output, "test_ods13", suspendWhenHidden = FALSE)
  outputOptions(output, "test_ods14", suspendWhenHidden = FALSE)
  outputOptions(output, "test_ods15", suspendWhenHidden = FALSE)
  outputOptions(output, "test_ods16", suspendWhenHidden = FALSE)
  outputOptions(output, "test_ods17", suspendWhenHidden = FALSE)
  
  
  
  
#  observeEvent(input$selectProgram, {
#    if (input$selectProgram %in% filter(prog, `Nome do Programa` == input$selectProgram & ODS == 'Objetivo 2 - Fome Zero e Agricultura Sustentável')) {
#      validacao$ods2 <- TRUE 
#    } else {validacao$ods2 <- FALSE}
#  })
#  output$test2 <- renderText({validacao$ods2})

  output$program_ods1 <- renderUI({
    tags$div(img(src = "images/ods/1.png",
                 height="100", 
                 width="100"))
  })
  output$program_ods2 <- renderUI({
    tags$div(img(src = "images/ods/2.png",
                 height="100", 
                 width="100"))
  })
  output$program_ods3 <- renderUI({
    tags$div(img(src = "images/ods/3.png",
                 height="100", 
                 width="100"))
  })
  output$program_ods4 <- renderUI({
    tags$div(img(src = "images/ods/4.png",
                 height="100", 
                 width="100"))
  })
  output$program_ods5 <- renderUI({
    tags$div(img(src = "images/ods/5.png",
                 height="100", 
                 width="100"))
  })
  output$program_ods6 <- renderUI({
    tags$div(img(src = "images/ods/6.png",
                 height="100", 
                 width="100"))
  })
  output$program_ods7 <- renderUI({
    tags$div(img(src = "images/ods/7.png",
                 height="100", 
                 width="100"))
  })
  output$program_ods8 <- renderUI({
    tags$div(img(src = "images/ods/8.png",
                 height="100", 
                 width="100"))
  })
  output$program_ods9 <- renderUI({
    tags$div(img(src = "images/ods/9.png",
                 height="100", 
                 width="100"))
  })
  output$program_ods10 <- renderUI({
    tags$div(img(src = "images/ods/10.png",
                 height="100", 
                 width="100"))
  })
  output$program_ods11 <- renderUI({
    tags$div(img(src = "images/ods/11.png",
                 height="100", 
                 width="100"))
  })
  output$program_ods12 <- renderUI({
    tags$div(img(src = "images/ods/12.png",
                 height="100", 
                 width="100"))
  })
  output$program_ods13 <- renderUI({
    tags$div(img(src = "images/ods/13.png",
                 height="100", 
                 width="100"))
  })
  output$program_ods14 <- renderUI({
    tags$div(img(src = "images/ods/14.png",
                 height="100", 
                 width="100"))
  })
  output$program_ods15 <- renderUI({
    tags$div(img(src = "images/ods/15.png",
                 height="100", 
                 width="100"))
  })
  output$program_ods16 <- renderUI({
    tags$div(img(src = "images/ods/16.png",
                 height="100", 
                 width="100"))
  })
  output$program_ods17 <- renderUI({
    tags$div(img(src = "images/ods/17.png",
                 height="100", 
                 width="100"))
  })
  
  #> ODS 1
  output$program_ods1x <- renderImage({
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

  # Program - ODS Modal Table -----------------------------------------------
  data_ods_table_modal_filtered <- eventReactive(input$modalOds, {
      prog %>%
      filter(`Nome do Programa` == input$selectProgram) %>%
      distinct(ODS) %>%
      left_join(ods, by = c("ODS" = "Objetivo")) %>%
      arrange(ODS)
      
  })
  
  output$ods_table_modal = renderDataTable({
    
    #> Não renderizar DataTable se nao houver Programa escolhido
    if (req(input$selectProgram != "Escolha aqui o Programa")){
      #> Renderizar tabela
      datatable(data_ods_table_modal_filtered())
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