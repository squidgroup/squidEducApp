# UI: Module 8 Step 1
span( 
  
  # input -------------------------------------->>>>>>>>>>>>>>>>>>>>>>>>>>>
  
  conditionalPanel(
    condition = "0",
    uiOutput("Mod8Step1_hidden")
  ),
  fluidRow(
  column(6,
  # Input: Among-individual variance in intercept (Vi)
  getSliderInput("Mod8Step1_Vi", Modules_VAR$Vi, width="100%")),
  
  column(6,
  # Input: Among-individual variance in slope (Vs)
  getSliderInput("Mod8Step1_Vs1", Modules_VAR$Vsx.1, width="100%")),
  ),
  fluidRow(
  column(6,
  # Input: Environment 1
  getSliderInput("Mod8Step1_B1", Modules_VAR$B1.1, width="100%")),
  
  column(6,
  # Input: Environment 2
  getSliderInput("Mod8Step1_B2", Modules_VAR$B2.1, width="100%")),
  ),
  fluidRow(
  column(6,
  # Input: Environment 12
  getSliderInput("Mod8Step1_B12", Modules_VAR$B1122, width="100%")),
  
  column(6,
  # Input: Measurement error variance
  getSliderInput("Mod8Step1_Ve", Modules_VAR$Vm, width="100%")),
  
  # Input: Correlation between Vi and Vs1
  getSliderInput("Mod8Step1_CorIS1", Modules_VAR$CorIS1, width="100%"),
  ),
  
  fluidRow(align="center",
  # Simulation run button
  actionButton("Mod8Step1_Run", label = Modules_VAR$Run$label, icon = Modules_VAR$Run$icon, class = "runButton"),
  runningIndicator(),
  sim_msg(),

  # Output: Table 1
  uiOutput("Mod8Step1_summary_table1", style="display:inline-block;")
  ),
  
  fluidRow(
    column(6,
  # Figure 1
  plotlyOutput("Mod8Step1_3D_1")),
  column(6,
  # Figure 2
  plotlyOutput("Mod8Step1_3D_2")),
  )
)