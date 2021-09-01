#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(

    # Application title
    titlePanel("Old Faithful Geyser Data"),

    # Sidebar with a slider input for number of bins
    sidebarLayout(
        sidebarPanel(
            a(href = "https://www.yellowstonepark.com/things-to-do/geysers-hot-springs/about-old-faithful/", "Old Faithful Info Page", target = "_blank"),
            sliderInput("bins",
                        "Number of bins:",
                        min = 1,
                        max = 50,
                        value = 30),
            radioButtons("radio", "Summaries of Data", choices = c("none", "eruptions", "waiting", "both"), selected = "none"),
            numericInput("ni", label = "Number to square", value = 0),
            actionButton("press", label = "Print to console")
        ),

        # Show a plot of the generated distribution
        mainPanel(
            plotOutput("distPlot"),
            textOutput("myText"),
            verbatimTextOutput("mySummary")
        )
    )
    
))
