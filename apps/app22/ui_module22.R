# UI: Module 5 Step 1
span( 

  conditionalPanel(
    condition = "0",
    uiOutput("Mod5Step1_hidden")
  ),

	# Input: Number of individuals
  getSliderInput("Mod5Step1_NI", Modules_VAR$NI),
	
	# Input: Among-individual variance (Vi)
  getSliderInput("Mod5Step1_Vi", Modules_VAR$Vi),
	
	# Input: NMeasurement error variance
  getSliderInput("Mod5Step1_Ve", Modules_VAR$Vm),
	
	# Input: Number of trait expression measured
  getSliderInput("Mod5Step1_NR", Modules_VAR$NR),
	
	# Input: Environment 1
  getSliderInput("Mod5Step1_B1", Modules_VAR$B1.1),
	
	# Input: Environment 2
  getSliderInput("Mod5Step1_B2", Modules_VAR$B2.1),

	# Simulation run button
	actionButton("Mod5Step1_Run", label = Modules_VAR$Run$label, icon = Modules_VAR$Run$icon, class = "runButton"),
	runningIndicator(),
  sim_msg(),

  	# Output: Table 1
  uiOutput("Mod5Step1_summary_table1"),
	
	# Output: Table 2
  uiOutput("Mod5Step1_summary_table2"),

  p(plotlyOutput("Mod5Step1_3D_1")),
  
  p(plotlyOutput("Mod5Step1_3D_2"))
  
)