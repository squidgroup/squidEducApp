# UI: Module 4 Step 3
span( 
	conditionalPanel(
		condition = "0",
		uiOutput("Mod4Step3_hidden")
	),
	
	# Within-individual variances (Ve)
	fluidRow(
		column(6,getSliderInput("Mod4Step3_Ve1", Modules_VAR$Ve1, width = "100%")),
		column(6,getSliderInput("Mod4Step3_Ve2", Modules_VAR$Ve2, width = "100%"))
	),

	fluidRow(
		column(6,getSliderInput("Mod4Step3_Vi1", Modules_VAR$Vi1, width = "100%")),
		column(6,getSliderInput("Mod4Step3_Vi2", Modules_VAR$Vi2, width = "100%"))
	),
	
	fluidRow(align="center",
	     
	# Within-individual correlation
	getSliderInput("Mod4Step3_Corr_e", Modules_VAR$Corr_e, width = "99.5%"),
	         
	# Among-individual correlation
	getSliderInput("Mod4Step3_Corr_I", Modules_VAR$Corr_I, width = "99.5%"),

	###### Repeatabilities OUTPUT  
	fluidRow(align="center",
	         column(6,
	                uiOutput("Mod4Step3_Repeatability1")
	                ),
	         column(6,
	                uiOutput("Mod4Step3_Repeatability2")
	                )
	         ),
	
	# Simulation run button
	actionButton("Mod4Step3_Run", label = Modules_VAR$Run$label, icon = Modules_VAR$Run$icon, class = "runButton"),
	runningIndicator(),
	sim_msg(),
	
	column(5,
	       plotOutput("Mod4Step3_correlationplot", width = Modules_VAR$Plot$width)
	),
	column(5,
	       plotOutput("Mod4Step3_correlationplot2", width = Modules_VAR$Plot$width)
	)
),

	plotOutput("Mod4Step3_correlationplot3", width = Modules_VAR$Plot$width),
	
	fluidRow(align="center",
	         actionButton("show", label = "Show some maths"),
	         actionButton("hide", label = "Hide the maths")
	),

uiOutput("Mod4Step3_Phenotopic_correlation"),


######## Matrix with the values entered
uiOutput("Mod4Step3_Within_Covariance_Matrix"),

######## Matrix with the values entered
uiOutput("Mod4Step3_Among_Covariance_Matrix")

)