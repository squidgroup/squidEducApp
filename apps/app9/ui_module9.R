# UI: Module 2 Step 1
span(
  div(style="display: inline-block; width: 100%;",align="center",
  sliderInput("Mod2Step1_poisson_rate",
              "Mean ($\\lambda$) of the Poisson distribution:",
              value = 1,
              min   = 1,
              max   = 20,
              step  = 1,
              width = "49.5%"
  )
  ),
  
  fluidRow(align="center",
  # Figure: histogram of counts
  plotOutput("Mod2Step1_plot_count_hist", width = "350px", height = "300px")
  )
)