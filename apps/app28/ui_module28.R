# UI: Module 8 Step 1
span( 
  
  # input -------------------------------------->>>>>>>>>>>>>>>>>>>>>>>>>>>
  
  conditionalPanel(
    condition = "0",
    uiOutput("Mod8Step1_2_hidden")
  ),
  
  fluidRow(
  column(6,
  # Input: Among-individual variance in intercept (Vi)
  getSliderInput("Mod8Step1_2_Vi", Modules_VAR$Vi, width="100%")),
  column(6,
  # Input: Among-individual variance in slope (Vs)
  getSliderInput("Mod8Step1_2_Vs1", Modules_VAR$Vsx.1, width="100%"))
  ),
  fluidRow(
  column(6,
  # Input: Among-individual variance in slope (Vs)
  getSliderInput("Mod8Step1_2_Vs2", Modules_VAR$Vsx.2, width="100%")),
  column(6,
         # Input: Environment 1
         getSliderInput("Mod8Step1_2_B1", Modules_VAR$B1.1, width="100%"))
  ),
  fluidRow(
column(6,
       # Input: Environment 2
       getSliderInput("Mod8Step1_2_B2", Modules_VAR$B2.1, width="100%")),
column(6,
       # Input: Environment 12
       getSliderInput("Mod8Step1_2_B12", Modules_VAR$B1122, width="100%"))
),
fluidRow(
column(6,
       # Input: Correlation between Vi and Vs1
       getSliderInput("Mod8Step1_2_CorIS1", Modules_VAR$CorIS1, width="100%")),
column(6,
       # Input: Correlation between Vi and Vs2
       getSliderInput("Mod8Step1_2_CorIS2", Modules_VAR$CorIS2, width="100%"))
),
fluidRow(
column(6,
       # Input: Correlation between Vs1 and Vs2
       getSliderInput("Mod8Step1_2_CorS1S2", Modules_VAR$CorS1S2, width="100%")),
  column(6,
         # Input: Measurement error variance
         getSliderInput("Mod8Step1_2_Ve", Modules_VAR$Vm, width="100%"))
),

  fluidRow(align='center',
  # Simulation run button
  actionButton("Mod8Step1_2_Run", label = Modules_VAR$Run$label, icon = Modules_VAR$Run$icon, class = "runButton"),
  runningIndicator(),
  sim_msg()
  ),

column(6,
  # Output: Table 2
  uiOutput("Mod8Step1_2_summary_table1", style = "display:inline-block;")),
  column(6,
  # Figure 3
  plotlyOutput("Mod8Step1_2_3D"))
)