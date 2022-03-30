# 05-actionButton

library(shiny)

ui <- fluidPage(
  actionButton(inputId = "clicks", 
               label = "Click me"),
  textOutput("txt")
)

server <- function(input, output) {
  observeEvent(input$clicks, {
    print(as.numeric(input$clicks))
  })
  output$txt <- renderText({
    paste0("Click # = ", input$clicks)
  })
}

shinyApp(ui = ui, server = server)
