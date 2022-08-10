# UI: Module 2 Step 1
span(
  fluidRow(align="center",
           sliderInput("Mod2Step1_n_offspring_2",
              "Number of offspring:",
              value = 3,
              min   = 1,
              max   = 10,
              step  = 1,
              width = "49.5%"
  ),
  sliderInput("Mod2Step1_female_probability_2",
              "Female probability:",
              value = 0.5,
              min   = 0,
              max   = 1,
              step  = 0.001,
              width = "49.5%"
  ),
  sliderInput("Mod2Step1_n_clutches",
              "Number of clutches:",
              value = 3,
              min   = 1,
              max   = 1000,
              step  = 1,
              width = "49.5%"
  ),

  # Figure: histogram of female proportions
  plotOutput("Mod2Step1_plot_female_hist", width = "350px", height = "300px")
  )
)