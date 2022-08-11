#Server functions for module 3 step 3
c(
    ######### Set variables #########
    # Set hidden variables
    output$Mod3Step3_hidden <- renderUI({
      list(
        numericInput("Mod3Step3_Tmax", "", Modules_VAR$Tmax$max),
        numericInput("Mod3Step3_NI", "", 100),
        shinyMatrix::matrixInput("Mod3Step3_Vind", value = matrix(c(input$Mod3Step3_Vi,rep(0,(nb.IS*nb.IS)-1)),nb.IS), class = "numeric"),
        shinyMatrix::matrixInput("Mod3Step3_B", value = matrix(c(0,sqrt(input$Mod3Step3_Vbx),0,0),1), class = "numeric"), 
        
        checkboxInput("Mod3Step3_X1_state", "", value = TRUE),
        
        checkboxInput("Mod3Step3_X1_sto_state", "", value = ifelse(input$Mod3Step3_X_select %in% c("sto","auto"),TRUE,FALSE)),
        checkboxInput("Mod3Step3_X1_sto_autocor_state", "", value = ifelse(input$Mod3Step3_X_select == "auto",TRUE,FALSE)),
        checkboxInput("Mod3Step3_X1_sto_shared", "", value = as.logical(input$Mod3Step3_X_Shared)),
        
        checkboxInput("Mod3Step3_X1_lin_state", "", value = ifelse(input$Mod3Step3_X_select == "lin",TRUE,FALSE)),
        checkboxInput("Mod3Step3_X1_lin_shared", "", value = as.logical(input$Mod3Step3_X_Shared)),
        
        checkboxInput("Mod3Step3_X1_cyc_state", "", value = ifelse(input$Mod3Step3_X_select == "cyc",TRUE,FALSE)),
        checkboxInput("Mod3Step3_X1_cyc_shared", "", value = as.logical(input$Mod3Step3_X_Shared)),
        
        checkboxInput("Mod3Step3_ST_ind", "", value = FALSE)
      )
    }),
    outputOptions(output, "Mod3Step3_hidden", suspendWhenHidden = FALSE),
    
    ######### Run simulation #########
    # Run simulation and return results
    Mod3Step3_output_2 <- reactive({
      if(input$Mod3Step3_Run2 == 0) # if Run button is pressed
        return(NULL)
      
      isolate({
        
        updateCheckboxInput(session, "isRunning", value = TRUE)
        
        # Call app main function
        data <- squid::squidR(input, module="Mod3Step3")  
        
        LMR      <- lmer(Phenotype ~ 1 + (1|Individual), data = data$sampled_data)
        FIXEF    <- fixef(LMR)
        SE.FIXEF <- se.fixef(LMR)
        RANDEF   <- as.data.frame(VarCorr(LMR))$vcov
        
        data$Vi     <- round(RANDEF[1],2)
        data$Vr     <- round(RANDEF[2],2)
        data$B0     <- round(FIXEF["(Intercept)"],2)
        data$se.B0  <- round(SE.FIXEF["(Intercept)"],2)
        
        ##
        myInput <- reactiveValuesToList(input)
        myInput[["Mod3Step3_B"]]  <- matrix(c(0, sqrt(input$Mod3Step3_Vbx*input$Mod3Step3_Vbx_proportion),0,0),1)
        myInput[["Mod3Step3_Ve"]] <- ((1-input$Mod3Step3_Vbx_proportion)*input$Mod3Step3_Vbx) + input$Mod3Step3_Ve
        data2     <- squid::squidR(myInput, module="Mod3Step3")
        
        LMR2      <- lmer(Phenotype ~ 1 + X1 + (1|Individual), data = data2$sampled_data)
        FIXEF2    <- fixef(LMR2)
        SE.FIXEF2 <- se.fixef(LMR2)
        RANDEF2   <- as.data.frame(VarCorr(LMR2))$vcov
        
        data$Vi_2      <- round(RANDEF2[1],2)
        data$Vr_2      <- round(RANDEF2[2],2)
        data$B1_2      <- round(FIXEF2["X1"],2)
        data$se.B1_2   <- round(SE.FIXEF2["X1"],2)
        data$B0_2      <- round(FIXEF2["(Intercept)"],2)
        data$se.B0_2   <- round(SE.FIXEF2["(Intercept)"],2)
        
        updateCheckboxInput(session, "isRunning", value = FALSE)
        
        return(data)
      })  
    }),
    
    Mod3Step3_table <- function(data, proportion){
      
      myTable <- data.frame("Parameter" = c("Parameter",
        paste("Population intercept $(",EQ3$mean0,")$ ="),
        paste("Individual variance $(V_",NOT$devI,")$ ="),
        "",
        paste("Environmental effect variance $(V_",NOT$envEffect,")$ ="),
        paste("Mean environmental effect $(",NOT$mean,")$ =")
      ),
        "Truth"       = c("Truth",
                                             0,
                                             input$Mod3Step3_Vi,
                                             paste("Measurement error variance $(V_",NOT$mError,")$ =",input$Mod3Step3_Ve),
                                             input$Mod3Step3_Vbx,
                                             round(input$Mod3Step3_B[2],2)),
                            "Estimated for unknown environment" = c("Totally unknown environment",
                                                              ifelse(!is.null(data),paste(data$B0,"\U00b1", data$se.B0, sep=" "),"..."),
                                                              ifelse(!is.null(data),data$Vi,"..."),
                                                              paste("Residual variance $(\\hat{V}_",NOT$residualUpper,")$ = "        ,ifelse(!is.null(data),data$Vr,"...")),
                                                              "",
                                                              ""),
                            "Estimated for known environment" = c(paste0("Environment known (proportion=",proportion,")"),
                                                   ifelse(!is.null(data),paste(data$B0_2,"\U00b1", data$se.B0_2, sep=" "),"..."),
                                                   ifelse(!is.null(data),data$Vi_2,"..."),
                                                    paste("Residual variance $(\\hat{V}_",NOT$residualUpper,")$ = ", ifelse(!is.null(data),data$Vr_2,"...")),
                                                    ifelse(!is.null(data),data$B1_2^2,"..."),
                                                    ifelse(!is.null(data),paste(data$B1_2,"\U00b1", data$se.B1_2, sep=" "),"..."))
      )  
    
        return(getTable(myTable, header=TRUE))
    },  
    
    output$Mod3Step3_summary_table_2 <- renderUI({
      # data   <- Mod3Step3_output()
      data   <- Mod3Step3_output_2()
      Mod3Step3_table(data, as.character(round(input$Mod3Step3_Vbx_proportion,2)))
    }),

    observe({
      updateSliderInput(session, "Mod3Step3_Vhsi", value = input$Mod3Step3_Vhsi2)
    }),

    observe({
      updateSliderInput(session, "Mod3Step3_Vhsi2", value = input$Mod3Step3_Vhsi)
    }),

    output$Mod3Step3_Vi_proportion  <- renderText({paste0("(",round(input$Mod3Step3_Vi / (input$Mod3Step3_Vi + input$Mod3Step3_Vbx + input$Mod3Step3_Ve),2)*100,"%)")}),
    output$Mod3Step3_Ve_proportion  <- renderText({paste0("(",round(input$Mod3Step3_Ve / (input$Mod3Step3_Vi + input$Mod3Step3_Vbx + input$Mod3Step3_Ve),2)*100,"%)")}),
    output$Mod3Step3_Vbx_proportion <- renderText({paste0("(",round(input$Mod3Step3_Vbx / (input$Mod3Step3_Vi + input$Mod3Step3_Vbx + input$Mod3Step3_Ve),2)*100,"%)")}),

    ######### Manage errors #########
    # display error message
    observe({
      if(
        !testInput(input$Mod3Step3_X1_sto_V, FullModel_VAR$stoV, FALSE, FALSE) ||
        !testInput(input$Mod3Step3_X1_sto_corr, FullModel_VAR$stoCorr, FALSE, FALSE)){
      	disableActionButton("Mod3Step3_Run", session, "true")
      }else{
      	disableActionButton("Mod3Step3_Run", session, "false")
      }
    }),

    output$Mod3Step3_error_sto_V     <- renderUI({testInput(input$Mod3Step3_X1_sto_V, FullModel_VAR$stoV, FALSE, TRUE)}),
    output$Mod3Step3_error_sto_corr  <- renderUI({testInput(input$Mod3Step3_X1_sto_corr, FullModel_VAR$stoCorr, FALSE, TRUE)})
    
  ) # End return