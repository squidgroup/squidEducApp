#Server functions for module 4 step 5
c(
  hide("hide"),
  hide("show"),

  hide("hide2"),
  hide("show2"),

  hide("downloadData"),
  
    ######### Set variables #########    
    # Set hidden variables
    Mod4Step5updateVind <- function(input, nb.IS){
      m <- matrix(rep(0,(nb.IS*2)^2),(nb.IS*2))
      diag(m)[1]         <- input$Mod4Step5_Vi1
      diag(m)[1 + nb.IS] <- input$Mod4Step5_Vi2
      m[nb.IS + 1,1]     <- input$Mod4Step5_Corr_I
      return(m)
    },
    Mod4Step5updateB <- function(input, nb.IS){
    	m <- matrix(rep(0,(nb.IS*2)), nrow = 1)
    	m[1,2]             <- input$Mod4Step5_B11
    	m[1,nb.IS + 2]     <- input$Mod4Step5_B12
    	return(m)
    },
     output$Mod4Step5_hidden <- renderUI({
        list(
          numericInput("Mod4Step5_Tmax", "", Modules_VAR$Tmax$max),
          numericInput("Mod4Step5_NI", "", 100),
          numericInput("Mod4Step5_NT", "", 2),
          numericInput("Mod4Step5_NR", "", 10),
          shinyMatrix::matrixInput("Mod4Step5_B", value = Mod4Step5updateB(input, nb.IS), class = "numeric"),
          shinyMatrix::matrixInput("Mod4Step5_Vind", value = Mod4Step5updateVind(input, nb.IS), class = "numeric"),
          shinyMatrix::matrixInput("Mod4Step5_Ve", value = matrix(c(input$Mod4Step5_Ve1,   input$Mod4Step5_Corr_e,
                                                       input$Mod4Step5_Corr_e, input$Mod4Step5_Ve2), 2), class = "numeric"),
          
          checkboxInput("Mod4Step5_X1_state", "",     value = TRUE),
          checkboxInput("Mod4Step5_X1_sto_state", "", value = TRUE)
        )
     }),
    outputOptions(output, "Mod4Step5_hidden", suspendWhenHidden = FALSE),

    # get data from squidR()
    get_data <- function(){
      
      # Call app main function
      data <- squid::squidR(input, module = "Mod4Step5")
      
      dt <- as.data.table(data$sampled_data)
      dt <- dt[ , .(Time, Individual, Trait, Phenotype, X1)]
      dt[ , Trait := paste0("Phenotype_", Trait)]
      dt <- dcast(dt, Time + Individual + X1 ~ Trait, value.var = "Phenotype")
      
      return(list("sampled" = dt, "full_data" = data$full_data))
    },
    
    ######### Run simulation #########
    # Run simulation and return results
    Mod4Step5_output <- reactive({
    	if (input$Mod4Step5_Run == 0) # if Run button is pressed
    		return(NULL)
    	
      hide("hide")
      show("show")
      hide("hide2")
      show("show2")
      show("downloadData")
      
    	isolate({
    		
    		updateCheckboxInput(session, "isRunning", value = TRUE)
    	  dt <- get_data()
    		updateCheckboxInput(session, "isRunning", value = FALSE)
    		
    		return(dt)
    	})
    }),
    
    observe({
      
      data  <- Mod4Step5_output()
      
      if(is.null(data)){
        disableActionButton("Mod4Step5_Run_1", session, "true")
        disableActionButton("Mod4Step5_Run_2", session, "true")
      }else{
        disableActionButton("Mod4Step5_Run_1", session, "false")
        disableActionButton("Mod4Step5_Run_2", session, "false")
      }
    }),
    
    output$Mod4Step5_correlationplot <- renderPlot({
    	
    	data  <- Mod4Step5_output()
    	
    	if (!is.null(data)) {
    		
    		dt <- copy(data[["sampled"]])
    		
    		ggplot(dt, aes(x = Phenotype_1, Phenotype_2,  fill = as.factor(Individual), colour = as.factor(Individual))) +
    			geom_point() +
    			xlab("Phenotype of trait y") +
    			ylab("Phenotype of trait z") +
    		  theme(legend.position="none") + ggtitle("Phenotypic association")
    		
    	}else{
    	  sim_msg()
    		# defaultPlot()
    	}
    	
    }),
    
    output$Mod4Step5_correlationplot2 <- renderPlot({

    	data  <- Mod4Step5_output()

    	if (!is.null(data)) {

    		dt <- copy(data[["sampled"]])
    		dt <- dt[ , .(Phenotype_1 = mean(Phenotype_1),
    									Phenotype_2 = mean(Phenotype_2)), by = Individual]

    		ggplot(dt, aes(x = Phenotype_1, Phenotype_2,  fill = as.factor(Individual), colour = as.factor(Individual))) +
    			geom_point() +
    			xlab("Mean phenotype of trait y") +
    			ylab("Mean phenotype of trait z") +
    		  theme(legend.position="none") + ggtitle("Among-individual correlation")

    	}else{
    		defaultPlot()
    	}

    }),

    output$Mod4Step5_correlationplot3 <- renderPlot({

    	data  <- Mod4Step5_output()

    	if (!is.null(data)) {

    		dt <- copy(data[["sampled"]])
    		dt[ , ':='(Phenotype_1 = Phenotype_1 - mean(Phenotype_1),
    							 Phenotype_2 = Phenotype_2 - mean(Phenotype_2)), by = Individual]

    		ggplot(dt, aes(x = Phenotype_1, Phenotype_2,  fill = as.factor(Individual), colour = as.factor(Individual))) +
    			geom_point() +
    			xlab("Deviation from individual phenotype mean of trait y") +
    			ylab("Deviation from individual phenotype mean of trait z") +
    		  theme(legend.position="none") + ggtitle("Within-individual correlation")

    	}else{
    		defaultPlot()
    	}

    }),

    output$Mod4Step5_environment <- renderPlot({

    	data  <- Mod4Step5_output()

    	if (!is.null(data)) {

    		dt <- copy(data[["full_data"]])
    		dt <-  dt[1:(input$Mod4Step5_Tmax),]

    		ggplot(dt, aes(x = Time, y = X1,  fill = as.factor(Individual), colour = as.factor(Individual))) +
    			geom_point() +
    			xlab("Time") +
    			ylab("Environment value")+ theme(legend.position="none") + ggtitle("Change in environment")

    	}else{
    		defaultPlot()
    	}

    }),
    
     output$Mod4Step5_Phenotypic_Equation <- renderUI({

     	eq <- paste0("$$",
     					 NOT$trait.1,"_{",NOT$time,NOT$ind,"} = 
     					 (0 + ",EQ$dev0.1,") + 
     					 ",input$Mod4Step5_B11,NOT$env,"_{",NOT$time,NOT$ind,"} +
     					 ",NOT$error,"_{",NOT$trait.1,NOT$time,NOT$ind,"}$$
     					 
     					 $$", 
     					 NOT$trait.2,"_{",NOT$time,NOT$ind,"} = 
     					 (0 + ",EQ$dev0.2,") + 
     					 ",input$Mod4Step5_B12,NOT$env,"_{",NOT$time,NOT$ind,"} +
     					 ",NOT$error,"_{",NOT$trait.2,NOT$time,NOT$ind,"}
     					 $$")
     	
       return(withMathJax(eq))
     }),
    
    
    Matrices <- reactive({
      
      cov1 <- round(input$Mod4Step5_Corr_I * sqrt(input$Mod4Step5_Vi1 * input$Mod4Step5_Vi2),3)
      eq1 <- paste0(
        "$$ \\Omega_{",NOT$devI,"}=
        		\\begin{pmatrix}
          		V_{",NOT$devI,"_",NOT$trait.1,"} & Cov_{",NOT$devI,"_",NOT$trait.1,",",NOT$devI,"_",NOT$trait.2,"}  \\\\
          		Cov_{",NOT$devI,"_",NOT$trait.1,",",NOT$devI,"_",NOT$trait.2,"} & V_{", NOT$devI,"_",NOT$trait.2,"} \\\\
        		\\end{pmatrix} 
        		=
        		\\begin{pmatrix}
          		",input$Mod4Step5_Vi1," & ",cov1," \\\\
          		",cov1," & ",input$Mod4Step5_Vi2,"\\\\
        		\\end{pmatrix} 
    		 $$")
      
      cov2 <- round(input$Mod4Step5_Corr_e * sqrt(input$Mod4Step5_Ve1 * input$Mod4Step5_Ve2),3)
      eq2 <- paste0(
        "$$ \\Omega_{",NOT$error,"}=
        		\\begin{pmatrix}
          		V_{",NOT$error,"_",NOT$trait.1,"} & Cov_{",NOT$error,"_",NOT$trait.1,",",NOT$error,"_",NOT$trait.2,"}  \\\\
          		Cov_{",NOT$error,"_",NOT$trait.1,",",NOT$error,"_",NOT$trait.2,"} & V_{", NOT$error,"_",NOT$trait.2,"} \\\\
        		\\end{pmatrix} 
        		=
        		\\begin{pmatrix}
          		",input$Mod4Step5_Ve1," & ",cov2," \\\\
          		",cov2," & ",input$Mod4Step5_Ve2,"\\\\
        		\\end{pmatrix} 
    		 $$")
      
      return(withMathJax(paste0(eq1, eq2)))
      
    }),
    
    output$Mod4Step5_Matrices_1 <- renderUI({Matrices()}),
    output$Mod4Step5_Matrices_2 <- renderUI({Matrices()}),
  
  #by default hide
  hide("Mod4Step5_Matrices_1"),
  hide("Mod4Step5_Matrices_2"),
  hide("Mod4Step5_Phenotypic_Equation"),
  
  #by default hide
  hide("Mod4Step5_correlationplot"),
  hide("Mod4Step5_correlationplot2"),
  hide("Mod4Step5_correlationplot3"),
  hide("Mod4Step5_environment"),
  
  # Display hidden results
  observeEvent(input$show, {
    
    show("Mod4Step5_Matrices_1")
    show("Mod4Step5_Matrices_2")
    show("Mod4Step5_Phenotypic_Equation")
    
    hide("Mod4Step5_correlationplot")
    hide("Mod4Step5_correlationplot2")
    hide("Mod4Step5_correlationplot3")
    hide("Mod4Step5_environment")
    
    show("show2")
    hide("hide2")
    
    hide("show")
    show("hide")
    
  }),
  
  #hide displayed results
  observeEvent(input$hide, {
    hide("Mod4Step5_Matrices_1")
    hide("Mod4Step5_Matrices_2")
    hide("Mod4Step5_Phenotypic_Equation")
    
    hide("hide")
    show("show")
    
  }),
  
  # Display hidden results
  observeEvent(input$show2, {
    
    hide("Mod4Step5_Matrices_1")
    hide("Mod4Step5_Matrices_2")
    hide("Mod4Step5_Phenotypic_Equation")
    
    show("show")
    hide("hide")
    
    show("Mod4Step5_correlationplot")
    show("Mod4Step5_correlationplot2")
    show("Mod4Step5_correlationplot3")
    show("Mod4Step5_environment")
    
    hide("show2")
    show("hide2")
    
  }),
  
  observeEvent(input$hide2, {
    hide("Mod4Step5_correlationplot")
    hide("Mod4Step5_correlationplot2")
    hide("Mod4Step5_correlationplot3")
    hide("Mod4Step5_environment")
    
    hide("hide2")
    show("show2")
    
  }),
  
  output$downloadData <- downloadHandler(
    filename = function() {
      paste("squid", ".RData", sep = "")
    },
    content = function(file) {
      saveRDS(get_data(), file)
    }
  )
  
    ) # End return
