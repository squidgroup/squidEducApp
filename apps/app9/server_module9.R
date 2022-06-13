#Server functions for module 2 step 1
c(
  ######### Display results (graph) #########
  
  # Graph: histogram of counts
  output$Mod2Step1_plot_count_hist <- renderPlot({ 
    
    rate   <- input$Mod2Step1_poisson_rate
    counts <- rpois(n=1000, lambda=rate)
    dat    <- data.frame("Counts" = counts)
    
    ggplot(data=dat, aes(x=Counts)) + 
      geom_histogram(binwidth=0.5) +
      geom_vline(xintercept=rate, color="red", linetype="dashed")
    
  })
            
) # End
