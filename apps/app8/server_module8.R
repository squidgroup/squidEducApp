#Server functions for module 2 step 1
c(
  ######### Display results (graph) #########
  
  # Graph: histogram of female proportions
  output$Mod2Step1_plot_female_hist <- renderPlot({ 
    
    size <- input$Mod2Step1_n_offspring_2
    prob <- input$Mod2Step1_female_probability_2
    prop <- rbinom(n=1000, size=size, prob=prob) / size
    dat  <- data.frame("Proportion" = prop)
    
    ggplot(data=dat, aes(x=Proportion)) + 
      geom_histogram(binwidth=0.1) +
      xlim(-0.1,1.1) + 
      ylim(0, 1000) +
      xlab("Female proportion") +
      geom_vline(xintercept=prob, color="red", linetype="dashed")
    
  })
)
  