main_page <- function() {
  "Aqui vai ter as imagens para escolher para qual painel a pessoa quer ir."
  fluidRow(
    column(width = 12,
           br(), br(), br(), br(),
           wellPanel(
             div(HTML("<h1><b>Painel de Monitoramento dos ODS em Minas Gerais</b></h1>")),
             br(),
             div(HTML("<h4>Iniciativa da Fundação João Pinheiro (FJP) e da Secretaria de Estado de Planejamento e Gestão 
                      (SEPLAG) para monitorar a vinculação da agenda governamental do Governo do Estado de Minas Gerais 
                      à Agenda 2030.</h4>")),
             style = "text-align: center;"
             )
    ),
    column(width = 3, offset = 3, align = "center",
           tab_voronoys(texto = "Programas de Governo", cor = "#abb8c3", icon = "mg.png", id = "ir_tab_programs")
    ),
    column(width = 3, align = "center",
           tab_voronoys(texto = "ODS", cor = "#E2DFD2", icon = "ods_icon2.png", id = "ir_tab_ods")
    )
  )
}

##9b51e0