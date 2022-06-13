#Server functions for module 2 step 1
c(
  ######### Display results (graph) #########
  
  # Graph: proportion of each sex
  output$Mod2Step1_plot_female_prob <- renderPlot({ 
    
    f_prob <- input$Mod2Step1_female_probability
    
    prop <- rbinom(n=1, size=100, prob=f_prob) / 100
    dat <- data.frame("Sex"        = c("Female", "Male"),
                      "Proportion" = c(prop, 1-prop))
    
    ggplot(data=dat, aes(x=Sex, y=Proportion)) + 
      geom_col(width=0.3) +
      ylim(0,1) + 
      geom_hline(yintercept=f_prob, color="red", linetype="dashed")
    
  })
  
) # End
