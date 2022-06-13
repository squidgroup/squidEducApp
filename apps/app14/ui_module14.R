# UI: Module 3 Step 2
span(
  
  conditionalPanel(
    condition = "0",
    uiOutput("Mod3Step2_hidden")
  ), 
  

  # inputs
  getSliderInput("Mod3Step2_NR",  Modules_VAR$NR),
  getSliderInput("Mod3Step2_Vhsi", Modules_VAR$Vhsi),
  
  actionButton("Mod3Step2_previewPlot_btn", label = Modules_VAR$Refresh$label, icon= Modules_VAR$Refresh$icon, class="refreshButton"),
  sim_msg(),

  plotOutput("Mod3Step2_previewPlot", width = Modules_VAR$Plot$width)
)