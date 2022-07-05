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
      fluidRow(
        tags$p(tags$strong("Órgão resonsável pelo Programa: "), textOutput("textUnidadeName", inline = TRUE)),
        tags$p(tags$strong("Nome do Programa: "), textOutput("textProgramName", inline = TRUE)),
        tags$p(tags$strong("Orçamento do Programa: "), textOutput("textProgramOrcament", inline = TRUE)),
        tags$p(tags$strong("Objetivo do Programa: "), textOutput("textProgramObjective", inline = TRUE)),
        tags$p(tags$strong("Indicadores do Programa: "), textOutput("textProgramIndicators", inline = TRUE))#,
#        textOutput("textProgramODS")
      ),
      fluidRow(
        fluidRow(
          tags$p(tags$strong("Objetivos de Desenvolvimento Sustentável vinculados ao Programa: "))),
        fluidRow(
          actionButton("program_ods_indicators", "Abrir lista de indicadores dos ODS vinculados", class = "btn-succe1ss")),
        fluidRow(
          column(1, imageOutput("program_ods1")),
          column(1, conditionalPanel(condition = "!is.null(output.program_ods1)",imageOutput("program_ods2"))),
          column(1, imageOutput("program_ods3"))
        )
#        bsModal("modalOds", "Tabela com os indicadores do ODS vinculados ao Programa", "program_ods_indicators",
#                DT::dataTableOutput("ods_table_modal"),
#                size = "large")
 #       style = "height:200px"
      ),
      fluidRow(
        DT::dataTableOutput("table_acoes")
        )
    )
  )
}


#    fluidRow(
#      h2("Programas"),
#      p("Selecione um dos indicadores abaixo")
#    ),
#    fluidRow(
#      h2("Tabela com a lista dos Programas."),
#      tags$a(DT::dataTableOutput('prog'), value = "prog_table"),
#      id = "prog_table", class = "prog_table"
#    )
#  )

# Subfunctions --------------------------------------------------------
# programas_sidebarPanel <- function() {
#   sidebarPanel(
#     fileInput("file", "File input:"),
#     textInput("txt", "Text input:", "general"),
#     sliderInput("slider", "Slider input:", 1, 100, 30),
#     tags$h5("Default actionButton:"),
#     actionButton("action", "Search"),
#     
#     tags$h5("actionButton with CSS class:"),
#     actionButton("action2", "Action button", class = "btn-primary")
#   )
# }
# 
# programas_mainPanel <- function() {
#   mainPanel(
#     tabsetPanel(
#       tabPanel("Tab 1",
#                h4("Table"),
#                tableOutput("table"),
#                h4("Verbatim text output"),
#                verbatimTextOutput("txtout"),
#                h1("Header 1"),
#                h2("Header 2"),
#                h3("Header 3"),
#                h4("Header 4"),
#                h5("Header 5")
#       ),
#       tabPanel("Tab 2", "This panel is intentionally left blank"),
#       tabPanel("Tab 3", "This panel is intentionally left blank")
#     )
#   )
# }
