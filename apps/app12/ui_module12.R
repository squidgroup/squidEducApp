# UI: Module 3 Step 1
span(

  div(info_msg(c(Mod3Step1_txt$note1, Mod3Step1_txt$note2))), # Text: note
  
  fluidRow(
    column(6,# 6 is half width
      # Among-individual variance (Vi)
      getSliderInput("Mod3Step1_Vi", Modules_VAR$Vi, width = "100%"),
  
  # Measurement error variance
    getSliderInput("Mod3Step1_Ve", Modules_VAR$Vm, width = "100%")
    ),
  column(6, # 6 is half width
         
  # Variance of Mean Environment effects in the slope (V Beta1 X1)
    getSliderInput("Mod3Step1_Vbx", Modules_VAR$VE, width = "100%"),

  
  # Number of records (NR)
  getSliderInput("Mod3Step1_NR", Modules_VAR$NR, width = "100%")
  )
  ),
  
  conditionalPanel(
    condition = "0",
    uiOutput("Mod3Step1_hidden")
  ),


  # Simulation run button
  fluidRow(align="center",
  actionButton("Mod3Step1_Run", label = Modules_VAR$Run$label, icon= Modules_VAR$Run$icon, class="runButton"),
  runningIndicator(),
  sim_msg(),
  
  uiOutput("Mod3Step1_summary_table", style = "display: inline-block;")
  )
)