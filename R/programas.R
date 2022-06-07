# Function ----------------------------------------------------------------
painel_prog <- function() {
  tagList(
    sidebarPanel(
      # Create a select list
      selectInput(inputId = "name", 
                  label = "Name",
                  choices = prog$ODS
      )
    ),
    mainPanel(
      textOutput("name")
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
