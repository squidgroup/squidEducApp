# UI: Module 2 Step 2
span(
  p(HTML("<b>Bernoulli</b>")),
  # Figure: mean-variance relationship in Bernoulli distribution
  fluidRow(
    column(6,
      plotOutput("Mod2Step2_plot_bernoulli_mean", height="200px")
    ),
    column(6,
      plotOutput("Mod2Step2_plot_bernoulli_var", height="200px")
    )
  ),
  
  p(HTML("<b>Poisson</b>")),
  
  # Figure: mean-variance relationship in Poisson distribution
  fluidRow(
    column(6,
           plotOutput("Mod2Step2_plot_poisson_mean", height="200px")
    ),
    column(6,
           plotOutput("Mod2Step2_plot_poisson_var", height="200px")
    )
  )
)