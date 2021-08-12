library(shiny)
library(dplyr)
library(ggplot2)

shinyServer(function(input, output, session) {
  
  newData <- reactive({
    msleep %>% filter(vore == input$si)
  })
  
  #create plot
  output$sleepPlot <- renderPlot({
    data <- newData()
    
    g <- ggplot(data, aes(x = bodywt, y = sleep_total))
    
    if(input$cb) {
      if(input$cb2){
        g + geom_point(size = input$slider, aes(col = conservation, shape = order))
      } else {
        g + geom_point(size = input$slider, aes(col = conservation))
      }
      
    } else {
      g + geom_point(size = input$slider)
    }
  })

  #create text info
  output$info <- renderText({
    data <- newData()
    
    paste("The average body weight for order", input$si, "is", round(mean(data$bodywt, na.rm = TRUE), 2), "and the average total sleep time is", round(mean(data$sleep_total, na.rm = TRUE), 2), sep = " ")
  })
  
  #create output of observations    
  output$table <- renderTable({
		newData()
  })
  
  observe({
    input$cb
    updateCheckboxInput(session, "cb2", value = FALSE)
  })
})
