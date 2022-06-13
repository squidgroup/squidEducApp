# My Shiny User Interface #

#### Include #### 

shinyUI(
  fluidPage(
    useShinyjs(),
    #### Header  ####
    #### CSS and Javascipt file ####  
    tags$head(
      tags$link(rel = "stylesheet", type = "text/css", href = "css/jquery.qtip.css"),
      tags$link(rel = "stylesheet", type = "text/css", href = "css/stylesheet.css"),
      tags$script(type="text/javascript", src = "js/jquery.qtip.js"),
      tags$script(type="text/javascript", src = "js/myScript.js"),
      tags$script(HTML('Shiny.addCustomMessageHandler("jsCode", 
                        function(message) { 
                          console.log(message)
                          eval(message.code); 
                        });')),
      tags$script( "MathJax.Hub.Config({tex2jax: {inlineMath: [['$','$'], ]}});", type='text/x-mathjax-config')
    ),
    #################### Module ##################################################################################################
    isolate({
    path <- paste0("./","ui_module",gsub("[^0-9.-]", "", getwd()),".R")
    source(path, local=TRUE)[1]
    }),
    ################### End ###################################################################################################
    #### Footer ####
    tags$div(class="footer",
             fixedPage(div(class="line"),
                       # Boolean showing when a simulation is running
                       conditionalPanel(
                         condition = "0",
                         checkboxInput("isRunning", "", FALSE)
                       ), 
                       " "
             )
    )
               
)
)