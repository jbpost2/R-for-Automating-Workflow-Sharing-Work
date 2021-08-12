library(ggplot2)

shinyUI(fluidPage(
  
  # Application title
  titlePanel(h1("Investigation of Mammal Sleep Data")),
  
  # Sidebar with options for the data set
  sidebarLayout(
    sidebarPanel(
      h2("Select the mammal's biological order:"),
      selectizeInput("si", "Vore", choices = list("carni", "herbi", "insecti", "omni"), selected = "omni"), 
      sliderInput("slider", "Size of Points on Graph", min = 1, max = 10, value = 5),
      checkboxInput("cb", h3("Color Code Conservation Status", style = "color: red;")),
      conditionalPanel("input.cb", 
                       checkboxInput("cb2", "Also change shape based on order?")
      )
    ),
    
    # Outputs  
    mainPanel(
      plotOutput("sleepPlot"),
      textOutput("info"),
      tableOutput("table")
      )
  )
))
