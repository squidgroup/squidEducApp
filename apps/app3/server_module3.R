#Server functions for module 1 step 3
c(
  #by default hide show and hide buttons
  hide("hide"),
  hide("show"),
  # 
  observeEvent(input$Mod1Step3_Ve, {
   if((input$Mod1Step3_Ve+input$Mod1Step3_Vi)>1)updateSliderInput(session, "Mod1Step3_Vi", value = 1-input$Mod1Step3_Ve)
}),
observeEvent(input$Mod1Step3_Vi, {
  if((input$Mod1Step3_Ve+input$Mod1Step3_Vi)>1)updateSliderInput(session, "Mod1Step3_Ve", value = 1-input$Mod1Step3_Vi)
}),
    ######### Set variables ######### 
    Mod1Step3updateB <- function(input){
      suppressWarnings(B <- sqrt(1-input$Mod1Step3_Vi-input$Mod1Step3_Ve))
      return(ifelse(is.nan(B),0,B))
    },
      # Set hidden variables (Tmax, Vi, X1_state, X1_sto_V and NR)
       output$Mod1Step3_hidden <- renderUI({
          list(
            numericInput("Mod1Step3_Tmax", "", Modules_VAR$Tmax$max),
            shinyMatrix::matrixInput("Mod1Step3_Vind", 
                                     value = matrix(c(input$Mod1Step3_Vi,
                                                      rep(0,(nb.IS*nb.IS)-1)),
                                                    nb.IS), 
                                     class = "numeric"),
            numericInput("Mod1Step3_Vbx","", 1-input$Mod1Step3_Vi-input$Mod1Step3_Ve),
            shinyMatrix::matrixInput("Mod1Step3_B", value = matrix(c(0,Mod1Step3updateB(input),0,0),1), class = "numeric"),
            checkboxInput("Mod1Step3_X1_state", "", value = TRUE),
            checkboxInput("Mod1Step3_X1_sto_state", "", value = TRUE),
            checkboxInput("Mod1Step3_X1_sto_shared", "", value = FALSE),
            numericInput("Mod1Step3_X1_sto_V","", 1, min = 0, max = 1, step = 0.001)
          )
        }),
 	outputOptions(output, "Mod1Step3_hidden", suspendWhenHidden = FALSE),
 	
	  # display variable (Unknown environmental effect Vbx)
	  output$Mod1Step3_Vbx_txt <- renderUI({

	    if(!testInput(input$Mod1Step3_Vbx, Modules_VAR$Vbx, FALSE, FALSE)){
	      output <- span(strong(round(input$Mod1Step3_Vbx,2),class="alert alert-danger"))
	    }else{
	      output <- span(round(input$Mod1Step3_Vbx,2))
	    }

	    p(withMathJax(HTML(paste(strong(Modules_VAR$Vbx$label), output,""))))
	  }),

    ######### Run simulation #########
   	# Run simulation and return results
   	Mod1Step3_output <- reactive({
   	  if(input$Mod1Step3_Run == 0) # if Run button is pressed
   	    return(NULL)
   	  #hide extra results if sim was run before
   	  hide("Mod1Step3_plot2")
   	  hide("Mod1Step3_summary_table")

   	  hide("hide")
   	  show("show")
   	  
   	  isolate({

   	    updateCheckboxInput(session, "isRunning", value = TRUE)

   	    # Call app main function
   	    data <- squid::squidR(input, module="Mod1Step3")

   	    LMR      <- lme4::lmer(Phenotype ~ 0 + (1|Individual), data = data$sampled_data)
   	    RANDEF   <- as.data.frame(lme4::VarCorr(LMR))$vcov

   	    data$Vi            <- round(RANDEF[1],2)
   	    data$Vr            <- round(RANDEF[2],2)
   	    data$Vp            <- round(data$Vi + data$Vr,2)
   	    data$phenotypeMean <- round(mean(data$sampled_data$Phenotype),2)
   	    data$R             <- round(data$Vi / (data$Vi + data$Vr),2)

   	    updateCheckboxInput(session, "isRunning", value = FALSE)

   	    return(data)
   	  })
   	}),

    ######### Display results (graph) #########
     	# Graph: density distribution of true values (Vp)
     	#        density distribution of blups (Vi)
     	#        density distribution of environnemental effect (Vx1)
     	#        density distribution of deviation from blups (Ve)
     	output$Mod1Step3_plot <- renderPlot({

     	  data      <- Mod1Step3_output()

     	  if(!is.null(data)){

     	    Vp        <- paste("Vp = "   , data$Vp)
     	    Vi        <- paste("Vi = "   , data$Vi)
     	    Vr        <- paste("Vr (Vbx + Vm) = "  , data$Vr)

     	    myFactor  <- factor(rep(c(Vp,Vi,Vr), each=length(data$sampled_data$Phenotype)), levels=c(Vp,Vi,Vr))

     	    mydata    <- data.frame(dens  = c(data$sampled_data$Phenotype,
     	                                      data$sampled_data$I,
     	                                      (data$sampled_data$B1 * data$sampled_data$X1) + data$sampled_data$e),
     	                            lines = myFactor)

     	    ggplot(mydata, aes(dens, fill=lines, colour=lines)) +
     	    	geom_density(alpha = 0.1) +
     	    	geom_rug(aes(col=lines)) +
     	    	facet_wrap(~ lines) +
     	    	xlab("Simulated values") +
     	    	ylab("Density") +
     	      theme(plot.title      = element_text(hjust = 0.5),
     	                     legend.title    = element_blank(),
     	                     legend.position = "bottom") + ggtitle("Measurement error variance (spread)")

     	  }else{
     	    defaultPlot()
     	  }

   	}),
# display results: repeatability (text)
output$Mod1Step3_Rep_txt   <- renderText({
  data <- Mod1Step3_output()
  HTML(paste("Your repeatability is ", ifelse(!is.null(data), data$R,"...")))
}),

  #button to show extra results, keeps things clean
  observeEvent(input$show, {
 	  # Scatter plot: measurements correlation
   	output$Mod1Step3_plot2 <- renderPlot({

   	  if(!is.null(Mod1Step3_output())){

   	    data         <- Mod1Step3_output()$sampled_data
   	    phen_time1   <- subset(data, data$Time == data$Time[1], select=Phenotype)
   	    phen_time2   <- subset(data, data$Time == data$Time[2], select=Phenotype)
   	    data_plot <- data.frame("phen_time1"=phen_time1$Phenotype, "phen_time2"=phen_time2$Phenotype)

   	    ggplot(data_plot, aes(x=phen_time1, y=phen_time2)) +
   	    	geom_point(size=3, color=color$color2) +
   	    	xlab("First measurement")  +
   	    	ylab("Second measurement")

   	  }else{defaultPlot()}
   	})

   	# Display results (table)
   	output$Mod1Step3_summary_table <- renderUI({

   	  data      <- Mod1Step3_output()

   	  myTable <- data.frame("Parameter" = c(
   	    paste("Total phenotypic variance ($V_",NOT$total,"$) ="),
   	    paste("Individual variance ($V_",NOT$devI,"$) ="),
   	    paste("Residual variance ($V_{",NOT$mean," ",NOT$env,"}+V_",NOT$mError,"$) ="),
   	    "Mean of the trait ($\\mu$) ="
   	  ),
   	                      "Truth"     = c(1,
   	                                       input$Mod1Step3_Vi,
   	                                       input$Mod1Step3_Ve+input$Mod1Step3_Vbx,
   	                                       0),
   	                        "Estimated" = c(ifelse(!is.null(data),data$Vp,"..."),
               	                            ifelse(!is.null(data),data$Vi,"..."),
               	                            ifelse(!is.null(data),data$Vr,"..."),
               	                            ifelse(!is.null(data),data$phenotypeMean,"..."))
               	)

   	  getTable(myTable)
   	})


    ######### Manage errors #########
     	# display error message
     	observe({
     	  if(!testInput(input$Mod1Step3_Vbx, Modules_VAR$Vbx, FALSE, FALSE)){
     	    disableActionButton("Mod1Step3_Run", session, "true")
     	  }else{
     	    disableActionButton("Mod1Step3_Run", session, "false")
     	  }
     	})
 	    output$Mod1Step3_error_Vbx  <- renderUI({testInput(input$Mod1Step3_Vbx, Modules_VAR$Vbx, FALSE, TRUE)})
 	    
 	    show("Mod1Step3_plot2")
 	    show("Mod1Step3_summary_table")

 	    hide("show")
 	    show("hide")
 	    
 	    
  }), 
  observeEvent(input$hide, {
    hide("Mod1Step3_plot2")
    hide("Mod1Step3_summary_table")

    hide("hide")
    
    show("show")
    
  })
  ) # End return