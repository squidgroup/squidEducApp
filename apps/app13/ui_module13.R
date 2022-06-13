# UI: Module 3 Step 1
span(
  fluidRow(align="center",
  getSliderInput("Mod3Step1_NR", Modules_VAR$NR, width = "49.5%"),
  getSliderInput("Mod3Step1_Vhsi", Modules_VAR$Vhsi, width = "49.5%")
  ),

  conditionalPanel(
    condition = "0",
    uiOutput("Mod3Step1_hidden")
  ),
  fluidRow(align="center",
           plotOutput("Mod3Step1_previewPlot", width = Modules_VAR$Plot$width)
  )
  
)