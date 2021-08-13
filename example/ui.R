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
            a("Link to site", href = "https://www.yellowstonepark.com/things-to-do/geysers-hot-springs/about-old-faithful/"),
            sliderInput("bins",
                        "Number of bins:",
                        min = 1,
                        max = 50,
                        value = 30),
            radioButtons("summary", label = "Summarize", choices = c("none", "eruptions", "waiting", "both"), selected = "none"),
            numericInput("number", "What number?", value = 0),
            actionButton("press", label = "Print to console")
        ),

        # Show a plot of the generated distribution
        mainPanel(
            plotOutput("distPlot"),
            textOutput("sliderval"),
            verbatimTextOutput("sum")
        )
    )
))
