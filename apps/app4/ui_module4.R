# UI: Module 1 Step 4
span(

  div(style="display: inline-block; width: 100%;",align="center",
  #Number of individuals
  getSliderInput("Mod1Step4_NI", Modules_VAR$NI)
  ),
  div(style="display: inline-block; width: 100%;",align="center",
  # Among-individual variance (Vi)
  getSliderInput("Mod1Step4_Vi", Modules_VAR$Vi, value = 0.2)
  ),
  div(style="display: inline-block; width: 100%;",align="center",
  # Measurement error variance (Ve)
  getSliderInput("Mod1Step4_Ve", Modules_VAR$Vm, value = 0.5, min = 0)
  ),
  # Environment effects variance
  wellPanel(
    fluidRow(align="center",
    uiOutput("Mod1Step4_Vbx_txt", style = "display: inline-block;"),
    uiOutput("Mod1Step4_error_Vbx", style = "display: inline-block;"),
    )
  ),
  
  div(style="display: inline-block; width: 100%;",align="center",
  # Number of trait expressions sampled
  getSliderInput("Mod1Step4_NR", Modules_VAR$NR)
  ),
  conditionalPanel(
    condition = "0",
    uiOutput("Mod1Step4_hidden")
  ),
  fluidRow(align="center",
  # Simulation run button
  actionButton("Mod1Step4_Run", label = Modules_VAR$Run$label, icon= Modules_VAR$Run$icon, class="runButton"),
  runningIndicator(),
  sim_msg(),
  
  #two plots side by side
  splitLayout(cellWidths = c("50%", "50%"), 
  # Graph: Individual phenotypes over environment    
  plotOutput("Mod1Step4_plot1", width = "80%"),
  
    # Graph: Individual reaction norm  
  plotOutput("Mod1Step4_plot2", width = "80%")
  ),
  
  fluidRow(align="center",
  actionButton("show", label = Modules_VAR$Show$label),
  actionButton("hide", label = Modules_VAR$Hide$label)
  ),
  
  # Output
    # Table : display true and measured values (Vp, Vme, mean and Beta es)  
    uiOutput("Mod1Step4_summary_table", style = "display: inline-block;")
  )
)