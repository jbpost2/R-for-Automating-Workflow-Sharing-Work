library(shiny)

shinyServer(function(input, output,session) {

  output$shotChart<-renderPlot({
    hist(rnorm(10))
  })
  
  output$summary<-renderTable({
    data.frame(x=rnorm(10),y=rnorm(10))
  })

})