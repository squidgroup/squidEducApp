# UI: Module 5 Step 1
span( 

  conditionalPanel(
    condition = "0",
    uiOutput("Mod5Step1_hidden")
  ),
  
  fluidRow(
    column(6,
	# Input: Number of individuals
  getSliderInput("Mod5Step1_NI", Modules_VAR$NI, width="100%")),
	
	column(6,
	# Input: Number of trait expression measured
	getSliderInput("Mod5Step1_NR", Modules_VAR$NR, width="100%"))
  ),
	
	fluidRow(
	  column(6,
	# Input: Among-individual variance (Vi)
	getSliderInput("Mod5Step1_Vi", Modules_VAR$Vi, width="100%")),
  
	column(6,
	# Input: NMeasurement error variance
  getSliderInput("Mod5Step1_Ve", Modules_VAR$Vm, width="100%")),
	),
	
	fluidRow(
	  column(6,
	# Input: Environment 1
  getSliderInput("Mod5Step1_B1", Modules_VAR$B1.1, width="100%")),
	
	column(6,
	# Input: Environment 2
  getSliderInput("Mod5Step1_B2", Modules_VAR$B2.1, width="100%"))
	),
  fluidRow(align="center",
	# Simulation run button
	actionButton("Mod5Step1_Run", label = Modules_VAR$Run$label, icon = Modules_VAR$Run$icon, class = "runButton"),
	runningIndicator(),
  sim_msg(),

  	# Output: Table 1
	column(6,
  uiOutput("Mod5Step1_summary_table1", style="display:inline-block;")),
	
	# Output: Table 2
	column(6,
  uiOutput("Mod5Step1_summary_table2", style="display:inline-block;")),
  ),
	
  column(6,
  p(plotlyOutput("Mod5Step1_3D_1"))
  ),
  column(6,
  p(plotlyOutput("Mod5Step1_3D_2"))
  )
  
)