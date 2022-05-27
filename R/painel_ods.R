painel_ods <- function() {
  tagList(
    
# ODS Buttons -------------------------------------------------------------
    fluidRow(
      h2("Objetivos de Desenvolvimento Sustentável (ODS)"),
      p("Selecione um dos indicadores abaixo"),
      column(2,
          tags$button(
            id = "ods1_button",
            class = "1btn action-button",
            tags$img(src = "images/ods/1.png", height="50%", width="50%", onclick="smoothScroll(document.getElementById('ods_table'))")
            )
          ),
      column(2,
             tags$button(
               id = "ods2_button",
               class = "btn action-button",
               tags$img(src = "images/ods/2.png", height="50%", width="50%")
               ),
             ),
      column(2,
             tags$button(
               id = "ods3_button",
               class = "btn action-button",
               tags$img(src = "images/ods/3.png", height="50%", width="50%")
             ),
      ),
      column(2,
             tags$button(
               id = "ods4button",
               class = "btn action-button",
               tags$img(src = "images/ods/4.png", height="50%", width="50%")
             ),
      ),
      column(2,
             tags$button(
               id = "ods5_button",
               class = "btn action-button",
               tags$img(src = "images/ods/5.png", height="50%", width="50%")
             ),
      ),
      column(2,
             tags$button(
               id = "ods6_button",
               class = "btn action-button",
               tags$img(src = "images/ods/6.png", height="50%", width="50%")
             ),
      ),
      fluidRow(
        column(2,
               tags$button(
                 id = "ods7_button",
                 class = "btn action-button",
                 tags$img(src = "images/ods/7.png", height="50%", width="50%")
               )
        ),
        column(2,
               tags$button(
                 id = "ods8_button",
                 class = "btn action-button",
                 tags$img(src = "images/ods/8.png", height="50%", width="50%")
               ),
        ),
        column(2,
               tags$button(
                 id = "ods9_button",
                 class = "btn action-button",
                 tags$img(src = "images/ods/9.png", height="50%", width="50%")
               ),
        ),
        column(2,
               tags$button(
                 id = "ods10button",
                 class = "btn action-button",
                 tags$img(src = "images/ods/10.png", height="50%", width="50%")
               ),
        ),
        column(2,
               tags$button(
                 id = "ods11_button",
                 class = "btn action-button",
                 tags$img(src = "images/ods/11.png", height="50%", width="50%")
               ),
        ),
        column(2,
               tags$button(
                 id = "ods12_button",
                 class = "btn action-button",
                 tags$img(src = "images/ods/12.png", height="50%", width="50%")
               ),
        ),
      ),
      fluidRow(
        column(2,
               tags$button(
                 id = "ods14_button",
                 class = "btn action-button",
                 tags$img(src = "images/ods/14.png", height="50%", width="50%")
               ),
        ),
        column(2,
               tags$button(
                 id = "ods15button",
                 class = "btn action-button",
                 tags$img(src = "images/ods/15.png", height="50%", width="50%")
               ),
        ),
        column(2,
               tags$button(
                 id = "ods16_button",
                 class = "btn action-button",
                 tags$img(src = "images/ods/16.png", height="50%", width="50%")
               ),
        ),
        column(2,
               tags$button(
                 id = "ods17_button",
                 class = "btn action-button",
                 tags$img(src = "images/ods/17.png", height="50%", width="50%")
               ),
        ),
      )
    ),

# Table -------------------------------------------------------------------
    fluidRow(
      column(10, offset = 1,
        h2("Tabela com os indicadores do ODS"),
        tags$a(DT::dataTableOutput('ods'), value = "ods_table"),
        id = "ods_table", class = "ods_table"
      )
       
    )
  )
}