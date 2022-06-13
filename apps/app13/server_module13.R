#Server functions for module 3 step 1
c(
    ######### Set variables #########    
      # Set hidden variables
       output$Mod3Step1_hidden <- renderUI({
          list(
            numericInput("Mod3Step1_NI", "", 100)
   
          )
        }),
 	outputOptions(output, "Mod3Step1_hidden", suspendWhenHidden = FALSE),

 	output$Mod3Step1_previewPlot <- renderPlot({ 
 	  
 	  myInput <- list("Preview_Tmax"   = Modules_VAR$Tmax$max,
 	                  "Preview_NI"     = input$Mod3Step1_NI,
 	                  "Preview_Vhsi"   = input$Mod3Step1_Vhsi,
 	                  "Preview_NR"     = input$Mod3Step1_NR,
 	                  "Preview_ST_ind" = FALSE
 	  )
 	  # Call app main function
 	  data <- squid::squidR(myInput, module="Preview", plot=TRUE)
 	  
 	  data$plots$sampTime
 	})

) # End return
