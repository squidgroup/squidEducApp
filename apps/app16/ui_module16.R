# UI: Module 3 Step 3
span(
  conditionalPanel(
    condition = "0",
    uiOutput("Mod3Step3_hidden")
  ), 
  
  # Among-individual variance (Vi)
  fluidRow(align="center",
    column(6,
    getSliderInput("Mod3Step3_Vi", Modules_VAR$Vi, width="100%"),

  
  # Measurement error variance
getSliderInput("Mod3Step3_Ve", Modules_VAR$Vm, width="100%")),

  column(6,
  # Variance of Mean Environment effects in the slope (V Beta1 X1)
getSliderInput("Mod3Step3_Vbx", Modules_VAR$VE, width="100%"),
getSliderInput("Mod3Step3_NR",  Modules_VAR$NR, width="100%"),

),
getSliderInput("Mod3Step3_Vhsi", Modules_VAR$Vhsi, width="99.5%"),
sliderInput("Mod3Step3_Vbx_proportion",
            "Proportion of the environmental effect measured:",
            value = 0.2,
            min   = 0,
            max   = 1,
            step  = 0.01,
            width = "99.5%",
            post = ""
),
),
fluidRow(align="center",
  getEnvironmentInput(3,3),
  


  

  # Simulation run button
  actionButton("Mod3Step3_Run2", label = Modules_VAR$Run$label, icon= Modules_VAR$Run$icon, class="runButton"),
  runningIndicator(),
  sim_msg(),
  
  uiOutput("Mod3Step3_summary_table_2", style = "display:inline-block;"))
  
)