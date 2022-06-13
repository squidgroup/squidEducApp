#Server functions for module 3 step 2
c(
  
    ######### Set variables #########    
      # Set hidden variables (Tmax, Vi, ES_state, ES_sto_V and NR)
       output$Mod3Step2_hidden <- renderUI({
          list(
            numericInput("Mod3Step2_Tmax", "", Modules_VAR$Tmax$max),
            numericInput("Mod3Step2_NI", "", 100),
            getNumericInput("Mod3Step2_Tmax", Modules_VAR$Tmax, "")
            )
        }),
 	outputOptions(output, "Mod3Step2_hidden", suspendWhenHidden = FALSE),
 	
 	output$Mod3Step2_previewPlot <- renderPlot({ 
 	  
 	  input$Mod3Step2_previewPlot_btn
 	  
 	  myInput <- list("Preview_Tmax"   = Modules_VAR$Tmax$max,
 	                  "Preview_NI"     = input$Mod3Step2_NI,
 	                  "Preview_Vhsi"   = input$Mod3Step2_Vhsi,
 	                  "Preview_NR"     = input$Mod3Step2_NR,
 	                  "Preview_ST_ind" = FALSE
 	                  )
 	  # Call app main function
 	  data <- squid::squidR(myInput, module="Preview", plot=TRUE)
 	  print(data$plots$sampTime)
 	})
 	
 	) # End return