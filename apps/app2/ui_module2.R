# UI: Module 1 Step 2
span( 
  
  # Number of individuals
  div(style="display: inline-block; width: 100%;",align="center",
  getSliderInput("Mod1Step2_NI", Modules_VAR$NI),
  ),
  
  # Measurement error variance
  div(style="display: inline-block; width: 100%;",align="center",
  getSliderInput("Mod1Step2_Ve", Modules_VAR$Vm),
  ),
  
  # Number of trait expressions sampled
  div(style="display: inline-block; width: 100%;",align="center",
  getSliderInput("Mod1Step2_NR", Modules_VAR$NR),
  ),
  
  # Hidden variable:
  # Mod1Step2_Tmax: simulation time
  # Mod1Step2_Vind: Intercepts and slopes (Co)variance matrix
  conditionalPanel(
    condition = "0",
    uiOutput("Mod1Step2_hidden")
  ),
  
  # Simulation run button
  fluidRow(align="center",
           # Repeatability output
           textOutput("Mod1Step2_Rep_txt"),
           actionButton("Mod1Step2_Run", label = Modules_VAR$Run$label, icon= Modules_VAR$Run$icon, class="runButton"),
           runningIndicator(),
           sim_msg(),
  # Output
    # Graph: density distribution of true values (Vp)
    #        density distribution of blups (Vi)
    #        density distribution of deviation from blups (Vme)
  
  plotOutput("Mod1Step2_plot", width = Modules_VAR$Plot$width),

  fluidRow(align="center",
  actionButton("show", label = Modules_VAR$Show$label),
  actionButton("hide", label = Modules_VAR$Hide$label)
  ),
  
  # Table : display true and measured values (Vp, Vi, Vme and mean)
    uiOutput("Mod1Step2_summary_table", style = "display: inline-block;"),

    # Scatter plot: measurements correlation
    plotOutput("Mod1Step2_plot2", width = Modules_VAR$Plot$width),

  ),
)