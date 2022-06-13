# UI: Module 6 Step 2
span(
  
  fluidRow(
    column(6,
    # Number of individuals               
    getSliderInput("Mod6Step2_NI", Modules_VAR$NI, width="100%")),
    
    column(6,
    # Number of trait expressions sampled
    getSliderInput("Mod6Step2_NR", Modules_VAR$NR, width="100%"))
  ),
    
    fluidRow(
      # Among-individual variance (Vi)
      column(6,getSliderInput("Mod6Step2_Vi", Modules_VAR$Vi, width="100%")),
      # Variance in slope
      column(6,getSliderInput("Mod6Step2_Vs", Modules_VAR$Vsx, width="100%"))
    ),
    

    fluidRow(
      # Variance of Mean Environment effects in the slope (Vbx)
      column(6,getSliderInput("Mod6Step2_Vbx", Modules_VAR$Vbx, width="100%")),
      # Measurement error variance
      column(6,getSliderInput("Mod6Step2_Ve", Modules_VAR$Ve, width="100%")),
    ),
    
  # Correlation between I and S (CorIS ):
  getSliderInput("Mod6Step2_CorIS", Modules_VAR$CorIS, width="100%"),
    
    fluidRow(align="center",

    
    # Hidden variable:
    conditionalPanel(
      condition = "0",
      uiOutput("Mod6Step2_hidden")
    ),
    
    # Simulation run button
    actionButton("Mod6Step2_Run", label = Modules_VAR$Run$label, icon= Modules_VAR$Run$icon, class="runButton"),
    runningIndicator(),
    sim_msg()
    ),
    
    fluidRow(align="center",
    column(6,
    # Table : display true and measured values (Vp, Vi and mean)
    uiOutput("Mod6Step2_summary_table", style="display:inline-block;")),
    
    column(6,
    plotOutput("Mod6Step2_plot"))
    )
)