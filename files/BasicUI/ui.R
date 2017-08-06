###########################################################################
##R Shiny App to plot basketball data
##Justin Post
###########################################################################

#Load package
library(shiny)
PlayerNames<-read.csv("PlayerNames.csv",header=TRUE)[,2]

ui<-fluidPage(
  
  # Application title
  titlePanel(),
  
  # Sidebar with options for the data set
  sidebarLayout(
    sidebarPanel(
    ),
    
    # Show plots
    mainPanel(
    )
  )
)
