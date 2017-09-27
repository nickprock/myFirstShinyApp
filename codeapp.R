library(shiny)
ui <- fluidPage(
  headerPanel("My First Shiny App"),
  sidebarPanel(
  sliderInput(inputId = "num", label = "scegli un numero", min = 1, max = 100, value = 25),
  img(src = "https://www.rstudio.com/wp-content/uploads/2014/04/shiny.png", height = 164, width = 141),
  br(),
  h2("Installation"),
  p("Shiny is available on CRAN, so you can install it in the usual way from your R console:"),
  code('install.packages("shiny")'),
  br(),
  img(src = "https://www.rstudio.com/wp-content/uploads/2016/09/RStudio-Logo-Blue-Gray-125.png", height = 44, width = 125),
  br(),
  "Shiny is a product of ", 
  helpText(a("RStudio", href = "www.rstudio.com", target = "blank")),
  "Follow me on ",
  helpText(a("GitHub", href = "https://github.com/YOURNICKNAME", target = "blank"))
  ),
  mainPanel(plotOutput("hist"))
)
server <- function(input, output){
  output$hist <- renderPlot({
    title <- paste0(input$num," random normal values")
    hist(rnorm(input$num), main = title, xlab = "values", col = "lightblue", border = "white")
  })
}

shinyApp(ui = ui, server = server)