# UI: Module 1 Step 3
span( 

  div(style="display: inline-block; width: 100%;",align="center",
  # Number of individuals
  getSliderInput("Mod1Step3_NI", Modules_VAR$NI)
  ),
  div(style="display: inline-block; width: 100%;",align="center",
  # Among-individual variance (Vi),
  getSliderInput("Mod1Step3_Vi", Modules_VAR$Vi, value = 0.2)
  ),
  div(style="display: inline-block; width: 100%;",align="center",
  # Measurement error variance
  getSliderInput("Mod1Step3_Ve", Modules_VAR$Vm, min = 0, value = 0.5)
  ),
  div(style="display: inline-block; width: 100%;",align="center",
  # Environment effects variance
  wellPanel(
    uiOutput("Mod1Step3_Vbx_txt", style = "display: inline-block;"),
    uiOutput("Mod1Step3_error_Vbx", style = "display: inline-block;")
  ),
  ),
  div(style="display: inline-block; width: 100%;",align="center",
  # Number of trait expressions sampled
  getSliderInput("Mod1Step3_NR", Modules_VAR$NR)
  ),
  
  conditionalPanel(
    condition = "0",
    uiOutput("Mod1Step3_hidden")
  ),
  
  # Simulation run button
  fluidRow(align="center",
  actionButton("Mod1Step3_Run", label = Modules_VAR$Run$label, icon= Modules_VAR$Run$icon, class="runButton"),
  runningIndicator(),
  sim_msg(),

  # Output
    # Graph: density distribution of true values (Vp)
    #        density distribution of blups (Vi)
    #        density distribution of environnemental effect (Vx1)
    #        density distribution of deviation from blups (Vme)
    plotOutput("Mod1Step3_plot", width = Modules_VAR$Plot$width),
  
  fluidRow(align="center",
  actionButton("show", label = Modules_VAR$Show$label),
  actionButton("hide", label = Modules_VAR$Hide$label)
  ),
  
  # Repeatability output
  textOutput("Mod1Step3_Rep_txt"),
  
    # Table : display true and measured values (Vp, Vi, Vme and mean)
    uiOutput("Mod1Step3_summary_table", style = "display: inline-block;"),
  
  # Scatter plot: measurements correlation
  plotOutput("Mod1Step3_plot2", width = Modules_VAR$Plot$width)
  
)
)