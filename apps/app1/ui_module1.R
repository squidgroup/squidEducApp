# UI: Module 1 Step 1
span(
    
  #### Title ####
  br(),

  div(style="display: inline-block; width: 100%;",
  # Number of individuals
  getSliderInput("Mod1Step1_NI", Modules_VAR$NI, placement = "center")
  , align="center"),
  
  div(style="display: inline-block; width: 100%;",
  # Measurement error variance
  getSliderInput("Mod1Step1_Ve", Modules_VAR$Vm, placement = "center")
  , align="center"),
  # Hidden variable:
    # Mod1Step1_Vind: Intercepts and slopes (Co)variance matrix
  conditionalPanel(
    condition = "0",
    uiOutput("Mod1Step1_hidden")
  ),
  
  #### Run 1 ####
  
  #fluidrow to center things
  fluidRow(align="center",
    # Button to run simulation       
    actionButton("Mod1Step1_Run", label = Modules_VAR$Run$label, icon= Modules_VAR$Run$icon, class="runButton"),
    runningIndicator(), # Simulation progress bar
    sim_msg(), # Message for simulation progress


  #### Figure 1 ####
  # Graph: density distribution of true and measured phenotypic values
  plotOutput("Mod1Step1_plot", width = Modules_VAR$Plot$width),
  
  fluidRow(align="center",
  actionButton("show", label = Modules_VAR$Show$label),
  actionButton("hide", label = Modules_VAR$Hide$label)
  ),
  
  #### Table 1 ####
  # Table : display true and measured values (Vp, Vi and mean)
  uiOutput("Mod1Step1_summary_table", style = "display: inline-block;")
  
  ),
)