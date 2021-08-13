types <- c("versicolor", "virginica", "setosa")
output_file <- paste0(types, ".html")
#create a list for each team with just the team name parameter
params = lapply(types, FUN = function(x){list(species = x)})

#put into a data frame 
reports <- tibble(output_file, params)


library(rmarkdown)
#need to use x[[1]] to get at elements since tibble doesn't simplify
apply(reports, MARGIN = 1, 
      FUN = function(x){
        render(input = "slides/iris.Rmd", output_file = x[[1]], params = x[[2]])
      })
