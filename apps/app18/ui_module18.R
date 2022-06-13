# UI: Module 4 Step 2
span( 
  
  conditionalPanel(
    condition = "0",
    uiOutput("Mod4Step2_hidden")
  ),

 # Within-individual variances (Ve)
  fluidRow(
  	column(6,getSliderInput("Mod4Step2_Ve1", Modules_VAR$Ve1, width = "100%")),
  	column(6,getSliderInput("Mod4Step2_Ve2", Modules_VAR$Ve2, width = "100%"))
  ),

  fluidRow(
  	column(6,getSliderInput("Mod4Step2_Vi1", Modules_VAR$Vi1, width = "100%")),
  	column(6,getSliderInput("Mod4Step2_Vi2", Modules_VAR$Vi2, width = "100%"))
  ),
 fluidRow(align="center",
 # Within-individual correlation
 getSliderInput("Mod4Step2_Corr_e", Modules_VAR$Corr_e, width = "99.5%"),

  ######## Matrix with the values entered
 fluidRow(align="center",
   column(6,
  uiOutput("Mod4Step2_Repeatability1")
  ),
  column(6,
 uiOutput("Mod4Step2_Repeatability2")
 )
 ),

  # Simulation run button
  actionButton("Mod4Step2_Run", label = Modules_VAR$Run$label, icon = Modules_VAR$Run$icon, class = "runButton"),
  runningIndicator(),
  sim_msg(),
  column(5,
  plotOutput("Mod4Step2_correlationplot", width = Modules_VAR$Plot$width)
  ),
  column(5,
  plotOutput("Mod4Step2_correlationplot2", width = Modules_VAR$Plot$width)
  )
 ),
 fluidRow(align="center",
          actionButton("show", label = "Show some maths"),
          actionButton("hide", label = "Hide the maths")
 ),
 ######## Matrix with the values entered
 uiOutput("Mod4Step2_Within_Covariance_Matrix"),
 
 ######## Matrix with the values entered
 uiOutput("Mod4Step2_Among_Covariance_Matrix"),
 
 ####### eq 1
 uiOutput("Mod4Step2_Phenotopic_correlation2")
)