painel_ods <- function() {
  tagList(
    fluidRow(
      actionButton("goButton", "", icon = icon("play-circle")),
      tags$button(
        id = "reset_button",
        class="btn action-button",
        icon("close")
        
      ),
      tags$button(
        id = "web_button",
        class = "btn action-button",
        tags$img(src = "https://odsbrasil.gov.br/content/ods/3.png",
        )
      )
    ),
    fluidRow(
      textOutput("text")
    ),
    fluidRow(
      DT::dataTableOutput('ods')
    )
  )
}