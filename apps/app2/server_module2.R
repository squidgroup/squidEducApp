#Server functions for module 1 step 2
c(
  
  #by default hide show and hide buttons
  hide("hide"),
  hide("show"),
    ######### Set hidden variables #########    
      # Set hidden variable (Tmax and Vi)
    
      output$Mod1Step2_hidden <- renderUI({
        list(
          numericInput("Mod1Step2_Tmax", "", Modules_VAR$Tmax$max),
          shinyMatrix::matrixInput("Mod1Step2_Vind", value = matrix(c(1-input$Mod1Step2_Ve,rep(0,(nb.IS*nb.IS)-1)),nb.IS), class = "numeric")
        )
      }),
      outputOptions(output, "Mod1Step2_hidden", suspendWhenHidden = FALSE),
        
    ######### Run simulation #########
      Mod1Step2_output <- reactive({
        if(input$Mod1Step2_Run == 0) # if Run button is pressed
          return(NULL)
        
        #hide extra results if sim was run before
        hide("Mod1Step2_summary_table")
        hide("Mod1Step2_plot2")
        
        hide("Mod1Step2_output")
        
        hide("hide")
        show("show")
        
        isolate({
          
          updateCheckboxInput(session, "isRunning", value = TRUE)
          
          # Call app main function
          data <- squid::squidR(input, module="Mod1Step2") 
          
          LMR      <- lme4::lmer(Phenotype ~ 0 + (1|Individual), data = data$sampled_data)
          RANDEF   <- as.data.frame(lme4::VarCorr(LMR))$vcov
          
          data$Vi            <- round(RANDEF[1],2)
          data$Ve            <- round(RANDEF[2],2)
          data$Vp            <- data$Vi + data$Ve
          data$phenotypeMean <- round(mean(data$sampled_data$Phenotype),2)
          data$R             <- round(data$Vi / data$Vp,2)
          
          updateCheckboxInput(session, "isRunning", value = FALSE)
          
          return(data)
        })  
      }),
    
    ######### Display results (graph) #########
      # Display results (graph)
      output$Mod1Step2_plot <- renderPlot({ 
        
        data      <- Mod1Step2_output()
        
        if(!is.null(data)){
          
          Vp        <- bquote(hat(V)[.(NOT$total)] == .(data$Vp))
          Vi        <- bquote(hat(V)[.(NOT$devI)] == .(data$Vi))
          Ve        <- bquote(hat(V)[.(NOT$mError)] == .(data$Ve))
          
          myFactor  <- factor(rep(c(Vp,Vi,Ve), each=length(data$sampled_data$Phenotype)), levels=c(Vp,Vi,Ve))
          mydata    <- data.frame(dens  = c(data$sampled_data$Phenotype,data$sampled_data$I, data$sampled_data$e),
                                  lines = myFactor)
          
           ggplot(mydata, aes(dens, fill=lines, colour=lines)) +
                     geom_density(alpha = 0.1) +
                     geom_rug(aes(col=lines)) +
                	   facet_wrap(~ lines, labeller=label_parsed) +
                     xlab("Simulated values") +
                     ylab("Density") +
                    scale_fill_discrete(labels=c(Vp, Vi, Ve))+
                    scale_colour_discrete(labels=c(Vp, Vi, Ve))+
                    theme(legend.title    = element_blank(),
                    legend.position = "bottom")
          

        }else{
          defaultPlot()
        }
                
      }),
      
  # display results: repeatability (text)
  output$Mod1Step2_Rep_txt   <- renderText({ HTML(paste("Your repeatability is ", ifelse(!is.null(Mod1Step2_output()), 
                                                                                         Mod1Step2_output()$R,"...")))}),
    #button to show extra results, keeps things clean
    observeEvent(input$show, {
      
      # Display results (table)
      output$Mod1Step2_summary_table <- renderUI({ 
        
        data <- Mod1Step2_output()
        
        myTable <- data.frame("Parameter"=c(paste("Total phenotypic variance", "($V_",NOT$total,"$) ="),
                                            paste("Individual variance","($V_",NOT$devI,"$) ="),
                                            paste("Measurement error variance","($V_",NOT$mError,"$) ="),
                              paste("Mean of the trait",")$\\mu$) = ")),
                              "Truth"     = c(1,
                                            1-input$Mod1Step2_Ve,
                                            input$Mod1Step2_Ve,
                                            0),
                              "Estimated"= c(ifelse(!is.null(data),data$Vp,"..."),
                                             ifelse(!is.null(data),data$Vi,"..."),
                                             ifelse(!is.null(data),data$Ve,"..."),
                                             ifelse(!is.null(data),data$phenotypeMean,"..."))
                              )
                  
        getTable(myTable)
        
      })

      # Display repeatability result (graph)
      output$Mod1Step2_plot2 <- renderPlot({ 
        
        if(!is.null(Mod1Step2_output())){
          
          data         <- Mod1Step2_output()$sampled_data
          phen_time1   <- subset(data, data$Time == data$Time[1], select=Phenotype)
          phen_time2   <- subset(data, data$Time == data$Time[2], select=Phenotype)
          data_plot <- data.frame("phen_time1"=phen_time1$Phenotype, "phen_time2"=phen_time2$Phenotype)
          
          ggplot(data_plot, aes(x=phen_time1, y=phen_time2)) + 
          	   geom_point(size=3, color=color$color2) +
	          	 xlab("First measurement")  +
	          	 ylab("Second measurement") + ggtitle("Measurement error variance (spread)")
          
        }else{defaultPlot()}
        
      })
      show("Mod1Step2_summary_table")
      show("Mod1Step2_plot2")
      
      show("Mod1Step2_output")
      
      hide("show")
      show("hide")
      
      
      }),
    
observeEvent(input$hide, {
  hide("Mod1Step2_summary_table")
  hide("Mod1Step2_plot2")
  hide("Mod1Step2_output")
  
  hide("hide")

  show("show")
  
})
            
  ) # End return