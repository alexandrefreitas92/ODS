# Function ----------------------------------------------------------------
painel_prog <- function(df_programas) {
  tagList(
    sidebarPanel(
      h2("Filtre a informação desejada"),
      # Create a select list
      selectInput(inputId = "selectOrgao", 
                  label = "Lista dos Órgãos",
                  choices = c("Escolha aqui o Órgão", sort(unique(df_programas$`Órgão Responsável pelo Programa`)))
      ),
      selectInput(inputId = "selectProgram", 
                  label = "Lista dos Programas",
                  choices = c("Escolha aqui o Programa", sort(unique(df_programas$`Nome do Programa`)))
      )
    ),
    mainPanel(
        tags$p(tags$strong("Órgão resonsável pelo Programa: "), textOutput("textUnidadeName", inline = TRUE)),
        tags$p(tags$strong("Nome do Programa: "), textOutput("textProgramName", inline = TRUE)),
        tags$p(tags$strong("Orçamento do Programa (2023): "), textOutput("textProgramOrcament", inline = TRUE)),
        tags$p(tags$strong("Objetivo Estratégico do Programa: "), textOutput("textProgramObjectiveEstrategic", inline = TRUE)),
        tags$p(tags$strong("Objetivo do Programa: "), textOutput("textProgramObjective", inline = TRUE)),
        tags$p(tags$strong("Indicadores do Programa: "), textOutput("textProgramIndicators", inline = TRUE)),
        tags$p(tags$strong("Objetivos de Desenvolvimento Sustentável vinculados ao Programa: ")),
        actionButton("program_ods_indicators", "Abrir lista de indicadores dos ODS vinculados", class = "btn-succe1ss"),
        bsModal("modalOds", "Tabela com os indicadores do ODS vinculados ao Programa", "program_ods_indicators",
                DT::dataTableOutput("ods_table_modal"),
                size = "large"),
        hr(),
        conditionalPanel(condition = "output.test_ods1 == 'TRUE'", column(1, uiOutput("program_ods1"))),
        conditionalPanel(condition = "output.test_ods2 == 'TRUE'", column(1, uiOutput("program_ods2"))),
        conditionalPanel(condition = "output.test_ods3 == 'TRUE'", column(1, uiOutput("program_ods3"))),
        conditionalPanel(condition = "output.test_ods4 == 'TRUE'", column(1, uiOutput("program_ods4"))),
        conditionalPanel(condition = "output.test_ods5 == 'TRUE'", column(1, uiOutput("program_ods5"))),
        conditionalPanel(condition = "output.test_ods6 == 'TRUE'", column(1, uiOutput("program_ods6"))),
        conditionalPanel(condition = "output.test_ods7 == 'TRUE'", column(1, uiOutput("program_ods7"))),
        conditionalPanel(condition = "output.test_ods8 == 'TRUE'", column(1, uiOutput("program_ods8"))),
        conditionalPanel(condition = "output.test_ods9 == 'TRUE'", column(1, uiOutput("program_ods9"))),
        conditionalPanel(condition = "output.test_ods10 == 'TRUE'", column(1, uiOutput("program_ods10"))),
        conditionalPanel(condition = "output.test_ods11 == 'TRUE'", column(1, uiOutput("program_ods11"))),
        conditionalPanel(condition = "output.test_ods12 == 'TRUE'", column(1, uiOutput("program_ods12"))),
        conditionalPanel(condition = "output.test_ods13 == 'TRUE'", column(1, uiOutput("program_ods13"))),
        conditionalPanel(condition = "output.test_ods14 == 'TRUE'", column(1, uiOutput("program_ods14"))),
        conditionalPanel(condition = "output.test_ods15 == 'TRUE'", column(1, uiOutput("program_ods15"))),
        conditionalPanel(condition = "output.test_ods16 == 'TRUE'", column(1, uiOutput("program_ods16"))),
        conditionalPanel(condition = "output.test_ods17 == 'TRUE'", column(1, uiOutput("program_ods17"))),
        DT::dataTableOutput("table_acoes")
    )
  )

}