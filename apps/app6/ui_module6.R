# UI: Module 2 Step 1
span(
  div(style="display: inline-block; width: 100%;",align="center",
      sliderInput("Mod2Step1_n_offspring",
                  "Number of offspring:",
                  value = 10,
                  min   = 2,
                  max   = 100,
                  step  = 1,
                  width = "500px"
      )
  ),
  fluidRow(align="center",
  # Figure: sex-determination proportion
  plotOutput("Mod2Step1_plot_coin_flip", width = "350px", height = "300px")
  )
  
)