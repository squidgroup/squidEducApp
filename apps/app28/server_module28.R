#Server functions for module 8 step 1
c(
    
    ######### Set variables ######### 
    Mod8Step1updateVind_2 <- function(input, nb.IS){
        m <- matrix(rep(0,nb.IS*nb.IS),nb.IS)
        diag(m)[1] <- input$Mod8Step1_2_Vi
        diag(m)[2] <- input$Mod8Step1_2_Vs1
        diag(m)[3] <- input$Mod8Step1_2_Vs2
        m[2,1]     <- input$Mod8Step1_2_CorIS1
        m[3,1]     <- input$Mod8Step1_2_CorIS2
        m[3,2]     <- input$Mod8Step1_2_CorS1S2
        return(m)
    },
    Mod8Step1updateB_2 <- function(input){
        m <- matrix(c(0,
                      input$Mod8Step1_2_B1,
                      input$Mod8Step1_2_B2, 
                      input$Mod8Step1_2_B12), 1)
        return(m)
    },
    
    # Set hidden variables
    output$Mod8Step1_2_hidden <- renderUI({
        list(
            numericInput("Mod8Step1_2_Tmax", "", Modules_VAR$Tmax$max),
            numericInput("Mod8Step1_2_NI", "",100),
            numericInput("Mod8Step1_2_NR", "",20),
            
            matrixInput("Mod8Step1_2_Vind", value = Mod8Step1updateVind_2(input, nb.IS), class = "numeric"),
            matrixInput("Mod8Step1_2_B",    value = Mod8Step1updateB_2(input), class = "numeric"),
            
            checkboxInput("Mod8Step1_2_X1_state", "",      value = TRUE),
            checkboxInput("Mod8Step1_2_X1_sto_state", "",  value = TRUE),
            checkboxInput("Mod8Step1_2_X1_sto_shared", "", value = FALSE),
            
            checkboxInput("Mod8Step1_2_X2_state", "",      value = TRUE),
            checkboxInput("Mod8Step1_2_X2_sto_state", "",  value = TRUE),
            checkboxInput("Mod8Step1_2_X2_sto_shared", "", value = FALSE),
            
            checkboxInput("Mod8Step1_2_X_Interaction", "", value = TRUE)
        )
    }),
    outputOptions(output, "Mod8Step1_2_hidden", suspendWhenHidden = FALSE),
    
    ######### Run simulation #########
    # Run simulation and return results
    Mod8Step1_2_output <- reactive({
        
        if (input$Mod8Step1_2_Run == 0) # if Run button is pressed
            return(NULL)
        
        isolate({ 
            
            updateCheckboxInput(session, "isRunning", value = TRUE)
            
            # Call app main function
            data <- squid::squidR(input, module = "Mod8Step1_2")  
            
            # model with random slope
            LMR      <- lme4::lmer(Phenotype ~ 1 + X1*X2 + (1 + X1 + X2|Individual), data = data$sampled_data)
            FIXEF    <- lme4::fixef(LMR)
            SE.FIXEF <- arm::se.fixef(LMR)
            RANDEF   <- as.data.frame(lme4::VarCorr(LMR))$vcov
            
            data$LMR       <- LMR
            
            data$Vi        <- round(RANDEF[1],2)
            data$Vs1       <- round(RANDEF[2],2)
            data$Vs2       <- round(RANDEF[3],2)
            data$COVis1    <- round(RANDEF[4],2)
            data$COVis2    <- round(RANDEF[5],2)
            data$COVs1s2   <- round(RANDEF[6],2)
            data$Vr        <- round(RANDEF[7],2)
            
            data$B0        <- round(FIXEF["(Intercept)"],2)
            data$se.B0     <- round(SE.FIXEF["(Intercept)"],2)
            
            data$B1        <- round(FIXEF["X1"],2)
            data$se.B1     <- round(SE.FIXEF["X1"],2)
            
            data$B2        <- round(FIXEF["X2"],2)
            data$se.B2     <- round(SE.FIXEF["X2"],2)
            
            data$B12       <- round(FIXEF["X1:X2"],2)
            data$se.B12    <- round(SE.FIXEF["X1:X2"],2)
            
            updateCheckboxInput(session, "isRunning", value = FALSE)
            
            return(data)
        })  
    }),
    
    ######### Show results #########
    
    # table
    output$Mod8Step1_2_summary_table1 <- renderUI({ 
        
        data <- Mod8Step1_2_output()
        
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
                            paste0("Among-individual variance in slopes ($V_{",EQ3$dev2,"}$)"),
                            paste0("Covariance between individual intercepts and slopes $(Cov_{",NOT$devI,EQ3$dev1,"})$"),
                            paste0("Covariance between individual intercepts and slopes $(Cov_{",NOT$devI,EQ3$dev2,"})$"),
                            paste0("Covariance between individual slopes to $",EQ2$env1,"$ and $",EQ2$env2,"$ $(Cov_{",EQ3$dev1,EQ3$dev2,"})$"),
                            paste0("Measurement variance ($V_{",NOT$mError,"}$)")
            ),
            
            "True" = c("Truth",
                       "",
                       0,
                       input$Mod8Step1_2_B1,
                       input$Mod8Step1_2_B2,
                       input$Mod8Step1_2_B12,
                       "",
                       input$Mod8Step1_2_Vi,
                       input$Mod8Step1_2_Vs1,
                       input$Mod8Step1_2_Vs2,
                       round(input$Mod8Step1_2_CorIS1  * sqrt(input$Mod8Step1_2_Vi*input$Mod8Step1_2_Vs1),1),
                       round(input$Mod8Step1_2_CorIS2  * sqrt(input$Mod8Step1_2_Vi*input$Mod8Step1_2_Vs2),1),
                       round(input$Mod8Step1_2_CorS1S2 * sqrt(input$Mod8Step1_2_Vs1*input$Mod8Step1_2_Vs2),1),
                       input$Mod8Step1_2_Ve
            ),

            "Estimated_full" = c("Estimated",
                                 "",
                                 ifelse(!is.null(data), paste(data$B0,"\U00b1", data$se.B0),"..."),
                                 ifelse(!is.null(data), paste(data$B1,"\U00b1", data$se.B1),"..."),
                                 ifelse(!is.null(data), paste(data$B2,"\U00b1", data$se.B2),"..."),
                                 ifelse(!is.null(data), paste(data$B12,"\U00b1", data$se.B12),"..."),
                                 "",
                                 ifelse(!is.null(data), data$Vi,"..."),
                                 ifelse(!is.null(data), data$Vs1,"..."),
                                 ifelse(!is.null(data), data$Vs2,"..."),
                                 ifelse(!is.null(data), data$COVis1,"..."),
                                 ifelse(!is.null(data), data$COVis2,"..."),
                                 ifelse(!is.null(data), data$COVs1s2,"..."),
                                 ifelse(!is.null(data), data$Vr,"...")
            )
        )
        
        
        getTable(myTable, header = TRUE) 
        
    }),
    
    # Display 3D figure
    output$Mod8Step1_2_3D <- renderPlotly({
        
        data <- Mod8Step1_2_output()
        
        isolate({
            
            if (!is.null(data)) {
                
                datas <- as.data.table(data$sampled_data)
                lmr   <- data$LMR
                
                # population mean surface
                X_seq <- seq(from = min(datas[ , c("X1", "X2")]), to = max(datas[ , c("X1", "X2")]), length.out = 10)
                
                predictors      <- cbind("intecept" = 1, expand.grid("X1" = X_seq, "X2" = X_seq))
                predictors$X1X2 <- predictors$X1 * predictors$X2
                
                Phenotype_mean <- as.matrix(predictors) %*% as.vector(input$Mod8Step1_2_B)
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
                    
                    blup <- c(as.numeric(lme4::ranef(lmr)$Individual[id, ]), 0)
                    
                    Phenotype <- as.matrix(X) %*% (as.vector(input$Mod8Step1_2_B) + blup)
                    Phenotype <- t(matrix(Phenotype, nrow = length(X1_seq), ncol = length(X2_seq)))
                    
                    return(list("X1_seq"    = X1_seq,
                                "X2_seq"    = X2_seq, 
                                "Phenotype" = Phenotype))
                    
                })
                
                plot_ly(hoverinfo = "none")  %>%
                    add_surface(x = Ind_data[[1]]$X1_seq, y = Ind_data[[1]]$X2_seq, z = Ind_data[[1]]$Phenotype,
                                        opacity = 0.7, colorscale = list(c(0, 1), c("yellow", "yellow"))) %>%
                    add_surface(x = Ind_data[[2]]$X1_seq, y = Ind_data[[2]]$X2_seq, z = Ind_data[[2]]$Phenotype,
                                        opacity = 0.7, colorscale = list(c(0, 1), c("blue", "blue"))) %>%
                    add_surface(x = Ind_data[[3]]$X1_seq, y = Ind_data[[3]]$X2_seq, z = Ind_data[[3]]$Phenotype,
                                        opacity = 0.7, colorscale = list(c(0, 1), c("green", "green"))) %>%
                    
                    add_surface(x = X_seq, y = X_seq, z = Phenotype_mean, opacity = 0.7,
                                        colorscale = list(c(0, 1), c("black", "black"))) %>%
                    layout(showlegend = FALSE) %>%
                    hide_colorbar() %>%
                    layout(scene = list(xaxis=list(title = "X1"),
                                                yaxis=list(title = "X2"),  
                                                zaxis=list(title = "Phenotype")))
                
            }else{defaultPlot()}
            
        })
    })

) # End return
