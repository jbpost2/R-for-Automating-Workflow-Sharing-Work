library(shiny)
library(dplyr)
library(ggplot2)

shinyServer(function(input, output, session) {
  #get data for only order specified
  getData <- reactive({
		vores <- input$vore
    
  	newData <- msleep %>% filter(vore == vores)
  	newData
  })
  
  #create plot
  output$sleepPlot <- renderPlot({
    #get data
    sleepData <- getData()
    
    #base plotting object
    g <- ggplot(sleepData, aes(x = bodywt, y = sleep_total))
    
    if (input$conservation) {
    	g + geom_point(size = input$size, aes(col = conservation))
    } else {
    	g + geom_point(size = input$size)
    }
  })

  #create text info
  output$info <- renderText({
  	#get data
  	sleepData <- getData()
  	
  	#paste info out
  	paste("The average body weight for vore", input$vore, "is", round(mean(sleepData$bodywt, na.rm = TRUE), 2), "and the average total sleep time is", round(mean(sleepData$sleep_total, na.rm = TRUE), 2), sep = " ")
  	
  })
  
  #create output of observations    
  output$table <- renderTable({
  	#get data
    sleepData <- getData()
    sleepData
  })
  
})
