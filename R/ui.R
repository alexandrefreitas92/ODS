ui <- function() {
  tagList(
    navbarPage(
      #> Title
      "ODS - MG",
      
      # Main Page ----------------------------------------------------------
      tabPanel("Página Inicial", 
               main_page()
      ),
      # Panel with Public policy programs -------------------------------------------------
      tabPanel("Programas",
               programas()
      ),
      
      # ODS Panel --------------------------------------------------------------
      tabPanel("ODS", 
               painel_ods()
      ),
      
      # About ------------------------------------------------------------
      tabPanel("Sobre",
               about()
      ),
      # Link Github -------------------------------------------------------------
      tabPanel("GitHub",
               github_link()
      )
    )
  )
}