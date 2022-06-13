# UI: Module 6 Step 3
span(
  fluidRow(align="center",
    selectInput("Mod6Step3_selector", "Number of total sampled observations:",
                c("100" = 100,
                  "225" = 225,
                  "400" = 400,
                  "900" = 900)),
   
   # Hidden variable:
    conditionalPanel(
      condition = "0",
      uiOutput("Mod6Step3_hidden")
    ),
   
    # Table 
    uiOutput("Mod6Step3_summary_table", style = "display:inline-block;"),
    
   fluidRow(
     # Simulation run button
    actionButton("Mod6Step3_Run", label = Modules_VAR$Run$label, icon= Modules_VAR$Run$icon, class="runButton"),
    runningIndicator(),
    sim_msg()),
   
    plotOutput("Mod6Step3_plot")
  )
)