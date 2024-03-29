painel_ods <- function() {
  tagList(
    
# ODS Buttons -------------------------------------------------------------
    fluidRow(
      h2("Indicadores Brasileiros para os Objetivos de Desenvolvimento Sustentável", style = "text-align: center;"),
      p("Selecione um dos indicadores abaixo", style = "text-align: center;")
    ),
    fluidRow(
      fluidRow(
        column(2,
            tags$button(
              id = "ods1_button",
              class = "btn action-button",
              tags$img(src = "images/ods/1.png", height="50%", width="50%"),
              onclick="setTimeout(() => {smoothScroll(document.getElementById('ods_table'));}, 500);"
              )
            ),
        column(2,
               tags$button(
                 id = "ods2_button",
                 class = "btn action-button",
                 tags$img(src = "images/ods/2.png", height="50%", width="50%"),
                 onclick="setTimeout(() => {smoothScroll(document.getElementById('ods_table'));}, 500);"
                 ),
               ),
        column(2,
               tags$button(
                 id = "ods3_button",
                 class = "btn action-button",
                 tags$img(src = "images/ods/3.png", height="50%", width="50%"),
                 onclick="setTimeout(() => {smoothScroll(document.getElementById('ods_table'));}, 500);"
               ),
        ),
        column(2,
               tags$button(
                 id = "ods4_button",
                 class = "btn action-button",
                 tags$img(src = "images/ods/4.png", height="50%", width="50%"),
                 onclick="setTimeout(() => {smoothScroll(document.getElementById('ods_table'));}, 500);"
               ),
        ),
        column(2,
               tags$button(
                 id = "ods5_button",
                 class = "btn action-button",
                 tags$img(src = "images/ods/5.png", height="50%", width="50%"),
                 onclick="setTimeout(() => {smoothScroll(document.getElementById('ods_table'));}, 500);"
               ),
        ),
        column(2,
               tags$button(
                 id = "ods6_button",
                 class = "btn action-button",
                 tags$img(src = "images/ods/6.png", height="50%", width="50%"),
                 onclick="setTimeout(() => {smoothScroll(document.getElementById('ods_table'));}, 500);"
               )
        )
      ),
      fluidRow(
        column(2,
               tags$button(
                 id = "ods7_button",
                 class = "btn action-button",
                 tags$img(src = "images/ods/7.png", height="50%", width="50%"),
                 onclick="setTimeout(() => {smoothScroll(document.getElementById('ods_table'));}, 500);"
               )
        ),
        column(2,
               tags$button(
                 id = "ods8_button",
                 class = "btn action-button",
                 tags$img(src = "images/ods/8.png", height="50%", width="50%"),
                 onclick="setTimeout(() => {smoothScroll(document.getElementById('ods_table'));}, 500);"
               ),
        ),
        column(2,
               tags$button(
                 id = "ods9_button",
                 class = "btn action-button",
                 tags$img(src = "images/ods/9.png", height="50%", width="50%"),
                 onclick="setTimeout(() => {smoothScroll(document.getElementById('ods_table'));}, 500);"
               ),
        ),
        column(2,
               tags$button(
                 id = "ods10_button",
                 class = "btn action-button",
                 tags$img(src = "images/ods/10.png", height="50%", width="50%"),
                 onclick="setTimeout(() => {smoothScroll(document.getElementById('ods_table'));}, 500);"
               ),
        ),
        column(2,
               tags$button(
                 id = "ods11_button",
                 class = "btn action-button",
                 tags$img(src = "images/ods/11.png", height="50%", width="50%"),
                 onclick="setTimeout(() => {smoothScroll(document.getElementById('ods_table'));}, 500);"
               ),
        ),
        column(2,
               tags$button(
                 id = "ods12_button",
                 class = "btn action-button",
                 tags$img(src = "images/ods/12.png", height="50%", width="50%"),
                 onclick="setTimeout(() => {smoothScroll(document.getElementById('ods_table'));}, 500);"
               ),
        ),
      ),
      fluidRow(
        column(2,
               tags$button(
                 id = "ods13_button",
                 class = "btn action-button",
                 tags$img(src = "images/ods/13.png", height="50%", width="50%"),
                 onclick="setTimeout(() => {smoothScroll(document.getElementById('ods_table'));}, 500);"
               ),
        ),
        column(2,
               tags$button(
                 id = "ods14_button",
                 class = "btn action-button",
                 tags$img(src = "images/ods/14.png", height="50%", width="50%"),
                 onclick="setTimeout(() => {smoothScroll(document.getElementById('ods_table'));}, 500);"
               ),
        ),
        column(2,
               tags$button(
                 id = "ods15_button",
                 class = "btn action-button",
                 tags$img(src = "images/ods/15.png", height="50%", width="50%"),
                 onclick="setTimeout(() => {smoothScroll(document.getElementById('ods_table'));}, 500);"
               ),
        ),
        column(2,
               tags$button(
                 id = "ods16_button",
                 class = "btn action-button",
                 tags$img(src = "images/ods/16.png", height="50%", width="50%"),
                 onclick="setTimeout(() => {smoothScroll(document.getElementById('ods_table'));}, 500);"
               ),
        ),
        column(2,
               tags$button(
                 id = "ods17_button",
                 class = "btn action-button",
                 tags$img(src = "images/ods/17.png", height="50%", width="50%"),
                 onclick="setTimeout(() => {smoothScroll(document.getElementById('ods_table'));}, 500);"
                 ),
               ),
        column(2,
               tags$button(
                 id = "odsGeral_button",
                 class = "btn action-button",
                 tags$img(src = "images/ods/quadro-indicadores2.png", height="50%", width="50%"),
                 onclick="setTimeout(() => {smoothScroll(document.getElementById('ods_table'));}, 500);"
                 )
               ),
        )
    ),

# Table -------------------------------------------------------------------
    fluidRow(
      hr(),
      column(10, offset = 1,
        h2("Tabela com os indicadores do ODS"),
        tags$a(DT::dataTableOutput('ods'), value = "ods_table"),
        id = "ods_table", class = "ods_table"
      )
    )
  )
}