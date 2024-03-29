#Server functions for module 8 step 1
c(
    
    ####### Part 1 ############################################################################
    
    ######### Set variables ######### 
    Mod8Step1updateVind <- function(input, nb.IS){
    	m <- matrix(rep(0,nb.IS*nb.IS),nb.IS)
    	diag(m)[1] <- input$Mod8Step1_Vi
    	diag(m)[2] <- input$Mod8Step1_Vs1
    	m[2,1]     <- input$Mod8Step1_CorIS1
    	return(m)
    },
    Mod8Step1updateB    <- function(input){
        m <- matrix(c(0,
                      input$Mod8Step1_B1,
                      input$Mod8Step1_B2, 
                      input$Mod8Step1_B12), 1)
        return(m)
    },
    
    # Set hidden variables
    output$Mod8Step1_hidden <- renderUI({
        list(
          numericInput("Mod8Step1_Tmax", "", Modules_VAR$Tmax$max),
          numericInput("Mod8Step1_NI", "",100),
          numericInput("Mod8Step1_NR", "",20),
          
          shinyMatrix::matrixInput("Mod8Step1_Vind", value = Mod8Step1updateVind(input, nb.IS), class = "numeric"),
          shinyMatrix::matrixInput("Mod8Step1_B", value = Mod8Step1updateB(input), class = "numeric"),
          
          checkboxInput("Mod8Step1_X1_state", "",      value = TRUE),
          checkboxInput("Mod8Step1_X1_sto_state", "",  value = TRUE),
          checkboxInput("Mod8Step1_X1_sto_shared", "", value = FALSE),
          
          checkboxInput("Mod8Step1_X2_state", "",      value = TRUE),
          checkboxInput("Mod8Step1_X2_sto_state", "",  value = TRUE),
          checkboxInput("Mod8Step1_X2_sto_shared", "", value = FALSE),
          
          checkboxInput("Mod8Step1_X_Interaction", "", value = TRUE)
        )
     }),
    outputOptions(output, "Mod8Step1_hidden", suspendWhenHidden = FALSE),
    
    ######### Run simulation #########
    # Run simulation and return results
    Mod8Step1_output <- reactive({
        
        if (input$Mod8Step1_Run == 0) # if Run button is pressed
            return(NULL)
        
        isolate({ 
            
            updateCheckboxInput(session, "isRunning", value = TRUE)
            
            # Call app main function
            data <- squid::squidR(input, module = "Mod8Step1")  
            
            # model with random slope
            LMR      <- lme4::lmer(Phenotype ~ 1 + X1*X2 + (1 + X1|Individual), data = data$sampled_data)
            FIXEF    <- lme4::fixef(LMR)
            SE.FIXEF <- arm::se.fixef(LMR)
            RANDEF   <- as.data.frame(lme4::VarCorr(LMR))$vcov
            
            data$LMR       <- LMR
            
            data$Vi_1      <- round(RANDEF[1],2)
            data$Vs1_1     <- round(RANDEF[2],2)
            data$COVis1_1  <- round(RANDEF[3],2)
            data$Vr_1      <- round(RANDEF[4],2) 

            data$B0_1      <- round(FIXEF["(Intercept)"],2)
            data$se.B0_1   <- round(SE.FIXEF["(Intercept)"],2)
                        
            data$B1_1      <- round(FIXEF["X1"],2)
            data$se.B1_1   <- round(SE.FIXEF["X1"],2)
            
            data$B2_1      <- round(FIXEF["X2"],2)
            data$se.B2_1   <- round(SE.FIXEF["X2"],2)
            
            data$B12_1     <- round(FIXEF["X1:X2"],2)
            data$se.B12_1  <- round(SE.FIXEF["X1:X2"],2)
            
            #--------------------
            # model without random slope
            LMR2     <- lme4::lmer(Phenotype ~ 1 + X1*X2 + (1|Individual), data = data$sampled_data)
            FIXEF    <- lme4::fixef(LMR2)
            SE.FIXEF <- arm::se.fixef(LMR2)
            RANDEF   <- as.data.frame(lme4::VarCorr(LMR2))$vcov
            
            data$Vi_2      <- round(RANDEF[1],2)
            data$Vr_2      <- round(RANDEF[2],2)
            
            data$B0_2      <- round(FIXEF["(Intercept)"],2)
            data$se.B0_2   <- round(SE.FIXEF["(Intercept)"],2)
            
            data$B1_2      <- round(FIXEF["X1"],2)
            data$se.B1_2   <- round(SE.FIXEF["X1"],2)
            
            data$B2_2      <- round(FIXEF["X2"],2)
            data$se.B2_2   <- round(SE.FIXEF["X2"],2)
            
            data$B12_2     <- round(FIXEF["X1:X2"],2)
            data$se.B12_2  <- round(SE.FIXEF["X1:X2"],2)
            
            updateCheckboxInput(session, "isRunning", value = FALSE)
            
            return(data)
        })  
    }),
    
    ######### Show results #########
    
    output$Mod8Step1_summary_table1 <- renderUI({ 
            
        data <- Mod8Step1_output()
        
        myTable <- data.frame(
            "Parameter" = c("Parameter", 
                            "$\\text{Fixed effects}$",
                            paste0("Mean of the trait $",EQ1$mean0,"$"),
                            paste0("Population slope of $",EQ2$env1,"$ ($",EQ1$mean1,"$)"),
                            paste0("Population slope of $",EQ2$env2,"$ ($",EQ1$mean2,"$)"),
                            paste0("Population slope of $",EQ2$env12,"$ ($",EQ1$mean12,"$)"),
                            "$\\text{Random effects}$",
                            paste0("Among-individual variance in intercepts ($V_{",NOT$devI,"}$)"),
                            paste0("Among-individual variance in slopes ($V_{",EQ3$dev1,"}$)"),
                            paste0("Covariance between individual intercept and slope $(Cov_{",NOT$devI,EQ3$dev1,"})$"),
                            paste0("Measurement variance ($V_{",NOT$mError,"}$)")
                            ),
            
            "Truth" = c("True",
                       "",
                       0,
                       input$Mod8Step1_B1,
                       input$Mod8Step1_B2,
                       input$Mod8Step1_B12,
                       "",
                       input$Mod8Step1_Vi,
                       input$Mod8Step1_Vs1,
                       round(input$Mod8Step1_CorIS1 * sqrt(input$Mod8Step1_Vi*input$Mod8Step1_Vs1),1),
                       input$Mod8Step1_Ve
                      ),
            
            "Estimated"      = c("Estimated",
                                 "(ommitting interaction)",
                                 ifelse(!is.null(data), paste(data$B0_2,"\U00b1", data$se.B0_2),"..."),
                                 ifelse(!is.null(data), paste(data$B1_2,"\U00b1", data$se.B1_2),"..."),
                                 ifelse(!is.null(data), paste(data$B2_2,"\U00b1", data$se.B2_2),"..."),
                                 ifelse(!is.null(data), paste(data$B12_2,"\U00b1", data$se.B12_2),"..."),
                                 "",
                                 ifelse(!is.null(data), data$Vi_2,"..."),
                                 "-",
                                 "-",
                                 ifelse(!is.null(data), data$Vr_2,"...")
                                 ), 
            
            "Estimated_full" = c("Estimated",
                                 "(with interaction)",
                                 ifelse(!is.null(data), paste(data$B0_1,"\U00b1", data$se.B0_1),"..."),
                                 ifelse(!is.null(data), paste(data$B1_1,"\U00b1", data$se.B1_1),"..."),
                                 ifelse(!is.null(data), paste(data$B2_1,"\U00b1", data$se.B2_1),"..."),
                                 ifelse(!is.null(data), paste(data$B12_1,"\U00b1", data$se.B12_1),"..."),
                                 "",
                                 ifelse(!is.null(data), data$Vi_1,"..."),
                                 ifelse(!is.null(data), data$Vs1_1,"..."),
                                 ifelse(!is.null(data), data$COVis1_1,"..."),
                                 ifelse(!is.null(data), data$Vr_1,"...")
                                )
            )
        
        
        getTable(myTable, header = TRUE) 

    }),
    
    # Display 3D figure
    output$Mod8Step1_3D_1 <- renderPlotly({
    
        data <- Mod8Step1_output()
        
        isolate({
            
            if (!is.null(data)) {
                
                datas <- as.data.table(data$sampled_data)
                lmr   <- data$LMR
                
                # population mean surface
                X_seq <- seq(from = min(datas[ , c("X1", "X2")]), to = max(datas[ , c("X1", "X2")]), length.out = 10)
                
                predictors      <- cbind("intecept" = 1, expand.grid("X1" = X_seq, "X2" = X_seq))
                predictors$X1X2 <- predictors$X1 * predictors$X2
                
                Phenotype_mean <- as.matrix(predictors) %*% as.vector(input$Mod8Step1_B)
                Phenotype_mean <- t(matrix(Phenotype_mean, nrow = length(X_seq), ncol = length(X_seq)))
        
                
                datas$X2        <- 0
                datas$Phenotype <- stats::predict(lmr, newdata=datas)
                
                plotly::plot_ly(hoverinfo = "none")  %>%
                    plotly::add_trace(data = datas, x = ~X1, y = ~X2, z = ~Phenotype,
                                      type="scatter3d", split=~Individual, color=~Individual, mode="lines") %>%
                    plotly::add_surface(x = X_seq, y = X_seq, z = Phenotype_mean, opacity = 0.7,
                                        colorscale = list(c(0, 1), c("black", "black"))) %>%
                    plotly::layout(showlegend = FALSE) %>%
                    plotly::hide_colorbar() %>%
                    plotly::layout(scene = list(xaxis=list(title = "X1"),
                                                yaxis=list(title = "X2"),  
                                                zaxis=list(title = "Phenotype")))
                
            }else{defaultPlot()}
            
        })
    }),
    
    # Display 3D figure
    output$Mod8Step1_3D_2 <- renderPlotly({
        
        data <- Mod8Step1_output()
        
        isolate({
            
            if (!is.null(data)) {
                
                datas <- as.data.table(data$sampled_data)
                lmr   <- data$LMR
                
                # population mean surface
                X_seq <- seq(from = min(datas[ , c("X1", "X2")]), to = max(datas[ , c("X1", "X2")]), length.out = 10)
                
                predictors      <- cbind("intecept" = 1, expand.grid("X1" = X_seq, "X2" = X_seq))
                predictors$X1X2 <- predictors$X1 * predictors$X2
                
                Phenotype_mean <- as.matrix(predictors) %*% as.vector(input$Mod8Step1_B)
                Phenotype_mean <- t(matrix(Phenotype_mean, nrow = length(X_seq), ncol = length(X_seq)))
                
                # individual surfaces
                datas     <- datas[Individual %in% sample(unique(Individual),3)]
                
                Ind_data <- lapply(unique(datas$Individual), function(id){
                    
                    dt <- copy(datas[Individual == id])
                    
                    X1_seq <- seq(min(dt$X1), max(dt$X2), length.out = 10)
                    X2_seq <- seq(min(dt$X2), max(dt$X2), length.out = 10)
                    
                    X     <- cbind("intecept" = 1,
                                   expand.grid("X1" = X1_seq, 
                                               "X2" = X2_seq))
                    X$X1X2 <- X$X1 * X$X2
                    
                    blup <- c(as.numeric(lme4::ranef(lmr)$Individual[id, ]), 0,0)
                    
                    Phenotype <- as.matrix(X) %*% (as.vector(input$Mod8Step1_B) + blup)
                    Phenotype <- t(matrix(Phenotype, nrow = length(X1_seq), ncol = length(X2_seq)))
                    
                    return(list("X1_seq"    = X1_seq,
                                "X2_seq"    = X2_seq, 
                                "Phenotype" = Phenotype))
                    
                })
                
                plotly::plot_ly(hoverinfo = "none")  %>%
                plotly::add_surface(x = Ind_data[[1]]$X1_seq, y = Ind_data[[1]]$X2_seq, z = Ind_data[[1]]$Phenotype,
                                    opacity = 0.7, colorscale = list(c(0, 1), c("yellow", "yellow"))) %>%
                plotly::add_surface(x = Ind_data[[2]]$X1_seq, y = Ind_data[[2]]$X2_seq, z = Ind_data[[2]]$Phenotype,
                                    opacity = 0.7, colorscale = list(c(0, 1), c("blue", "blue"))) %>%
                plotly::add_surface(x = Ind_data[[3]]$X1_seq, y = Ind_data[[3]]$X2_seq, z = Ind_data[[3]]$Phenotype,
                                    opacity = 0.7, colorscale = list(c(0, 1), c("green", "green"))) %>%
                
                plotly::add_surface(x = X_seq, y = X_seq, z = Phenotype_mean, opacity = 0.7,
                                    colorscale = list(c(0, 1), c("black", "black"))) %>%
                plotly::layout(showlegend = FALSE) %>%
                plotly::hide_colorbar() %>%
                plotly::layout(scene = list(xaxis=list(title = "X1"),
                                            yaxis=list(title = "X2"),  
                                            zaxis=list(title = "Phenotype")))
                
            }else{defaultPlot()}
            
        })
    })

) # End return
