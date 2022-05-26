# Function ----------------------------------------------------------------
programas <- function() {
  tagList(
    programas_sidebarPanel(),
    programas_mainPanel()
  )
}


# Subfunctions --------------------------------------------------------
programas_sidebarPanel <- function() {
  sidebarPanel(
    fileInput("file", "File input:"),
    textInput("txt", "Text input:", "general"),
    sliderInput("slider", "Slider input:", 1, 100, 30),
    tags$h5("Default actionButton:"),
    actionButton("action", "Search"),
    
    tags$h5("actionButton with CSS class:"),
    actionButton("action2", "Action button", class = "btn-primary")
  )
}

programas_mainPanel <- function() {
  mainPanel(
    tabsetPanel(
      tabPanel("Tab 1",
               h4("Table"),
               tableOutput("table"),
               h4("Verbatim text output"),
               verbatimTextOutput("txtout"),
               h1("Header 1"),
               h2("Header 2"),
               h3("Header 3"),
               h4("Header 4"),
               h5("Header 5")
      ),
      tabPanel("Tab 2", "This panel is intentionally left blank"),
      tabPanel("Tab 3", "This panel is intentionally left blank")
    )
  )
}
