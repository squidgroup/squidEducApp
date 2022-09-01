#Server functions for module 5 step 2
c(
    ######### Set variables #########
    # Set hidden variables
    Mod5Step2updateVind <- function(input, nb.IS){
      m <- matrix(rep(0,nb.IS*nb.IS),nb.IS)
      diag(m)[1] <- input$Mod5Step2_Vi
      return(m)
    },
    # Set hidden variables
    output$Mod5Step2_hidden <- renderUI({
      list(
        numericInput("Mod5Step2_Tmax", "", Modules_VAR$Tmax$max),
        shinyMatrix::matrixInput("Mod5Step2_Vind", value = Mod5Step2updateVind(input, nb.IS), class = "numeric"),
        shinyMatrix::matrixInput("Mod5Step2_B", value = matrix(c(0,input$Mod5Step2_B1,input$Mod5Step2_B2,input$Mod5Step2_B12),1), class = "numeric"),
        checkboxInput("Mod5Step2_X1_state", "", value = TRUE),
        checkboxInput("Mod5Step2_X1_sto_state", "", value = TRUE),
        checkboxInput("Mod5Step2_X2_state", "", value = TRUE),
        checkboxInput("Mod5Step2_X2_sto_state", "", value = TRUE),
        checkboxInput("Mod5Step2_X_Interaction", "", value = TRUE)
      )
    }),
    outputOptions(output, "Mod5Step2_hidden", suspendWhenHidden = FALSE),
    
    Mod5Step2_output <- reactive({
      
      if (input$Mod5Step2_Run == 0) # if Run button is pressed
        return(NULL)
      
      isolate({ 
        
        updateCheckboxInput(session, "isRunning", value = TRUE)
        
        # Call app main function
        data <- squid::squidR(input, module = "Mod5Step2")  
        
        # Model 1
        LMR1     <- lme4::lmer(Phenotype ~ 1 + X1 + X2 + (1|Individual), data = data$sampled_data)
        FIXEF    <- lme4::fixef(LMR1)
        SE.FIXEF <- arm::se.fixef(LMR1)
        RANDEF   <- as.data.frame(lme4::VarCorr(LMR1))$vcov
        
        data$Vi_1      <- round(RANDEF[1],2)
        data$Vr_1      <- round(RANDEF[2],2)
        data$VE_1      <- 0
        
        data$B1_1      <- round(FIXEF["X1"],2)
        data$se.B1_1   <- round(SE.FIXEF["X1"],2)
        
        data$B2_1      <- round(FIXEF["X2"],2)
        data$se.B2_1   <- round(SE.FIXEF["X2"],2)
        
        # Model 2
        LMR2     <- lme4::lmer(Phenotype ~ 1 + X1 + X2 + X1X2 + (1|Individual), data = data$sampled_data)
        FIXEF    <- lme4::fixef(LMR2)
        SE.FIXEF <- arm::se.fixef(LMR2)
        RANDEF   <- as.data.frame(lme4::VarCorr(LMR2))$vcov
        
        data$Vi_2      <- round(RANDEF[1],2)
        data$Vr_2      <- round(RANDEF[2],2) 
        data$VE_2      <- 0
        
        data$B1_2      <- round(FIXEF["X1"],2)
        data$se.B1_2   <- round(SE.FIXEF["X1"],2)
        
        data$B2_2      <- round(FIXEF["X2"],2)
        data$se.B2_2   <- round(SE.FIXEF["X2"],2)
        
        data$B12_2     <- round(FIXEF["X1X2"],2)
        data$se.B12_2  <- round(SE.FIXEF["X1X2"],2)
        
        data$sampled_data$Phenotype_predict <- stats::predict(LMR2)
        
        
        updateCheckboxInput(session, "isRunning", value = FALSE)
        
        return(data)
      })  
    }),
    
    
    # Display results (table)
    output$Mod5Step2_summary_table <- renderUI({
      
      data    <- Mod5Step2_output()
      
      myTable <- data.frame(
        "Parameter" = c("Parameter","",
               paste0("$",EQ3$mean1,"$ = "),
               paste0("$",EQ3$mean2,"$ = "),
               paste0("$",EQ3$mean12,"$ = "),
               paste0("Individual variance ($V_",NOT$devI,"$) = "),
               paste0("Environmental variance ($V_",NOT$envEffect,"$) = "),
              paste0("Measurement variance ($V_",NOT$mError,"$) = ")
        ),
        "True" = c("Truth","",
                   input$Mod5Step2_B[2],
                   input$Mod5Step2_B[3],
                   input$Mod5Step2_B[4],
                   input$Mod5Step2_Vi,
                   sum(input$Mod5Step2_B[2:nb.IS]^2),
                   input$Mod5Step2_Ve),
        
        "Estimated1"  = c("Estimated",
                          "(ommitting interaction)",
                         ifelse(!is.null(data),paste(data$B1_1,"\U00b1", data$se.B1_1),"..."),
                          ifelse(!is.null(data),paste(data$B2_1,"\U00b1", data$se.B2_1),"..."),
                          "-",
                          ifelse(!is.null(data),data$Vi_1,"..."),
                          ifelse(!is.null(data),sum(c(data$B1,data$B2_1)^2),"..."),
                          ifelse(!is.null(data),data$Vr_1,"...")),
        
        "Estimated2"  = c("",
                          "(with interaction)",
                          ifelse(!is.null(data),paste(data$B1_2,"\U00b1", data$se.B1_2),"..."),
                          ifelse(!is.null(data),paste(data$B2_2,"\U00b1", data$se.B2_2),"..."),
                          ifelse(!is.null(data),paste(data$B12_2,"\U00b1", data$se.B12_2),"..."),
                          ifelse(!is.null(data),data$Vi_2,"..."),
                          ifelse(!is.null(data),sum(c(data$B1_2, data$B2_2, data$B12_2)^2),"..."),
                          ifelse(!is.null(data),data$Vr_2,"..."))) 
      
      getTable(myTable, header = TRUE)
      
    }),
  
    # Display 3D figure
    output$Mod5Step2_3D <- renderPlotly({
      
      data <- Mod5Step2_output()$sampled_data
      
      isolate({
        
        if (!is.null(data)) {
        
          X_seq <- seq(from = min(data[ , c("X1", "X2")]), to = max(data[ , c("X1", "X2")]), length.out = 10)
          
          predictors      <- cbind("intecept" = 1, expand.grid("X1" = X_seq, "X2" = X_seq))
          predictors$X1X2 <- predictors$X1 * predictors$X2
          
          Phenotype_mean <- as.matrix(predictors) %*% as.vector(input$Mod5Step2_B)
          Phenotype_mean <- t(matrix(Phenotype_mean, nrow = length(X_seq), ncol = length(X_seq)))
          
          plotly::plot_ly(hoverinfo = "none")  %>%
            plotly::add_surface(x = X_seq, y = X_seq, z = Phenotype_mean, opacity = 0.7,
                        colorscale = list(c(0, 1), c("black", "black"))) %>%
            plotly::add_markers(data = data, x = ~X1, y = ~X2, z = ~Phenotype, color = ~Individual, size=4) %>%
            plotly::layout(showlegend = FALSE) %>%
            plotly::hide_colorbar()
        
        }else{defaultPlot()}
          
      })
    })
   
) # End return
