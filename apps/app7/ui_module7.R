# UI: Module 2 Step 1
span(
  div(style="display: inline-block; width: 100%;",align="center",
  sliderInput("Mod2Step1_female_probability",
              "Female probability:",
              value = 0.5,
              min   = 0,
              max   = 1,
              step  = 0.1,
              width = "49.5%"
  )
  ),
  
fluidRow(align="center",
  # Figure: sex-determination proportion
  plotOutput("Mod2Step1_plot_female_prob", width = "350px", height = "300px")
)
)