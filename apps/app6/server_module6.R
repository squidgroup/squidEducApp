#Server functions for module 2 step 1
c(
  ######### Display results (graph) #########
  
  # Graph: proportion of each sex
  output$Mod2Step1_plot_coin_flip <- renderPlot({ 
    
    size <- input$Mod2Step1_n_offspring
    prop <- rbinom(n=1, size=size, prob=0.5) / size
    dat  <- data.frame("Sex"        = c("Female", "Male"),
                       "Proportion" = c(1-prop, prop))
    
    ggplot2::ggplot(data=dat, aes(x=Sex, y=Proportion)) + 
      ggplot2::geom_col(width=0.3) +
      ggplot2::ylim(0,1) + 
      ggplot2::geom_hline(yintercept=0.5, color="red", linetype="dashed")
    
  })
            
) # End
