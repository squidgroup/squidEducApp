library(shinyMatrix)
library(plotly)
library(shiny)
library(squid)
library(shinyjs)

# Obtain directories in /source for loading
dirs <- list.dirs("./source",recursive = F)
dirs <- sort(dirs,decreasing = T) # ensures that variables are loaded before text

# Load all files in all directories
for(i in dirs){
  files <- list.files(path = i,recursive = T)
  if(length(files)>0){
    try(sapply(files, function(x,path)source(paste0(path,"/",x)), path = i),silent=T)
  }
  print(files)
}

#### ggplot theme ####
ggplot2::theme_set(ggplot2::theme_classic())