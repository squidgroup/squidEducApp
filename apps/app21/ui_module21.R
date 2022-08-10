# UI: Module 4 Step 3
span( 

	conditionalPanel(
		condition = "0",
		uiOutput("Mod4Step5_hidden")
	),

	# Within-individual variances (Ve)
	fluidRow(
		column(6,getSliderInput("Mod4Step5_Ve1", Modules_VAR$Ve1, width="100%", value = 0.4)),
		column(6,getSliderInput("Mod4Step5_Ve2", Modules_VAR$Ve2, width="100%", value = 0.7))
	),
	fluidRow(
	  column(6,getSliderInput("Mod4Step5_Vi1", Modules_VAR$Vi1, width="100%", value = 0.4)),
	  column(6,getSliderInput("Mod4Step5_Vi2", Modules_VAR$Vi2, width="100%", value = 0.7))
	),
	
	fluidRow(align="center",
	# Within-individual correlation
	getSliderInput("Mod4Step5_Corr_e", Modules_VAR$Corr_e, width="99.5%", value = 0.5),
	
	# Among-individual correlation
	getSliderInput("Mod4Step5_Corr_I", Modules_VAR$Corr_I, width="99.5%", value = -0.5)
	),
	
	fluidRow(
		column(6,getSliderInput("Mod4Step5_B11", Modules_VAR$B11, width="100%")),
		column(6,getSliderInput("Mod4Step5_B12", Modules_VAR$B12, width="100%"))
	),
	
	fluidRow(align="center",
	# Simulation run button
	actionButton("Mod4Step5_Run", label = Modules_VAR$Run$label, icon = Modules_VAR$Run$icon, class = "runButton"),
	runningIndicator(),
	sim_msg(),
	downloadButton("downloadData", label = "Download simulated data"),
	
	fluidRow(align="center",
	         column(6,
	         actionButton("show2", label = "Show plots"),
	         actionButton("hide2", label = "Hide plots")
	         ),
	         column(6,
	                  actionButton("show", label = "Show some maths"),
	                  actionButton("hide", label = "Hide the maths")
	         )
	),
	
	),
	
	column(5,
	       plotOutput("Mod4Step5_correlationplot", width = Modules_VAR$Plot$width)
	),
	column(5,
	       plotOutput("Mod4Step5_correlationplot2", width = Modules_VAR$Plot$width)
	),
	
	column(5,
	       plotOutput("Mod4Step5_correlationplot3", width = Modules_VAR$Plot$width)
	),
	column(5,
	       plotOutput("Mod4Step5_environment", width = Modules_VAR$Plot$width)
	),
	
	fluidRow(align="center",
	         
	uiOutput("Mod4Step5_Phenotypic_Equation"),
	
	uiOutput("Mod4Step5_Matrices_1"),
	
	uiOutput("Mod4Step5_Matrices_2")
	)
)
