#Server functions for module 2 step 1
c(
  ######### Display results (graph) #########
  
  # Graph: histogram of female proportions
  output$Mod2Step1_plot_female_hist <- renderPlot({ 
    
    size <- input$Mod2Step1_n_offspring_2
    n <- input$Mod2Step1_n_clutches
    prob <- input$Mod2Step1_female_probability_2
    n_fem <- rbinom(n=n, size=size, prob=prob)
    dat  <- data.frame("Females" = n_fem)
    
    ggplot(data=dat) + 
      geom_bar(stat='count', aes(y=..count../sum(..count..), x = Females)) + 
      xlim(0, size+1) + 
      xlab("Number of females") +
      ylab("Proportion of clutches") +
      geom_hline(yintercept=prob, color="red", linetype="dashed")
  })
)
  