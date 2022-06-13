# UI: Module 2 Step 3
span(
  div(style="display: inline-block; width: 100%;",align="center",
  # population mean effect (beta0)
  getSliderInput("Mod2Step3_B0", Modules_VAR$B0)
  ),
  div(style="display: inline-block; width: 100%;",align="center",
  # among-individual variance (Vi)
  getSliderInput("Mod2Step3_Vi", Modules_VAR$Vi)
  ),
  # overdispersion variance (Vo)
  div(style="display: inline-block; width: 100%;",align="center",
  sliderInput("Mod2Step3_Vo",
              "Overdispersion variance ($V_o$):",
              value = 0.1,
              min   = 0,
              max   = 1,
              step  = 0.1,
              width = "49.5%"
  )
  ),
  
  fluidRow(align="center",
  # Simulation run button
  actionButton("Mod2Step3_Run", label = Modules_VAR$Run$label, icon= Modules_VAR$Run$icon, class="runButton"),
  runningIndicator(),
  sim_msg(),
  
  # Table : display model output
  uiOutput("Mod2Step3_summary_table", style = "display: inline-block;")
  )
)