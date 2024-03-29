#Server functions for module 1 step 4
c(
  #by default hide show and hide buttons
  hide("hide"),
  hide("show"),
  
  observeEvent(input$Mod1Step4_Ve, {
    if((input$Mod1Step4_Ve+input$Mod1Step4_Vi)>1)updateSliderInput(session, "Mod1Step4_Vi", value = 1-input$Mod1Step4_Ve)
  }),
  observeEvent(input$Mod1Step4_Vi, {
    if((input$Mod1Step4_Ve+input$Mod1Step4_Vi)>1)updateSliderInput(session, "Mod1Step4_Ve", value = 1-input$Mod1Step4_Vi)
  }),
  
    ######### Set variables #########    
      # Set hidden variables
      Mod1Step4updateB <- function(input){
        suppressWarnings(B <- sqrt(1-input$Mod1Step4_Vi-input$Mod1Step4_Ve))
        return(ifelse(is.finite(B), B, 0))
      },
      output$Mod1Step4_hidden <- renderUI({
        list(
          numericInput("Mod1Step4_Tmax", "", Modules_VAR$Tmax$max),
          shinyMatrix::matrixInput("Mod1Step4_Vind", 
                      value = matrix(c(input$Mod1Step4_Vi,
                                      rep(0,(nb.IS*nb.IS)-1)),
                                    nb.IS), 
                      class = "numeric"),
          numericInput("Mod1Step4_Vbx","", 1-input$Mod1Step4_Vi-input$Mod1Step4_Ve),
          shinyMatrix::matrixInput("Mod1Step4_B", value = matrix(c(0,Mod1Step4updateB(input),0,0),1), class = "numeric"),
          checkboxInput("Mod1Step4_X1_state", "", value = TRUE),
          checkboxInput("Mod1Step4_X1_sto_state", "", value = TRUE),
          numericInput("Mod1Step4_X1_sto_V","", 1, min = 0, max = 1, step = 0.001)
        )
      }),
      outputOptions(output, "Mod1Step4_hidden", suspendWhenHidden = FALSE),
  
    # display variable (known environmental effect Vbx)
    output$Mod1Step4_Vbx_txt <- renderUI({
      
      if(!testInput(input$Mod1Step4_Vbx, Modules_VAR$Vbx, FALSE, FALSE)){
        output <- span(strong(round(input$Mod1Step4_Vbx,2),class="alert alert-danger"))
      }else{
        output <- span(round(input$Mod1Step4_Vbx,2))
      }
      
      p(HTML(paste(withMathJax(strong(Modules_VAR$Vbx$label)),output,"")))
      
    }),
      
    ######### Run simulation #########
      Mod1Step4_output <- reactive({
        if(input$Mod1Step4_Run == 0) # if Run button is pressed
          return(NULL)
        
        #hide extra results if sim was run before
        hide("Mod1Step4_summary_table")

        hide("hide")
        show("show")
        
        isolate({
          
          updateCheckboxInput(session, "isRunning", value = TRUE)

          # Call app main function
          data <- squid::squidR(input, module="Mod1Step4")
          LMR  <- lmer(Phenotype ~ 1 + X1 + (1|Individual), data = data$sampled_data)
          
          FIXEF    <- fixef(LMR)
          SE.FIXEF <- se.fixef(LMR)
          RANDEF   <- as.data.frame(VarCorr(LMR))$vcov
          
          # Make a mixed effect model to extract variances and slope
          data$Vp            <- round(var(data$sampled_data$Phenotype),2)
          data$Vi            <- round(RANDEF[1],2)
          data$Ve            <- round(RANDEF[2],2)
          data$B0            <- round(FIXEF["(Intercept)"],2)
          data$se.B0         <- round(SE.FIXEF["(Intercept)"],2)
          data$B1            <- round(FIXEF["X1"],2)
          data$se.B1         <- round(SE.FIXEF["X1"],2)
          data$phenotypeMean <- round(mean(data$sampled_data$Phenotype),2)
          
          updateCheckboxInput(session, "isRunning", value = FALSE)
          
          return(data)
        })
      }),
   	
    ######### Display results (graph) #########
      # Graph: Individual phenotypes over environment
      output$Mod1Step4_plot1 <- renderPlot({
        
        data      <- Mod1Step4_output()
        
        if(!is.null(data)){
          
          isolate({ 

            ggplot(data$sampled_data, aes(x     = X1,
                                                            y     = Phenotype)) +
              geom_smooth(method = "lm", se = TRUE, alpha = 0.1) +
              geom_point() + 
              xlab("Environment") +
              ylab("Phenotype") + 
              ggtitle(bquote(italic(hat(beta)) == .(data$B1) %+-% .(data$se.B1) ~~ (italic(beta[(true)]) == .(round(input$Mod1Step4_B[1,2],2)))))
        
          })
          
        }else{defaultPlot()}
                
      }),
  
      # Graph: Individual reaction norm  
      output$Mod1Step4_plot2 <- renderPlot({ 
      
        data      <- Mod1Step4_output()
        
        if(!is.null(data)){
          
          isolate({ 
            data$sampled_data$Individual <- as.factor(data$sampled_data$Individual)
            modI <- lm(Phenotype ~ Individual + X1, data = data$sampled_data)
            data$sampled_data$pred <- predict.lm(modI)
            data$sampled_data$se <- predict.lm(modI,se.fit = T)$se
            ggplot(data$sampled_data, aes(x     = X1, 
                                                            y     = Phenotype, 
                                                            color = Individual,
                                                            group = Individual,
                                                            fill = Individual)) +
              geom_line(aes(y=pred,x=X1)) +
              geom_ribbon(aes(x=X1, ymin = pred-se*1.96,ymax=pred+se*1.96),alpha = 0.1, linetype = 0,) +
              geom_point() +
              xlab("Environment") +
              ylab("Phenotype per individual")
              #labs(caption = "Figure 1: Phenotype per") + 
              #theme(plot.caption = element_markdown(size = 11))

          })
          
        }else{defaultPlot()}
      }),
  
  #button to show extra results, keeps things clean
  observeEvent(input$show, {
    
      # Table : display true and measured values (Vp, Ve, mean and Beta es)
      output$Mod1Step4_summary_table <- renderUI({
        
        data <- Mod1Step4_output()
        
        myTable <- data.frame("Parameter" = c(
          paste("Population intercept ($",EQ3$mean0,"$) ="),
          paste("Individual variance ($V_",NOT$devI,"$) ="),
          paste("Measurement variance ($V_",NOT$mError,"$) ="),
          "Mean of the trait ($\\mu$) = ",
          paste("Slope of environmental effect ($",NOT$mean,"$) =")
        ),
          
                                "Truth"       = c(0,
                                               input$Mod1Step4_Vi,
                                               input$Mod1Step4_Ve,
                                               0,
                                               round(input$Mod1Step4_B[1,2],2)),
                              "Estimated" = c(ifelse(!is.null(data),paste(data$B0,"\U00b1", data$se.B0, sep=" "),"..."),
                                              ifelse(!is.null(data),data$Vi,"..."),
                                              ifelse(!is.null(data),data$Ve,"..."),
                                              ifelse(!is.null(data),data$phenotypeMean,"..."),
                                              ifelse(!is.null(data),paste(data$B1,"\U00b1", data$se.B1, sep=" "),"...")) 
                             )  
        
        getTable(myTable)
    
      }) 	
      
      show("Mod1Step4_summary_table")
      
      hide("show")
      show("hide")
      
      
  }), 
  observeEvent(input$hide, {
    hide("Mod1Step4_summary_table")
    
    hide("hide")
    
    show("show")
    
  }),
    ######### Manage errors #########
      observe({
        if(!testInput(input$Mod1Step4_Vbx, Modules_VAR$Vbx, FALSE, FALSE)){
          disableActionButton("Mod1Step4_Run", session, "true")
        }else{
          disableActionButton("Mod1Step4_Run", session, "false")
        }
      }),
      output$Mod1Step4_error_Vbx   <- renderUI({testInput(input$Mod1Step4_Vbx, Modules_VAR$Vbx, FALSE, TRUE)})
  
  ) # End return