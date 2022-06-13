# UI: Module 4 Step 1
span( 
  
  conditionalPanel(
    condition = "0",
    uiOutput("Mod4Step1_hidden")
  ),
  
    # Within-individual variances (Ve)
  fluidRow(align="center",
    column(6,getSliderInput("Mod4Step1_Ve1", Modules_VAR$Ve1, width = "100%")),
    column(6,getSliderInput("Mod4Step1_Ve2", Modules_VAR$Ve2, width = "100%")),
  
  # Within-individual correlation
  getSliderInput("Mod4Step1_Corr_e", Modules_VAR$Corr_e),
  
  ######## Matrix with the values entered
  uiOutput("Mod4Step1_Covariance_Matrix"),
  
  # Simulation run button
  actionButton("Mod4Step1_Run", label = Modules_VAR$Run$label, icon = Modules_VAR$Run$icon, class = "runButton"),
  runningIndicator(),
  sim_msg(),
  
  ##### Plot correlation between two trait
  plotOutput("Mod4Step1_correlationplot", width = Modules_VAR$Plot$width)
  )
  
)