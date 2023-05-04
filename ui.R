ui <- function() {
  tagList(
    #> Include js script
    tags$head(
      tags$script(src="index.js"),
      tags$script(src="navAppend.js"),
      tags$link(rel = "stylesheet", type = "text/css", href = "styles.css"),
      tags$link(rel="stylesheet",
                href = "https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"
      )
    ),
    
    navbarPage(
    #  theme = bs_theme(bootswatch = "flatly"),
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
               painel_prog(prog),
               value = "programs_panel"
      ),
      
      # ODS Panel --------------------------------------------------------------
      tabPanel("ODS", 
               painel_ods(),
               value = "ods_panel"
      ),
      
      # About ------------------------------------------------------------
      tabPanel("Sobre",
               column(6, offset = 3,
                      includeMarkdown("R/about.md")),
               value = "about_panel"
      ),
      # Link Github -------------------------------------------------------------
      footer = div(class = "footer",
                      includeHTML("html/footer.html")
      )
      )
  )
}