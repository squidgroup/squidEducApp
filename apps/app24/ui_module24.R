# UI: Module 6 Step 1
span( 
  
  fluidRow(
    column(6,
    # Number of individuals
    getSliderInput("Mod6Step1_NI", Modules_VAR$NI, width="100%")),
    
    column(6,
    # Number of trait expressions sampled
    getSliderInput("Mod6Step1_NR", Modules_VAR$NR, width="100%")),
  ),
    
    fluidRow(
      column(6,
      # Among-individual variance (Vi)
      getSliderInput("Mod6Step1_Vi", Modules_VAR$Vi, width="100%")),
     
      column(6,
      #Individual-specific response to an environmental effect (random slopes) variance (VS)  
      getSliderInput("Mod6Step1_Vs", Modules_VAR$Vsx, width="100%"))    
    ),
    
    
    
    fluidRow(
      column(6,
      # Variance of Mean Environment effects in the slope (Vbx)
      getSliderInput("Mod6Step1_Vbx", Modules_VAR$Vbx, width="100%")),
    
      column(6,
      # Measurement error variance  
      getSliderInput("Mod6Step1_Ve", Modules_VAR$Ve, width="100%"))
    ),

    # Hidden variable:
    conditionalPanel(
      condition = "0",
      uiOutput("Mod6Step1_hidden")
    ),
    
    fluidRow(align="center",
    # Simulation run button
    actionButton("Mod6Step1_Run", label = Modules_VAR$Run$label, icon= Modules_VAR$Run$icon, class="runButton"),
    runningIndicator(),
    sim_msg()
    ),
    
    fluidRow(align="center",
    column(6,
    # Table : display true and measured values (Vp, Vi and mean)
    uiOutput("Mod6Step1_summary_table", style = "display: inline-block;")),
    
    column(6,
    # Phenotype against environment figure
    plotOutput("Mod6Step1_plot", width = Modules_VAR$Plot$width))
    ),
)