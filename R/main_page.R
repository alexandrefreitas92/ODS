main_page <- function() {
  "Aqui vai ter as imagens para escolher para qual painel a pessoa quer ir."
  fluidRow(
    column(4, offset = 1,
           tags$button(
             id = "ods5_button",
             class = "btn action-button",
             tags$img(src = "images/ods/logo_gov_mg.png", height="50%", width="50%")
           ),
           tags$a(tags$img(src = "images/logo_gov_mg.png", onclick="customHref('programs_panel')",
                           height="80%", width="80%")),
           actionButton("ir_tab_programs", 'Vá para a taba dos Programas', position = "center")
           
    ),
    column(4, offset = 1,
      tags$a(tags$img(src = "images/ods/logo_ods.png", onclick="customHref('ods_panel')")),
      actionButton("ir_tab_ods", 'Vá para a taba ODS')
           ),

  )
}