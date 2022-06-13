# UI: Module 2 Step 1
span(
  div(style="display: inline-block; width: 100%;",align="center",
      
  sliderInput("Mod2Step1_temperature",
             "Incubation temperature ($^\\circ C$):",
             value = 28,
             min   = 28,
             max   = 35,
             step  = 0.5,
             width = "49.5%"
  )
  ),
  fluidRow(align="center",
  # Figure: sex-determination proportion
  plotOutput("Mod2Step1_plot_alligator", width = "350px", height = "300px"), 
)
)