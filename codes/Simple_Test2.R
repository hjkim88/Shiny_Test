library(shiny)

ui <- fluidPage(
  sliderInput(inputId = "number", 
              label = "Choose a number", 
              value = 25, min = 1, max = 100),
  textOutput("inst"),
  plotOutput("hist"),
  plotOutput("dots")
)

server <- function(input, output) {
  output$inst <- renderText({
    "Histogram and Barplot"
  })
  output$hist <- renderPlot({
    random_nums <- rnorm(input$number)
    hist(random_nums)
  })
  output$dots <- renderPlot({
    random_nums <- rnorm(input$number)
    plot(random_nums)
  })
}

shinyApp(ui = ui, server = server)
