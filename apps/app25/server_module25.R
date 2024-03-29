#Server functions for module 6 step 2
c(
  
    ######### Set variables #########  
    Mod6Step2updateVind <- function(input, nb.IS){
      m <- matrix(rep(0,nb.IS^2),nb.IS)
      diag(m)[1] <- input$Mod6Step2_Vi
      diag(m)[2] <- input$Mod6Step2_Vs
      m[2,1]     <- input$Mod6Step2_CorIS
      return(m)
    },
      # Set hidden variables
       output$Mod6Step2_hidden <- renderUI({
          list(
            numericInput("Mod6Step2_Tmax", "", Modules_VAR$Tmax$max),
            shinyMatrix::matrixInput("Mod6Step2_Vind", value = Mod6Step2updateVind(input, nb.IS), class = "numeric"),
            shinyMatrix::matrixInput("Mod6Step2_B", value = matrix(c(0,sqrt(input$Mod6Step2_Vbx),0,0),1), class = "numeric"),
            checkboxInput("Mod6Step2_X1_state", "", value = TRUE),
            checkboxInput("Mod6Step2_X1_sto_state", "", value = TRUE),
            checkboxInput("Mod6Step2_X1_sto_shared", "", value = TRUE),
            numericInput("Mod6Step2_X1_sto_V","", 1, min = 0, max = 1, step = 0.001),
            checkboxInput("Mod6Step2_ST_ind", "", value = FALSE)
          )
      }),
 	    outputOptions(output, "Mod6Step2_hidden", suspendWhenHidden = FALSE),

    # Run simulation and return results
    Mod6Step2_output <- reactive({
      
      if(input$Mod6Step2_Run == 0) # if Run button is pressed
        return(NULL)
      
      isolate({ 
        
        updateCheckboxInput(session, "isRunning", value = TRUE)
        
        # Call app main function
        data <- squid::squidR(input, module="Mod6Step2")  
        
        LMR      <- lmer(Phenotype ~ X1 + (X1|Individual), data = data$sampled_data)
        RANDEF   <- as.data.frame(VarCorr(LMR))$vcov
        
        data$LMR       <- LMR
        
        data$Vi        <- round(RANDEF[1],2)
        data$Vs        <- round(RANDEF[2],2)
        data$CorIS     <- round(RANDEF[3]/sqrt(RANDEF[1]*RANDEF[2]),2)
        data$Vr        <- round(RANDEF[4],2) 
        data$B0        <- round(fixef(LMR)[1],2) 
        data$B1        <- round(fixef(LMR)[2],2) 
        
        # Remove covariance
        if(input$Mod6Step2_CorIS != 0){
          
          df    <- as.data.table(data$sampled_data)
          newdf <- unique(copy(df[ , .(Individual, S1)]))[
                                   , Individual := sample(Individual)]

          setkey(df,Individual)
          setkey(newdf,Individual)
          df <- df[, S1:=NULL][newdf, nomatch=0]

          df[ , Phenotype := ((B0+I) + (B1+S1)*X1 + e)]
          
          LMR2  <- lmer(Phenotype ~ X1 + (X1|Individual), data = df)

        }else{
          LMR2 <- LMR
        }
        
        data$LMR2 <- LMR2
        # data$df <- as.data.frame(df)
        
        updateCheckboxInput(session, "isRunning", value = FALSE)
        
        return(data)
      })  
    }),
    
    Mod6Step2_table <- reactive({
      
      data    <- Mod6Step2_output()
      
      myTable <- data.frame(
        "Parameter" = c("$\\text{Fixed effects}$",
                        paste("Mean of the trait ($",EQ3$mean0,"$) ="),
                        paste("Population-specific slope of the environmental effect ($",NOT$mean,"$) ="),
                        "$\\text{Random effects}$",
                        paste("Among individual variance in intercept ($V_",NOT$devI,"$) ="),
                        paste("Among-individual variance in slopes (random slopes; $V_",NOT$devS,"$) ="),
                        paste("Correlation between individual specific intercepts and slopes ($Cor_{",NOT$devI,",",NOT$devS,"}$) ="),
                        paste("Residual variance ($V_",NOT$residualUpper,"$) =")
                        ),
        "Truth"       = c("",
                        round(input$Mod6Step2_B[1],2),
                        round(input$Mod6Step2_B[2],2),
                        "",
                        input$Mod6Step2_Vi,
                        input$Mod6Step2_Vs,
                        input$Mod6Step2_CorIS,
                        input$Mod6Step2_Ve),
        "Estimated" = c("",
                        ifelse(!is.null(data),data$B0,"..."),
                        ifelse(!is.null(data),data$B1,"..."),
                        "",
                        ifelse(!is.null(data),data$Vi,"..."),
                        ifelse(!is.null(data),data$Vs,"..."),
                        ifelse(!is.null(data),data$CorIS,"..."),
                        ifelse(!is.null(data),data$Vr,"...")
      ))  
      
      return(getTable(myTable))
      myTable <- data.frame("test"=c(1,2),"test"=c(1,2))
      
      return(getTable(myTable))
    }),
    
    # Display results (table)
    output$Mod6Step2_summary_table <- renderUI({Mod6Step2_table()}),
    
    output$Mod6Step2_plot <- renderPlot({ 

      data  <- Mod6Step2_output()
      
      if(!is.null(data)){
        
        data1 <- data$sampled_data
        data2 <- data$sampled_data
        
        data1$covariance     <- "With covariance"
        data1$Phenotype_pred <- stats::predict(data[["LMR"]])
        
        data2$covariance     <- "Without covariance"
        data2$Phenotype_pred <- stats::predict(data[["LMR2"]])

        myDf <- rbind(data1, data2)
        myDf$covariance <- factor(myDf$covariance, levels = c("Without covariance", "With covariance"))

        ggplot(data = myDf, 
                        aes(y     = Phenotype_pred, 
                                     x     = X1, 
                                     color = as.factor(Individual))) +
          geom_line() +
          theme(legend.position="none") +
          facet_grid(. ~ covariance) +
          xlab("Environmental effect") + 
          ylab("Phenotype")
        
        # print(ggplot(data = myDf, aes(y     = Phenotype,
        #                                                 x     = X1,
        #                                                 color = as.factor(Individual))) +
        #               stat_smooth(method = "lm", se=FALSE) +
        #               theme(legend.position="none") +
        #               facet_grid(. ~ covariance) +
        #               xlab("Environmental effect") +
        #               ylab("Phenotype"))
        # 
        # defaultPlot()

      }else{
        defaultPlot()
      }
      
    })
) # End return