navbarMenu("Simulation",
           
           #### Full Model (Step by step) ####
           tabPanel("Full model (Step by step)", # title
                    icon=icon("coffee", "fa-fw"), # Icon
                    # Simulation container
                    fixedPage(tags$div(class="myPage", source("./source/pages/full_model_sbys/ui_full_model_sbys.R",local=TRUE)[["value"]]))
           ), # End tabPanel Simulation
           
           #### Full model (express) ####
           tabPanel("Full model (express)", # title
                    icon=icon("fighter-jet", "fa-fw"), # Icon
                    # Simulation container
                    tags$div(class="myPage", source("./source/pages/full_model/ui_full_model.R",local=TRUE)[["value"]])
           ) # End tabPanel Full Model
           
) # End navBarMenu Simulation
