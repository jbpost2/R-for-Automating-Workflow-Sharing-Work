## ----setup, echo = FALSE, message = FALSE, warning = FALSE----
library(tidyverse)
library(haven)
options(dplyr.print_min = 5)
options(tibble.print_min = 5)
library(knitr)
library(htmlwidgets)
opts_chunk$set(message = FALSE, cache = TRUE, warning = FALSE)


## ----project.png, out.width = "600px",echo=FALSE, fig.align = 'center'----
knitr::include_graphics("../img/project.png")


## ----startMD.png, out.width = "700px",echo=FALSE, fig.align='center'----
knitr::include_graphics("../img/startMD.png")


## ----chunk_png, out.width = "500px",echo=FALSE, fig.align='center'----
knitr::include_graphics("../img/chunk.png")


## ---- fig.align='center', message = FALSE, out.width=275, echo = FALSE----
knitr::include_graphics("../img/codeChunkGear.PNG")


## ---- echo = FALSE, fig.align='center'-----
knitr::include_graphics("../img/compile.png")


## ---- echo = FALSE, fig.align='center'-----
knitr::include_graphics("../img/compile.png")


## ---- out.width='55%', fig.align='center', echo = FALSE----
knitr::include_graphics("../img/gitexample.svg")


## ---- message = FALSE----------------------
NFLData <- read_csv("https://www4.stat.ncsu.edu/~online/datasets/scoresFull.csv")
NFLData


## ---- eval = FALSE-------------------------
## rmarkdown::render("NFL.Rmd", output_file = "Cleveland Browns.html",
## 									params = list(team = "Cleveland Browns"))


## ---- echo = FALSE-------------------------
data.frame(output_file = "Pittsburgh Steelers.html", params = list(team = "Pittsburgh Steelers"))


## ---- eval = TRUE, echo = TRUE, message = FALSE----
#get unique teams
teamIDs <- unique(NFLData$awayTeam)
#create filenames
output_file <- paste0(teamIDs, ".html")
#create a list for each team with just the team name parameter
params = lapply(teamIDs, FUN = function(x){list(team = x)})

#put into a data frame 
reports <- tibble(output_file, params)


## ------------------------------------------
reports


## ---- eval = FALSE, echo = TRUE------------
## library(rmarkdown)
## #need to use x[[1]] to get at elements since tibble doesn't simplify
## apply(reports, MARGIN = 1,
## 			FUN = function(x){
## 				render(input = "files/NFL.Rmd", output_file = x[[1]], params = x[[2]])
## 				})
## 
## #or with pwalk (args are .l, .f, and ...)
## #.l is a list of lists, .f is function, formula, or vector
## pwalk(reports, render, input = "files/NFL.Rmd")


## ---- eval = FALSE-------------------------
## myIris <- filter(iris, params$species)
## summary(myIris)
## plot(myIris)


## ---- fig.align='center', out.width="59%", echo = FALSE----
knitr::include_graphics("../img/forkcommit.png")


## ---- fig.align='center', out.width="79%", echo = FALSE----
knitr::include_graphics("../img/pullrequest.png")


## ---- fig.align='center', out.width="75%", echo = FALSE----
knitr::include_graphics("../img/pullinfo.png")


## ---- fig.align='center', out.width="45%", echo = FALSE----
knitr::include_graphics("../img/pullrequestnoted.png")


## ---- fig.align='center', out.width="70%", echo = FALSE----
knitr::include_graphics("../img/pullcheck2.png")


## ---- fig.align='center', out.width="70%", echo = FALSE----
knitr::include_graphics("../img/mergeconflict.png")


## ---- fig.align='center', out.width="70%", echo = FALSE----
knitr::include_graphics("../img/resolve.png")


## ---- fig.align='center', out.width="70%", echo = FALSE----
knitr::include_graphics("../img/resolve2.png")

