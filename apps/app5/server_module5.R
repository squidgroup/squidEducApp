#Server functions for module 2 step 1
c(
  ######### Display results (graph) #########
  
  # Graph: proportion of each sex
  output$Mod2Step1_plot_alligator <- renderPlot({ 
    
    t    <- input$Mod2Step1_temperature
    prop <- ifelse(t < 30, 0, 
            ifelse(t > 33, 1, (t-30)/(33-30))) 
  
    dat <- data.frame("Sex"        = c("Female", "Male"),
                      "Proportion" = c(1-prop, prop))
  
    ggplot(data=dat, aes(x=Sex, y=Proportion)) + 
      geom_col(width=0.3) +
      ylim(0,1)
    
  })
            
) # End
