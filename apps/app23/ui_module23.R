# UI: Module 5 Step 2
span( 

  conditionalPanel(
    condition = "0",
    uiOutput("Mod5Step2_hidden")
  ),

  fluidRow(
           column(6,
  # Input: Number of individuals
  getSliderInput("Mod5Step2_NI", Modules_VAR$NI, width="100%")),
  
  column(6,
  # Input: Number of trait expression measured
  getSliderInput("Mod5Step2_NR", Modules_VAR$NR, width="100%"))
  
  ),
  
  fluidRow(
    column(6,
  # Input: Among-individual variance (Vi)
  getSliderInput("Mod5Step2_Vi", Modules_VAR$Vi, width="100%")),
  
  column(6,
  # Input: Measurement error variance
  getSliderInput("Mod5Step2_Ve", Modules_VAR$Vm, width="100%"))
  
  ),
  
  fluidRow(
    column(6,
  # Input: Environment 1
  getSliderInput("Mod5Step2_B1", Modules_VAR$B1.1, width="100%")),
  
  column(6,
  # Input: Environment 2
  getSliderInput("Mod5Step2_B2", Modules_VAR$B2.1, width="100%"))
  ),
  
  # Input: Interaction
  getSliderInput("Mod5Step2_B12", Modules_VAR$B1122, width="100%"),
  
  fluidRow(align="center",
  # Simulation run button
  actionButton("Mod5Step2_Run", label = Modules_VAR$Run$label, icon = Modules_VAR$Run$icon, class = "runButton"),
  runningIndicator(),
  sim_msg(),

  column(6,
  # Output: Table 1
  uiOutput("Mod5Step2_summary_table", style="display:inline-block;")),
  column(6,
  # Output: Figure 1
  p(plotlyOutput("Mod5Step2_3D")))
  )
)