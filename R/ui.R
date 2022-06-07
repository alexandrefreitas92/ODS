ui <- function() {
  tagList(
    #> Include js script
    tags$head(
      tags$script(src="index.js"),
      tags$script(src="navAppend.js")
    ),
    
    navbarPage(
      theme = bs_theme(bootswatch = "flatly"),
      #> Title
      "ODS - MG",
      id = "inTabset",
      
      # Main Page ----------------------------------------------------------
      tabPanel("Página Inicial", 
               main_page(),
               value = "main_page"
      ),
      
      # Panel with Public policy programs -------------------------------------------------
      tabPanel("Programas",
               painel_prog(),
               value = "programs_panel"
      ),
      
      # ODS Panel --------------------------------------------------------------
      tabPanel("ODS", 
               painel_ods(),
               value = "ods_panel"
      ),
      
      # About ------------------------------------------------------------
      tabPanel("Sobre",
               about(),
               value = "about_panel"
      ),
      # Link Github -------------------------------------------------------------
      tabPanel(
               "Github",
               #tags$a(onclick="window.open('http://www.google.com', '_blank')", icon = icon("fab fa-github"), "GitHub"),
               github_link(),
               value = 'github_panel'
      )
    )
  )
}