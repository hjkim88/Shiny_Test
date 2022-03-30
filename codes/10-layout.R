# 10-layout.R
### column(n), width	The grid width of the column (must be between 1 and 12)

library(shiny)

ui <- fluidPage(
  fluidRow(
    column(3),
    column(5, sliderInput(inputId = "num", 
                          label = "Choose a number", 
                          value = 25, min = 1, max = 100))
  ),
  fluidRow(
    column(4, offset = 8,
           plotOutput("hist")
    )
  )
)

server <- function(input, output) {
  output$hist <- renderPlot({
    hist(rnorm(input$num))
  })
}

shinyApp(ui = ui, server = server)
