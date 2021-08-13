## ----setup, echo = FALSE, message = FALSE, warning = FALSE----
library(shiny)
library(dplyr)
options(dplyr.print_min = 5)
library(knitr)
library(readr)
library(plotly)
library(DT)
opts_chunk$set(echo = FALSE)


## ----eruptions----------------------------------
inputPanel(
  selectInput("n_breaks", label = "Number of bins:",
              choices = c(10, 20, 35, 50), selected = 20),
  
  sliderInput("bw_adjust", label = "Bandwidth adjustment:",
              min = 0.2, max = 2, value = 1, step = 0.2)
)

renderPlot({
  hist(faithful$eruptions, probability = TRUE, breaks = as.numeric(input$n_breaks),
       xlab = "Duration (minutes)", main = "Geyser eruption duration")
  
  dens <- density(faithful$eruptions, adjust = input$bw_adjust)
  lines(dens, col = "blue")
})


## ---- echo = FALSE, fig.align='center', out.width="40%"----
knitr::include_graphics("shinyDoc.PNG")


## ---- out.width = "85%", fig.align='center'-----
knitr::include_graphics("widgets.PNG")


## ---- eval = FALSE, echo = TRUE-----------------
## library(shiny)
## numericInput("num", "Enter a Number", value = 0, min = 0, max = 100)
## sliderInput("slide", label = "A Slider!", min = 0, max = 1, value = 0.5, step = 0.05)


## ---- echo = FALSE------------------------------
numericInput("num", "Enter a Number", value = 0, min = 0, max = 100)
sliderInput("slide", label = "A Slider!", min = 0, max = 1, value = 0.5, step = 0.05)


## ---- out.width = "85%", fig.align='center'-----
knitr::include_graphics("tags.PNG")


## ---- eval = FALSE, echo = TRUE-----------------
## h2("First App title!")
## a("RStudio link", href = "https://www.RStudio.com")
## numericInput("num", "Enter a Number", value = 0, min = 0, max = 100)
## sliderInput("slide", label = "A Slider!", min = 0, max = 1, value = 0.5, step = 0.05)


## ---- echo = FALSE------------------------------
h2("First App title!")
a("RStudio link", href = "https://www.RStudio.com")
numericInput("num", "Enter a Number", value = 0, min = 0, max = 100)
sliderInput("slide", label = "A Slider!", min = 0, max = 1, value = 0.5, step = 0.05)


## ---- echo = TRUE, eval = FALSE-----------------
## h2("First App title!")
## 
## inputPanel(
##   a("RStudio link", href = "https://www.RStudio.com"),
##   numericInput("num", "Enter a Number", value = 0, min = 0, max = 100),
##   sliderInput("slide", label = "A Slider!", min = 0, max = 1, value = 0.5, step = 0.05)
## )


## ---- echo = FALSE------------------------------
h2("First App title!")

inputPanel(
  a("RStudio link", href = "https://www.RStudio.com"),
  numericInput("num", "Enter a Number", value = 0, min = 0, max = 100),
  sliderInput("slide", label = "A Slider!", min = 0, max = 1, value = 0.5, step = 0.05)
)


## ---- fig.align='center', out.width="60%"-------
knitr::include_graphics("render.PNG")


## ---- echo = TRUE, eval = FALSE-----------------
## inputPanel(
##   checkboxInput("addColor", "Color")
## )
## 
## renderPlot({
##   g <- ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width))
##   if(input$addColor){
##     g + geom_point(aes(color = Species))
##   } else {
##       g + geom_point()
##   }
## })


## ---- echo = FALSE, fig.width=5-----------------
inputPanel(
  checkboxInput("addColor", "Color")
)

renderPlot({
  g <- ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width)) 
  if(input$addColor){g + geom_point(aes(color = Species))} else {g + geom_point()}
})


## ---- eval = FALSE, echo = TRUE-----------------
##   hist(faithful$eruptions, probability = input$prob, breaks = as.numeric(input$n_breaks),
##        xlab = "Duration (minutes)", main = "Geyser eruption duration")
##   if(input$prob){
##     dens <- density(faithful$eruptions, adjust = input$bw_adjust)
##     lines(dens, col = "blue")
##   }


## ----basic-ui,eval=FALSE,echo=TRUE--------------
## library(shiny)
## 
## ui <- fluidPage(
## 	titlePanel(),
## 	
##   sidebarLayout(
##     sidebarPanel(#usually widgets
##       ),
##     mainPanel(#usually output
##       )
##   )
## )


## ----layout,echo=FALSE--------------------------
shinyUI(fluidPage(
  titlePanel("title panel"),

  sidebarLayout(
    sidebarPanel( "sidebar panel",br(),"|",
              br(),"|",br(),"|",br(),"|",br(),"|",br(),"|",br(),"V",br(),"Usually User Inputs"),
    mainPanel("main panel content-------------------->",br(),"|",
              br(),"|",br(),"|",br(),"|        Usually Output",br(),"|        that Reacts to User Input",br(),"|",br(),"V")
  )
))


## ----basic-server,eval=FALSE,echo=TRUE----------
## library(shiny)
## 
## shinyServer(function(input, output, session) {
## 
## })


## ----ui-syntax,echo=TRUE,eval=FALSE-------------
## library(shiny)
## ui <- fluidPage(
##   sidebarLayout(
##     sidebarPanel(
##       h2("Widgets/Text"),
##       numericInput("NI",label="Intercept",value=10),
##       sliderInput("SI",label="Slope",min=-1,max=1,value=0,step=0.1),
##       "More text",
##       br(),
##       a(href="http://www.rstudio.com",target="_blank","Link to RStudio")
##     ),
##     mainPanel(plotOutput("dataPlot"), #dataPlot is name of "plot" object in server
##               textOutput("dataInfo"), #dataInfo is name of "text" object in server
##               dataTableOutput("dataTable") #dataTable is name of "data" object in server
##     )
##   )
## )


## ----eval=TRUE,echo=FALSE,message=FALSE---------
library(shiny)
library(DT)
library(ggplot2)
shinyApp(
  ui <- fluidPage(
    sidebarLayout(
      sidebarPanel(
        h2("Widgets/Text"),
        numericInput("NI",label="Intercept",value=10),
        sliderInput("SI",label="Slope",min=-1,max=1,value=0,step=0.1),
        "More text",
        br(),
        a(href="http://www.rstudio.com",target="_blank","Link to RStudio")
      ),
      mainPanel(plotOutput("dataPlot"), #dataPlot is name of "plot" object in server
                h3(textOutput("dataInfo")), #dataInfo is name of "text" object in server
                dataTableOutput("dataTable") #dataTable is name of "data" object in server
      )
    )
  ),
  shinyServer(function(input, output,session) {
    
    dataSet<-reactive({
      #get inputs
      intercept<-input$NI
      slope<-input$SI
      
      x<-rnorm(100)
      y<-intercept+slope*x+rnorm(100)
      
      data.frame(y=y,x=x)
    })
    
    #create plot
    output$dataPlot<-renderPlot({
      data<-dataSet()
      
      fit<-lm(data$y~data$x)
      p<-ggplot(data=data,aes(x=data$x,y=data$y))+geom_point()+geom_smooth(method=lm)
      p
    })
    
    output$dataInfo<-renderText(paste0("The true intercept is ",input$NI,".  The true slope is ",input$SI,"."))
    
    output$dataTable<-renderDataTable(dataSet())
  })
)


## ----server-basics, eval=FALSE,echo=TRUE--------
## ## set up server
## shinyServer(function(input, output, session) {
##   # add stuff
## })


## ----server-basics2, eval=FALSE,echo=TRUE-------
## ## set up server
## shinyServer(function(input, output, session) {
##   # add stuff
## })


## ----server-syntax,echo=TRUE,eval=FALSE---------
## shinyServer(function(input,output){
##   output$nameOfOutputObject <- renderPlot(
##     #code that will return a plot
##   )
## 
##   output$otherOutput <- renderText(
##     #code that will return something that R can coerce to a string
##   )
## })
## 
## #in ui.r file, reference would look like
## plotOutput("nameOfOutputObject")
## textOutput("otherOutput")


## ----input-ref,echo=TRUE,eval=FALSE-------------
## input$inputId


## ----input-ref2,echo=TRUE,eval=FALSE------------
## input$inputId


## ----input-ref-ex,echo=TRUE,eval=FALSE----------
## #input widget code from ui.r file
## sliderInput(inputId = "slide",label = "Select the Range Here",min = 0,max = 1,
##             value = c(0,1))
## #reference in server.r might look like
## output$userPlot<-renderPlot({
##   range<-input$slide
##   #create plot that changes based on user input
##   plot(data,xlim=range)
## })


## ----naming,echo=TRUE,eval=FALSE----------------
## output$nameOfOutputObject <- renderPlot(...)


## ----naming2,echo=TRUE,eval=FALSE---------------
## output$nameOfOutputObject <- renderPlot(...)


## ----accessing,echo=TRUE,eval=FALSE-------------
## output$nameOfOutputObject <- renderPlot(
##    range <- input$slide
##    ...
## )


## ---- eval = FALSE, echo = TRUE-----------------
## if(input$radio == "eruptions"){
##   summary(faithful$eruptions)
## } else if(input$radio == "waiting"){
##   summary(faithful$waiting)
## } else if(input$radio == "both"){
##   summary(faithful)
## }


## ----reactivity,echo=TRUE,eval=FALSE------------
## 
## ##code chunk "reacts" to and re-evaluates if
## ##input$sampleSize or input$otherInput changes
## 
## output$dataPlot <- renderPlot({
## 
##   n <- input$sampleSize
##   input$otherInput #not used anywhere else, but entire
##                    #renderPlot chunk still re-evaluates
##                    #if changed
## 
##   hist(rbinom(n = 1, size = n, prob = 0.4))
## 
## })


## ----bad-reactivity,echo=TRUE,eval=FALSE--------
## shinyApp(ui <- fluidPage(
##                 numericInput("NI", "Give me a number", value = 10),
##                 textOutput("string")
##                 ),
## 
##          shinyServer(function(input, output){
##                 print(input$NI + 10)
##                 output$string <- renderText(paste("value plus 10 is", input$NI + 10))
##          }
## ))


## ----reactive,echo=TRUE,eval=FALSE--------------
## shinyServer(function(input,output){
##   #Creates a new reactive variable
##   newVar <- reactive({
##     val <- c(input$NI + 10, input$NI * 3)
##   })
## 
##   output$textString <- renderText({
##     value <- newVar()  #access like a function!
##     paste0("Input plus 10 is ", value[1], " and Input times 3 is ", value[2])
##   })
## 
##   output$otherString <- renderText({
##   	value <- newVar()
##   	paste0(value[1], ",", value[2])
##   })
## })


## ----reactiveValues,echo=TRUE,eval=FALSE--------
## shinyServer(function(input,output){
##   #Creates a new reactive values
##   vals <- reactiveValues(data = rnorm(150), sliderval = 0)
## 
##   observe({vals$sliderval <- input$slider})
## 
##   output$textString <- renderText({
##     paste0("The value is ", vals$sliderval)
##   })
## 
##   output$hist <- renderPlot({
##     hist(vals$data)
##   })
## })


## ----correct-reactivity,echo=TRUE,eval=FALSE----
## shinyServer(function(input,output){
##   #would now print to console
##   observe({print(input$NI+10)})
## 
## 	#update UI
## 	observe({
## 		input$noPitch
## 		updateCheckboxGroupInput(session, "pitchTypeChoice", selected = c(""))
## 	})
## })


## ----correct-reactivity2,echo=TRUE,eval=FALSE----
## shinyServer(function(input,output){
##   #would now print to console
##   observeEvent(input$NI, {print(input$data)})
## 
## 	#update UI
## 	observe({
## 		input$noPitch
## 		updateCheckboxGroupInput(session, "pitchTypeChoice", selected = c(""))
## 	})
## })


## ---- echo = TRUE-------------------------------
shinyServer(function(input,output){
  #would now print to console
  update <- eventReactive(input$submit, {list(gamma = input$gamma, alpha = input$alpha)})

	#update UI
	output$gammaDist <- renderText({
	  paste0("The parameters are ", update())
	})
})


## ----session,echo=TRUE,eval=FALSE---------------
## shinyServer(function(input, output, session) {
##   ##  do stuff
## })


## ----session2,echo=TRUE,eval=FALSE--------------
## shinyServer(function(input, output, session) {
##   ##  do stuff
## })


## ----update, echo = TRUE, eval = FALSE----------
## numericInput(inputId, label, value, min = NA, max = NA, step = NA,
##   width = NULL)
## 
## updateNumericInput(session, inputId, label = NULL, value = NULL,
##   min = NULL, max = NULL, step = NULL)


## ----update2, echo = TRUE, eval = FALSE---------
## numericInput(inputId, label, value, min = NA, max = NA, step = NA,
##   width = NULL)
## 
## updateNumericInput(session, inputId, label = NULL, value = NULL,
##   min = NULL, max = NULL, step = NULL)


## ----update-ftns, eval = TRUE, echo = FALSE-----
library(shiny)
shinyApp(
  # Define UI for application that draws a histogram
  ui <- fluidPage(
     # Application title
     titlePanel("Old Faithful Geyser Data"),
     # Sidebar with a slider input for number of bins 
     sidebarLayout(
        sidebarPanel(
           sliderInput("bins", 
                       "Number of bins:", 
                       min = 1, 
                       max = 50, 
                       value = 30), 
           numericInput("maxBins",label="Set Maximum Number of Bins", value = 50, min = 1, max = 100)
        ),
        # Show a plot of the generated distribution
        mainPanel(
           plotOutput("distPlot")
        )
     )
  ),
  # Define server logic required to draw a histogram
  server <- function(input, output, session) {
     output$distPlot <- renderPlot({
        # generate bins based on input$bins from ui.R
        x    <- faithful[, 2] 
        bins <- seq(min(x), max(x), length.out = input$bins + 1)
        
        # draw the histogram with the specified number of bins
        hist(x, breaks = bins, col = 'darkgray', border = 'white')
     })
     
     observe({updateSliderInput(session,"bins",max=input$maxBins)})
  }
)


## ----updateslider,eval=FALSE,echo=TRUE----------
##   ui <- fluidPage(
##         ...
##         sidebarPanel(
##            sliderInput("bins", "Number of bins:",
##                        min = 1, max = 50, value = 30),
##            numericInput("maxBins", label = "Set Maximum Number of Bins",
##                         value = 50, min = 1, max = 100)
##         ),
##         ...
##   ),
##   server <- function(input, output, session) {
##       ...
##       updateSliderInput(session, "bins", max = input$maxBins)
##   }
## )


## ----updateslider2,eval=FALSE,echo=TRUE---------
##   ui <- fluidPage(
##         ...
##         sidebarPanel(
##            sliderInput("bins", "Number of bins:",
##                        min = 1, max = 50, value = 30),
##            numericInput("maxBins", label = "Set Maximum Number of Bins",
##                         value = 50, min = 1, max = 100)
##         ),
##         ...
##   )
##   server <- function(input, output, session) {
##       ...
##       observe({updateSliderInput(session, "bins", max = input$maxBins)})
##   }


## ----html,echo=TRUE,eval=TRUE-------------------
print(fluidPage(titlePanel(title = "Hi"),
                sidebarLayout(sidebarPanel(), mainPanel())))


## ----html2,echo=TRUE,eval=TRUE------------------
print(numericInput("id", "Label User Sees", value = 10))


## ----renderui-widget,eval=FALSE,echo=TRUE-------
##   ui <- fluidPage(
##         ...
##         sidebarPanel(
##             uiOutput("slider"),
##             numericInput("maxBins", label = "Set Maximum Number of Bins",
##                          value = 50, min = 1, max = 100)
##         ),
##         ...
##   ),
##   server <- function(input, output, session) {
##       ...
##       output$slider <- renderUI({
##           sliderInput("bins", "Number of bins:", min = 1,
##                       max = input$maxBins, value = 30)
##       })
##   }


## ----renderui-info,eval=FALSE,echo=TRUE---------
##   ui <- fluidPage(
##         ...
##         sidebarPanel(
##              uiOutput("info"),
##              numericInput("purchase", label = "How Many?",
##                           value = 50, min = 0, max = 100)
##         ),
##         ...
##   ),
##   server <- function(input, output, session) {
##       ...
##         output$info <- renderUI({
##           text <- paste0("You have selected to buy ", input$purchase)
##           h3(text)
##         })
##   }


## ----renderui-ex,eval=TRUE,echo=FALSE-----------
library(shiny)

shinyApp(
  # Define UI for application that draws a histogram
  shinyUI(fluidPage(
    
    # Application title
    titlePanel("Graph is Meaningless Here!"),
    
    # Sidebar 
    sidebarLayout(
      sidebarPanel(
         uiOutput("info"),
         numericInput("purchase",label="How Many?",
                      value=50,min=0,max=100)
      ),
      
      # Show a plot of the generated distribution
      mainPanel(
         plotOutput("distPlot")
      )
    )
  )),
  shinyServer(function(input, output,session) {
   
    output$distPlot <- renderPlot({
  
      # draw the histogram with the specified number of bins
      hist(rnorm(input$purchase), col = 'darkgray', border = 'white')
      
    })
    
    output$info<-renderUI({
      text<-paste0("You have selected to buy ",input$purchase)
      h3(text)
    })

  })
)


## ----cond-panel-ex,echo=FALSE,eval=TRUE,message=FALSE----
library(shiny)
library(ggplot2)
library(dplyr)
data2<-filter(diamonds,(diamonds$depth>55)&(diamonds$depth<70))
shinyApp(
  # Define UI for application that draws a histogram
  shinyUI(fluidPage(
    
    # Application title
    titlePanel("Plots of Diamonds Data"),
    
    # Sidebar with a slider input for number of bins 
    sidebarLayout(
      sidebarPanel(
        selectInput("plotType", "Plot Type",
                    c(Scatter = "scatter",Histogram = "hist")),
        
        # Only show this panel if the plot type is a histogram
        conditionalPanel(condition = "input.plotType == 'hist'",
                         selectInput("breaks", "Breaks",
                                     c("Sturges","Scott","Freedman-Diaconis","[Custom]" = "custom")),
                         
           # Only show this panel if Custom is selected
          conditionalPanel(
            condition = "input.breaks == 'custom'",
            sliderInput("breakCount", "Break Count", min=1, max=200, value=40)
          )
        )
      ),
      
      # Show a plot of the generated distribution
      mainPanel(
         plotOutput("distPlot")
      )
    )
  )),
  # Define server logic required to draw a histogram
  shinyServer(function(input, output,session) {
     
    output$distPlot <- renderPlot({
  
      #depending on plot type create hist or scatterplot
      if(input$plotType=="scatter"){
        plot(x=data2$carat,y=data2$depth,xlab="Carat",ylab="Depth")
      } else {
        if(input$breaks=="custom"){
          hist(data2$depth,breaks=input$breakCount)
        } else {
          hist(data2$depth,breaks=input$breaks,xlab="Depth")
        }
      }
  
    })
    
  })
)


## ----cond-panel-syntax,echo=TRUE,eval=FALSE-----
## ...
## sidebarPanel(
##   selectInput("plotType", "Plot Type",
##             c(Scatter = "scatter", Histogram = "hist")),
## 
##   # Only show this panel if the plot type is a histogram
##   conditionalPanel(condition = "input.plotType == 'hist'",
##           selectInput("breaks", "Breaks",
##                c("Sturges", "Scott", "Freedman-Diaconis", "[Custom]" = "custom")),
## 
##       # Secondary conditonalPanel, Only show this panel if Custom is selected
##       conditionalPanel(
##           condition = "input.breaks == 'custom'",
##           sliderInput("breakCount", "Break Count", min = 1, max = 200, value = 40)
##       )
##   )
## )


## ----custom-layout,eval=TRUE,echo=FALSE---------
shinyUI(fluidPage(
  fluidRow(
    column(2,"fluidRow with columns-----------------------------------------------------------------------"),
    column(6,"2nd column------------------------------------------------------------------------------------------------------------------------"),
    column(4,"column widths in a given row should add to 12-------------------------------------------------------------")),
  fluidRow(tags$hr()),
  fluidRow(
    column(6,"2nd fluidRow below above row--------------------------------------------------------------------------------------------"),
    column(6,
           fluidRow("Columns can contain their own fluidRow as well, allowing for a lot of customization of layouts!"),
           fluidRow(
             column(3,"subcol --------------------------------------------"),
             column(9,"subcol ----------------------------------------------------------------------------------------------------------------")
           ))
  )
))


## ----custom-layout2,eval=FALSE,echo=TRUE--------
## shinyUI(fluidPage(
##   fluidRow(
##     column(2,"fluidRow with columns--------...---------"),
##     column(6,"2nd column------------...--------"),
##     column(4,"column widths in a given row must add to 12------...---------")),
##   fluidRow(tags$hr()),
##   fluidRow(
##     column(6,"2nd fluidRow below above row----...-----"),
##     column(6,
##            fluidRow("Columns can contain their own fluidRow as well, allowing for a lot of customization of layouts!"),
##            fluidRow(
##              column(3,"subcol ----...-----"),
##              column(9,"subcol ----...-----")
##            ))
##   )
## ))


## ----common-code,eval=FALSE,echo=TRUE-----------
## ## Code here that you only need to evaluate once.
## ## This can include reading in data, creation of
## ##      functions common to all sessions, and
## ##      reading of other common r scripts.
## 
## shinyServer(function(input, output) {
## 
## ## Code here that can be reactive.  Differs for
## ##      every instance of your app that runs.
## 
## })


## ----include-files, eval=F,echo=TRUE------------
## ##  top of server.R, output from here is common to all users
## 
## #data set only read in once
## dat <- read_csv("dataset.csv")
## 
## #function created and not modified
## helper <- function(item1, item2) {item1 + item2}
## 
## shinyServer(function(input, output) {
##   ## reactive things, instance of app dependent
## })


## ----source, eval=F,echo=TRUE-------------------
## ##  top of server.R
## source("helpers.R")
## 
## shinyServer(function(input, output) {
##   ##  do stuff
## })


## ----isolate,echo=TRUE,eval=FALSE---------------
## renderPlot({
##          input$submit  # Do take a dependency on input$submit
##          hist(data, breaks = isolate(input$slider)) #don't depend on slider
## })


## ---- echo = TRUE, eval = FALSE-----------------
## data <- reactive({
##   req("input$dist")
##   if(input$dist == "norm"){
##     dataVals <- rnorm(100)
##   } else if (input$dist == "unif"){
##     dataVals <- runif(100)
##   }
## })
## 
## output$plot <- renderPlot({
##   hist(data())
## })


## ----echo=TRUE,eval=FALSE-----------------------
## shinyServer(function(input,output){
## 
##   #would now print to console
##   observe({print(input$NI + 10)})
## 
## }


## ----echo=TRUE,eval=FALSE-----------------------
## options(shiny.error = browser)

