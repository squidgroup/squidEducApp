# My WebServer  ----------------------------------------------------------------

# Initialisation ------------------------------------------
shinyServer(function(input, output, session) {
  
  
  # Automatically stop a Shiny app when closing the browser tab
  session$onSessionEnded(stopApp)
  
  # Graphs
  color <- list(
    "color1"  = "red",
    "color2"  =  "dodgerblue"
  )

  isPreparing <- FALSE
  isRunning   <- FALSE

  #################### Module ##################################################################################################
  isolate({
    path <- paste0("./","server_module",gsub("[^0-9.-]", "", getwd()),".R")
    source(path, local=TRUE)
  })
  ################### End ###################################################################################################
  
  
  ##### For Debugging ####
  output$debug <- renderPrint({
    sessionInfo()
  })
  
})
