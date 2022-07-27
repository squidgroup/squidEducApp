#Server functions for module 1 step 1
c(
  hide("hide"),
  hide("show"),
  
    ######### Set hidden variables #########    
      output$Mod1Step1_hidden <- renderUI({
        # Intercepts and slopes (Co)variance matrix
        shinyMatrix::matrixInput("Mod1Step1_Vind", value=matrix(c(1-input$Mod1Step1_Ve,rep(0,(nb.IS*nb.IS)-1)),nb.IS), class = "numeric")
      }),
      outputOptions(output, "Mod1Step1_hidden", suspendWhenHidden = FALSE),

    ######### Run simulation #########
      Mod1Step1_output <- reactive({
      if(input$Mod1Step1_Run == 0) # if Run button is pressed
        return(NULL)
      
        #hide extra results if sim was run before
        hide("Mod1Step1_summary_table")
    
        hide("hide")
        show("show")
        
      isolate({     
        
        updateCheckboxInput(session, "isRunning", value = TRUE)
        
        # Call app main function      
        data <- squid::squidR(input, module="Mod1Step1") 
        
        data$Vp              <- round(var(data$sampled_data$Phenotype),2)
        data$phenotypeMean   <- round(mean(data$sampled_data$Phenotype),2)
        
        updateCheckboxInput(session, "isRunning", value = FALSE)
        
        return(data)
      })  
    }),    
    
    ######### Display results (graph) #########
      # Graph: density distribution of true and measured phenotypic values
      output$Mod1Step1_plot <- renderPlot({ 
        
        data  <- Mod1Step1_output()
        
        if(!is.null(data)){
          
          mydata    <- data.frame(dens = c(data$sampled_data$Phenotype, data$sampled_data$I)
                                  , lines = rep(c(paste("Total phenotype (",NOT$trait.1,")",sep=""), 
                                                  paste("Individual phenotype (",NOT$devI,")",sep="")), each = length(data$sampled_data$Phenotype)))
          
          ggplot(mydata, aes(dens, fill = lines, colour = lines)) +
    											geom_density(alpha = 0.1) +
    											geom_rug(aes(col=lines)) +
    											ggtitle("Distribution of total and individual phenotype values") +
    											xlab("Simluated phenotype values") +
    											ylab("Density") +
                          theme(legend.title    = element_blank(),
                                         legend.position = "bottom")
          
        }else{
          defaultPlot()
        }
        
      }),
  
  #button to show extra results, keeps things clean
  observeEvent(input$show, {
    
      # Text : display true and measured values (Vp, Vi and mean)   
      output$Mod1Step1_summary_table <- renderUI({ 
        
          data <- Mod1Step1_output()
        
          myTable <- data.frame("Parameter" = c(
          paste0("Total Phenotypic variance ($V_",NOT$total,"$) ="),
          paste0("Individual Variance ($V_",NOT$devI,"$) = "),
          paste0("Measurement error variance ($V_",NOT$mError,"$) = "),
          "Mean of the trait ($\\mu$)"
          ),
            "Truth"= c(1,
                      1-input$Mod1Step1_Ve,
                      input$Mod1Step1_Ve,
                      0),
            "Estimated" = c(ifelse(!is.null(data),data$Vp,"..."),
                            "",
                            "",
                            ifelse(!is.null(data),data$phenotypeMean,"..."))
            )
        
          getTable(myTable)
      }) 
      show("Mod1Step1_summary_table")
      
      hide("show")
      show("hide")
      
      
  }),
  
  observeEvent(input$hide, {
    hide("Mod1Step1_summary_table")
    
    hide("hide")
    
    show("show")
    
  })
            
) # End
