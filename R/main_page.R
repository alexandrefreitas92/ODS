main_page <- function() {
  "Aqui vai ter as imagens para escolher para qual painel a pessoa quer ir."
  fluidRow(
    column(4, offset = 1,
           tags$a(tags$img(src = "images/logo_gov_mg.png", onclick="customHref('programs_panel')",
                           height="80%", width="80%")),
           actionButton("ir_tab_programs", 'Vá para a aba dos Programas')
           
    ),
    column(4, offset = 1,
           tags$a(tags$img(src = "images/ods/logo_ods.png", onclick="customHref('ods_panel')")),
           actionButton("ir_tab_ods", 'Vá para a aba ODS')
           ),
    )
}