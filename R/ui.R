ui <- function() {
  tagList(
    #> Include js script
    tags$head(
      tags$script(src="index.js")
    ),
    
    navbarPage(
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
               programas(),
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
      tabPanel("GitHub",
               github_link(),
               value = 'github_panel'
      )
    )
  )
}