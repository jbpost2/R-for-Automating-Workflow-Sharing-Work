#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {

    
    square <- reactive({input$number^2})
    
    output$distPlot <- renderPlot({

        # generate bins based on input$bins from ui.R
        x    <- faithful[, 2]
        bins <- seq(min(x), max(x), length.out = input$bins + 1)

        # draw the histogram with the specified number of bins
        hist(x, breaks = bins, col = 'darkgray', border = 'white')

    })
    
    output$sliderval <- renderText({paste("Bins:", input$bins, "The square is ", square())})
    
    observeEvent(input$press, {print(square())})
    
    output$sum <- renderPrint({
        if(input$summary == "eruptions"){
            summary(faithful$eruptions)
        } else if(input$summary == "waiting"){
            summary(faithful$waiting)
        } else if(input$summary == "both"){
            summary(faithful)
        }
    })

})
