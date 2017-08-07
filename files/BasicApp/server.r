library(shiny)
library(dplyr)
library(ggplot2)

shinyServer(function(input, output, session) {
  
  #create plot
  output$sleepPlot <- renderPlot({
		#Temporary plot
  	hist(rnorm(100))
  })

  #create text info
  output$info <- renderText({
  	paste("Temporary text")
  })
  
  #create output of observations    
  output$table <- renderTable({
		rnorm(10)
  })
  
})
