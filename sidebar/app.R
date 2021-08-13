#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
ui <- fluidPage(

    fluidRow(h1("My title")),
    
    fluidRow(
        column(3, wellPanel("sidebar")),
        column(9, "other")
    )
    
)

# Define server logic required to draw a histogram
server <- function(input, output) {

  
}

# Run the application 
shinyApp(ui = ui, server = server)
