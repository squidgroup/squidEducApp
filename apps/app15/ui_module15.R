# UI: Module 3 Step 2
span(
  fluidRow(

    column(6,# 6 is half width
           # Among-individual variance (Vi)
           getSliderInput("Mod3Step2_Vi", Modules_VAR$Vi, width = "100%"),
           
           # Measurement error variance
           getSliderInput("Mod3Step2_Ve", Modules_VAR$Vm, width = "100%")
    ),
          column(6, # 6 is half width
           
           # Variance of Mean Environment effects in the slope 
           getSliderInput("Mod3Step2_Vbx", Modules_VAR$VE, width = "100%"),
           
           # Number of trait expressions (NR)
           getSliderInput("Mod3Step2_NR", Modules_VAR$NR, width = "100%", min = 2)
    )
  ),

  conditionalPanel(
    condition = "0",
    uiOutput("Mod3Step2_hidden")
  ), 
  
  fluidRow(align="center",
  getEnvironmentInput(3,2),

  # Simulation run button
  actionButton("Mod3Step2_Run", label = Modules_VAR$Run$label, icon= Modules_VAR$Run$icon, class="runButton"),
  runningIndicator(),
  sim_msg(),

  uiOutput("Mod3Step2_summary_table", style = "display: inline-block;")
  )
)