text <- list(
  "fullmodelTxt" = list(
    
    "paragIntro"         = "This table allow you to select the phenotypic equation model 
                          that you want to use to generate your data. Start by clicking on each of the parameters 
                          of the model you want to include to generate the phenotypes (column &rdquo;option&rdquo;). 
                          You can chose whether you simulate one or more traits: if you select the multivariate 
                          option you will be allowed to select the number of traits you want to simulate; 
                          Otherwise the default option is &rdquo;univariate&rdquo;. You will also have to enter 
                          the information relative to the covariance components between the traits. 
                          Once you have selected the model of your choice, click on &rdquo;enter inputs&rdquo;.",
    
    "lorem"              = "Lorem ipsum dolor sit amet, mei legimus disputando ei. Eu odio interpretaris sea, 
                          nemore denique voluptatibus has et. Ei vis ferri putent, ne iusto choro placerat mea, 
                          verear oportere elaboraret ius at. Eum mutat aperiam instructior id, 
                          ea mei rebum animal reprimique.
                          Nisl dolor temporibus no vis. Cum no soleat volutpat democritum. 
                          Te eligendi ullamcorper concludaturque vix, id usu consequuntur necessitatibus, 
                          est ea laudem verterem. Id prima harum tation pro. Mel libris doctus posidonium cu, 
                          sed modo meliore volutpat ea, ei singulis conceptam est. His an alterum prodesset definitionem, 
                          per id malis homero, impedit elaboraret cotidieque eu sea.",
    
    # Step by step page
    
    "fullModelSbyS_intro_1"     = "The full model of SQuID allows the user to generate data sets of 
                                  individuals repeatedly expressing phenotypes, for one or two traits, in uniform time. 
                                  The user has thus the flexibility to add different variance components that will form the 
                                  phenotype of the individual at each time step, and to set up a relative importance to each component. 
                                  SQuID also allows the user to collect a sample of the simulated phenotypes (i.e., the operational data set), 
                                  according to specific sampling design. Finally, the user has the opportunity 
                                  to download the operational data set for further analyses.",
    "fullModelSbyS_intro_2"     = "In this page, we will introduce to you step by step how to use our full module. 
                                In case you are already familiar with the full model we invite to switch to the 
                                full model express page, which is more straightforward.  ",
    
    
    # Step by step description
    
    "ModelDesciption_intro_1"     = "In this section, we will describe the model used to simulate individual 
                                  phenotype values and the model used to create the sampling design.",
    
    
    "SimModel_intro"      = "As a first step, we generate phenotype values of individuals that belong to a study population (i.e., replicate world). 
                          Phenotypic values of each trait are calculated using 
                          the phenotypic equation described below.",
    
    "modelEquation_1"     = paste("The equation represents the model that generated phenotypic values ($",EQ$phen.1,"$ or $",EQ$phen.2,"$) of 
                           two traits for each individual $",NOT$ind,"$ and at each instance of time $",NOT$time,"$, in each group $",NOT$group,"$.", sep=""),
    "modelEquation_2"     = paste("It should be noted that subscripts are organised to represent the different hierarchical 
                           levels involved in the generation of the value of the trait: subscript $",NOT$time,"$ stands for the 
                           instance at which the traits is measured for the individual $",NOT$ind,"$, within group $",NOT$group,"$. 
                           Finally subscript $",NOT$trait.1,"$ or $",NOT$trait.2,"$ refers to the two traits generated.", sep=""),
    "modelEquation_3"     = paste("At first sight we can see that the phenotypic value of the trait $",NOT$trait.1,"$ for individual $",NOT$ind,"$ 
                          at instance $",NOT$time,"$ in group $",NOT$group,"$ is the sum of a series of components. 
                          Let's first decompose the equation into all of its components, and we then will see how each of the 
                          components is generated:", sep=""),
    "modelEquation_4"     = paste("The first component on the right hand side of the equation represents the population average 
                          $",EQ$mean0.1,"$ for the trait $",NOT$trait.1,"$, and the deviation of each individual's trait mean 
                          from that population average ($",EQ$dev0.1,"$, generally called individual level or individual intercept). 
                          All the other elements occurring on the right hand side of the equation represent also deviations 
                          from the average of the trait in that population.", sep=""),
    "modelEquation_5"     = paste("Let's now go to the end of the equation, where we find the residual $",EQ$error.1,"$. 
													The residual term represents unaccounted effects on the phenotype which could be biological effects and/or measurement errors. 
													At the left of the 
                          residual term we have $",EQ$group.1,"$ that represents the deviation from the population average of 
                          trait $",NOT$trait.1,"$ for a group $",NOT$group,"$ (this means that all the individuals of a given group $",NOT$group,"$ share 
                          the same value of $",NOT$groupV,"$ ($",NOT$groupV,"$ follows a normal distribution with a mean = 0 and variance = $V_{",NOT$groupV,"}$).
                          The concept of grouping is wide ranging from genetic similarities (e.g. families) to spatial aggregations 
                          (e.g. territories) and diet compositions and could be specific to the each study.",sep=""),
    "modelEquation_6"     = paste("The last three components $(",EQ$mean1.1,"+",EQ$dev1.1,").",EQ$env1,"+(",EQ$mean2.1,"+",EQ$dev2.1,").",EQ$env2," 
                          + (",EQ$mean12.1,"+",EQ$dev12.1,")",EQ$env12,"$ represent two different environmental effects 
                          and their interaction that you could use to generate different sources of variation 
                          for your simulations.",sep=""),
    "modelEquation_7"     = paste("These terms represent phenotypically plastic changes in the value of the trait as a function 
                          of two environmental predictors $",NOT$env,"_1$ and $",NOT$env,"_2$. In other words, that part of the equation is 
                          the reaction norm of trait $",NOT$trait.1,"$ as a function of either environment $",NOT$env,"_1$ or $",NOT$env,"_2$ 
                          (or both $",NOT$env,"_1$ and $",NOT$env,"_2$). Below we will explain the equation for a given environmental 
                          predictor $",NOT$env,"$. Environment $",NOT$env,"$ can be measured and thus you can decide whether or not to include $",NOT$env,"$ 
                          in subsequent mixed-effects models (whether you include $",NOT$env,"$ in the model or not allows you to 
                          test how unknown/unmeasured environments affect estimates of other parameters in the model). 
                          The reaction norm is itself composed of a population-level component (e.g. $",EQ$mean1.1,"$) and of 
                          an individual deviation from the population norm ($",EQ$dev1.1,"$). 
                          When both terms are combined trait values are generated so that individuals differ 
                          in their slopes for trait $",NOT$trait.1,"$ as a function of environment $",NOT$env,"$. 
                          Lastly there is a possibility to implement an interaction between $",NOT$env,"_1$ and $",NOT$env,"_2$ 
                          [$(",EQ$mean12.1,"+",EQ$dev12.1,")",EQ$env12,"$].",sep=""),
    
    "indSpecResponses"    = paste("Below we show the way we generate the different values of each individual-level random-effect for 
                          both traits $",NOT$trait.1,"$ and $",NOT$trait.2,"$. The vector of individual deviation of the intercept and slopes for 
                          the two traits follows a multivariate normal distribution (MNV) with a zero-mean and covariance/variance 
                          matrix structure $\\Omega_{",NOT$devI,NOT$devS,"}$. On the right hand side is shown (co)variance matrix 
                          $\\Omega_{",NOT$devI,NOT$devS,"}$. Values of variance stand along the diagonal of the matrix (i.e., respectively, 
                          the among-individual variance in intercepts for $",NOT$trait.1,"$ $(V_{",NOT$devI,"_",NOT$trait.1,"})$, the among-individual variance in slopes 
                          for $",NOT$trait.1,"$ $(V_{",NOT$devS,"_",NOT$trait.1,"})$, the among-individual variance in intercepts for $",NOT$trait.2,"$ $(V_{",NOT$devI,"_",NOT$trait.2,"})$ 
                          and the among-individual variance in slopes for $",NOT$trait.2,"$ $(V_{",NOT$devS,"_",NOT$trait.2,"})$). 
                          Covariance values between intercepts (e.g. $cov_{", EQ2$dev0.1, ",", EQ2$dev0.2,"}$), 
                          slopes (e.g. $cov_{", EQ2$dev1.1, ",", EQ2$dev1.2,"}$), 
                          and intercepts and slopes (e.g. $cov_{", EQ2$dev0.1, ",", EQ2$dev1.1,"}$) lie below the diagonal. 
                          When building up phenotypic design the program lets you specify all of these (co)variance values. 
                          Note that in SQuID inputs the correlation/variance matrix is asked instead of the (co)variance matrix. 
                          This is more convenient for users while correlations range between -1 and 1.",sep=""),
    "environment_1"       = "SQuID allows you to generate different structures by which the environment changes over time: 
                          <ol><li>stochastic</li> <li>temporally auto-correlated</li> <li>linear</li> <li>cyclic</li></ol>",
    "environment_2"       = paste("For the first structure (<b>stochastic</b>), environmental values $",NOT$env,"_{",NOT$random,NOT$time,"}$ are 
                          generated using a Normal distribution with mean 0 and variance $V_{",NOT$env,"_",NOT$random,"}$. 
                          $$",NOT$env,"_{",NOT$random,NOT$time,"}\\sim N(0,V_{",NOT$env,"_",NOT$random,"})$$
                          This means that environmental values will be totally 
                          stochastic and uncorrelated from one time point to the next. This simple situation is not the most realistic 
                          (i.e., it is hard to think of an environmental predictor that is completely stochastically distributed in time). 
                          The other options are more complex but also more realistic.",sep=""),
    "environment_3"       = paste("For the <b>temporally auto-correlated</b> $",NOT$env,"_{",NOT$autocorrelated,NOT$time,"}$ 
                          we assume that two values of the environment close in time 
                          are more similar than two values further apart from each other (i.e., positive autocorrelation). 
                          Environmental values $",NOT$env,"_{",NOT$autocorrelated,NOT$time,"}$ are generated 
                          as the product of a stochastic value by a decay function.
                          $$",NOT$env,"_{",NOT$autocorrelated,NOT$time,"}\\sim N(0,V_{",NOT$env,"_",NOT$random,"})\\times e^{-\\alpha\\Delta ",NOT$time,"}$$                          
                          where $\\Delta ",NOT$time,"$ is the time interval between two instances of the study period, and $\\alpha$
                          is the decay rate, a measure of how fast the correlation decays with time.
                          $$\\alpha=ln(autocor)$$
                          where $autocor$ is the desired correlation between two successive values.",sep=""),
    "environment_4"       = paste("Once the <b>linear</b> trend is set up SQuID generates 
                          a series of values following a classical linear equation.
                          $$",NOT$env,"_{",NOT$linear,NOT$time,"}=a+b.",NOT$time,"$$
                          where $a$ and $b$ are respectively, the intercept and the slope of the regression between 
                          $",NOT$env,"_{",NOT$linear,NOT$time,"}$ and $",NOT$time,"$.  
                          This option allows you to generate environmental values that can change linearly with time, 
                          for example mimicking phenology during a season or long-term environmental changes.",sep=""),
    "environment_5"       = paste("If you are interested in mimicking daily or seasonal fluctuations you can choose a <b>cyclic</b> 
                          (sinusoidal) environmental variation, according to a sinusoidal equation.
                          $$",NOT$env,"_{",NOT$cyclic,NOT$time,"}=a\\times sin(b.",NOT$time,"+c)+v$$
                          where $\\lvert a\\rvert$ is the amplitude, 
                          $2\\pi/\\lvert b\\rvert$ the period, 
                          $-c/\\lvert b\\rvert$ the horizontal shift, 
                          and $v$ the vertical shift.
                          You can therefore change the shape of the cyclic curve by setting the different parameters.",sep=""),
    "environment_6"       = "By adding up the different options together you can create environmental data with combinations of effects. 
                          Adding the four options together (the most complex situation) will generate environmental data 
                          with a linear trend, cyclicity, autocorrelation and stochasticity.",
    "environment_7"       = paste("The environment could be also <b>shared</b> or <b>unshared</b> among individuals. 
                          A shared environment between individuals means that it is general to all the individuals 
                          within the population. All individuals will experience the same environment even 
                          if the environment would vary over time. In this case, only one environment ($",NOT$env,"$) 
                          will be generated using the different options described above. 
                          An unshared environment between individuals means that each individual 
                          will experience a specific environment. For instance, if we have three individuals 
                          in our population three different environments $",NOT$env,"_{",NOT$ind,"=a}$, $",NOT$env,"_{",NOT$ind,"=b}$, and $",NOT$env,"_{",NOT$ind,"=c}$ will be generated for 
                          respectively the individual a, b, and c. Although these environments are different, 
                          they follow the same general trend defined by environment options described 
                          previously (stochastic, auto-correlated, linear, and cyclic). 
                          In order to create multiple environments from one environment configuration, 
                          we apply variability around each parameter (e.g. the intercept of the 
                          linear effect or the amplitude of the cyclic effect) that follows 
                          a normal distribution.",sep=""),
    "environment_8"       = paste0("Finally, in SQuID the final output of each 
													environmental effect ($",EQ2$env1,"$, $",EQ2$env2,"$ and $",EQ2$env12,"$) is 
													expressed in unit variance (i.e., $V_{",NOT$env,"}=1$) and mean-centered (i.e., $E(",NOT$env,")=0$)."),
    "groupingNerror"      = paste("The high-level grouping term ($",NOT$groupV,"$) is generated from 
                          a normal distribution of mean 0 and variance $V_{",NOT$groupV,"}$, 
                          and the residual term ($",NOT$error,"$) from a normal distribution 
                          of mean 0 and variance $V_{",NOT$error,"}$.",sep=""),
    
    
    "samplingDesign_1"    = "As a second step, we retrieve a subsample of previously simulated phenotypic values according 
                          to a specific sampling design. The sampling design between individuals 
                          could vary by multiple parameters such as the number of records sampled, 
                          and the instance of those records.",
    "samplingDesign_2"    = paste("First we define the duration of the sampling period that is the same for all individuals.
                          $$t_{sampling}=t_{total}\\times(1-",general_VAR$btwIndVarTimSamp,")$$
                          where $t_{total}$ is the total simulation duration and $",general_VAR$btwIndVarTimSamp,"$ 
                          is the among-individual variance in timing of sampling (between 0 and 0.95).  
                          $",general_VAR$btwIndVarTimSamp,"$ is used to control the spreading intensity 
                          in sampling time between individuals (figure 1). 
                          When $",general_VAR$btwIndVarTimSamp,"$ is small (e.g. 0.1) $t_{sampling}$ is large 
                          (90% of total simulation duration) and all individuals are sampled almost fullmodelTxt
                          within the same period. Note that when $",general_VAR$btwIndVarTimSamp,"$ is 0 all individuals 
                          are sampled with the entire period of the simulation. 
                          Contrarily, when $",general_VAR$btwIndVarTimSamp,"$ is large (e.g. 0.9) $t_{sampling}$ is small 
                          (10% of total simulation duration) and each individual sampling period is spread out
                          within the total simulation duration following a uniform distribution.",sep=""),
    "samplingDesign_3"    = paste("The number of sampled records for each individual ($NR_",NOT$ind,"$) is generated following 
                          a poisson distribution.
                          $$NR_",NOT$ind,"\\sim poisson(NR)$$
                          where $NR$ is the mean number of records.",sep=""),
    "samplingDesign_4"    = "Finally, the exact times of sampling for each individual are generated according 
                          to a uniform distribution within each individual sampling period.",
    
    # Step by Step summary section
    "bivariateStepbyStep" = paste0("SQuID can model a bivariate phenotypic equation with random intercepts 
                                 and slopes for individual identity with respect to two environmental covariates. 
                                 SQuID enables both linear and interactive effects of these covariates on the 
                                 bivariate phenotype (i.e., non-warped vs. warped multidimensional reaction 
                                 norm planes; <a href='http://onlinelibrary.wiley.com/doi/10.1111/2041-210X.12430/abstract' target='_blank'>Araya-Ajoy <i>et al.</i> 2015</a>; 
                                 <a href='http://onlinelibrary.wiley.com/doi/10.1111/brv.12131/abstract' target='_blank'>Westneat <i>et al.</i> 2015</a>) to be modelled. 
                                 Covariances in SQuID emerge due to user-defined settings in the fixed and 
                                 random parts of the equation. Covariances in the random part are set directly 
                                 by the user, whereas covariances in the fixed part instead emerge when 
                                 a focal environmental effect is set to affect both traits (e.g., $",EQ$mean1.1,"\\neq 0$ and $",EQ$mean1.2,"\\neq 0$). 
                                 A large number of covariance terms, listed here, can thus be simulated."),
    
    # Step by Step bivariate section
    "summaryStepbyStep" = paste0("In the following table, we summarized the components that can be extracted from a mixed-effects model, 
                               using a data set generated by SQuID in a situation where the phenotypic trait y 
                               is a function of two different environmental predictors ($",EQ2$env1,"$ and $",EQ2$env2,"$) and their interaction.
  														 The phenotype trait $",NOT$trait.1,"$ is expressed for each individual $",NOT$ind,"$ and at each instance of time $",NOT$time,"$, in each high-level group ",NOT$group,"."),
    
    # Step by Step Input section
    "inputStepbyStepDesign" = "In this section you will configure your simulation and sampling design by entering your 
                            desired parameter values. All the parameters have default values that you 
                            can decide to modify or not.",
    "inputSimDesign"        = "You have to start by generating your world by setting the duration of your study. 
                            The default is set to 100 time steps but you can generate less or more time steps. 
                            You can also select the number of replicated populations you want to generate 
                            (note that data from different populations will be saved in the same output 
                            file that you could later use to run statistical analyses).
                            The replicated populations are generated independently using the 
                            same simulation design that has been initially inputted by the user. 
                            The second step is to decide how many individuals will you create in each sampled population, 
                            how many traits you will create for each individual (max = 2), 
                            and how many groups of individuals will you define within each population.
                            Note that the number of individuals has to be divisible by the number of groups.",
    "inputEnvironment_1"    = paste("You have now to decide what types of environmental effects you will generate for the simulated traits. 
                            In this section you can select a maximum of two environment effects ($",EQ2$env1,"$ and $",EQ2$env2,"$). 
                            These environments can be customized according to the various options 
                            displayed in their respective tabs. You can add stochastic, 
                            linear and cyclic effects to the general structured environmental effects. 
                            Each option can be added or deleted from the general environmental 
                            structure by respectively checking or unchecking its associated checkbox.",sep=""),
    "inputEnvironment_2"    = "For the <b>stochastic</b> effect you have to specify the variance for that environment. 
                            This variance will create stochastic variation in the environmental value from one time step to the next. 
                            Furthermore, within the stochastic environmental effect section, it is possible to add <b>auto-correlated</b> 
                            effects that follow the algorithm presented in the &ldquo;Description&rdquo; page. You have to specify the 
                            correlation value ranging from 0 to 1 that characterizes the magitude of temporal autocorrelation.",
    "inputEnvironment_3"    = "You can also choose whether or not the environment is showing a <b>linear</b> or a <b>cyclical</b> 
                            temporal trend. One more time, you have to specify the parameter values for each 
                            option such as the intercept and the slope for the linear effect and the amplitude, 
                            the period, the horizontal shift and the vertical shift for the cyclic effect.
                            Therefore, if you select the three options you can create linearly increasing 
                            environmental values with some cyclic and stochastic variation from time to time.",
    "inputEnvironment_4"    = "For each environment type (stochastic, linear and cyclic), you can also choose whether that 
                            environmental effect is shared or not between individuals by checking or not 
                            the &ldquo;Shared environment&rdquo; checkbox. For instance, you could decide to share 
                            the stochastic and linear environmental effects between individuals while the 
                            cyclic effect is not shared. When an environment effect is not shared 
                            between individuals an input cell appear showing the environmental 
                            variance value used to generate the different environments. 
                            These individual-specific environments are created by varying their parameters 
                            with a normal distribution where the mean is the parameter value itself and 
                            the variance is the specified environmental variance and that for each 
                            environment effect type.",
    "inputEnvironment_5"    = paste0("Furthermore, below each environmental option a graph of the general environmental 
                            structure is displayed in order to facilitate the environment visualisation 
                            before running the simulation. Note that when the environment is shared (general to all individuals) only 
                            one environmental pattern is displayed. In contrast, when the environment 
                            is not shared (specific to each individual) multiple environment patterns (one for each individual) 
                            are instead displayed in different colours. 
                            To understand how the environment generator works we suggest to start 
                            with simple environmental structures such as only linear or cyclic and 
                            then add further complexity by combining multiple environmental effect types.
  													Also, remember that in SQuID the final output of each 
  													environmental effect ($",EQ2$env1,"$, $",EQ2$env2,"$ and $",EQ2$env12,"$) is 
  													expressed in unit variance (i.e., $V_{",NOT$env,"}=1$) and mean-centered (i.e., $E(",NOT$env,")=0$).
  													However, the previsualization graph below displays the generated environmental data before standardization."),
    "inputEnvironment_6"    = paste("Finally, you can add a third environmental effect corresponding to the 
                            interaction between $",EQ2$env1,"$ and $",EQ2$env2,"$. 
                            Note that an environmental interaction is allowed only when $",EQ2$env1,"$ 
                            and $",EQ2$env2,"$ are selected.",sep=""),
    "inputEnvironment_7"    = "For the analysis part, these environmental effects can be known or unknown to the researcher.
                            For the known environment we assume that you have been able to measure 
                            the environmental values and thus will be able to use them for further analyses. 
                            Unknown environments, in contrast, represent environments that 
                            are not measured. This corresponds to the cumulative effects 
                            of the many environmental predictors on your trait that you did not 
                            have the opportunity to measure but that are still affecting it.",
    
    
    "inputEquation"        = "You are not yet at the stage where you generate the phenotypic values of the trait(s). 
                            Note that the program gives you the phenotypic equation of the model you just set up. 
                            Any change in the parameters of the model will lead to a change in 
                            the equation that is shown below.",
    
    "inputPhenDesign"      = "The section below allows you to enter all the information on the variance components 
                            affecting the phenotypic values of the trait(s). It is a dynamic section that 
                            changes according to the parameters you have included earlier in the model. 
                            For example when you choose to simulate two traits you obtain a matrix of 
                            variance/correlation for the two traits taht otherwise does not appear. 
                            Depending on the model you have specified 
                            earlier some of the matrix cells will appear in colour. 
                            These are the variance and correlation components that you can choose 
                            to specify according to the model you have chosen before.
                            The section is organised so that you can specify population mean values on top, 
                            and then individual variance/correlation values. At the bottom of the window you 
                            have the option to add some residual and grouping variance.
                            Please pay attention that in the matrix below, the <b>correlation</b> between each component 
                            pair has to be entered and not the covariance.",
    
    "inputVarSummary"      = "Congratulation you just got your simulation design configured. 
                            At this point you can visualize a summary of all the variances  and covariances 
                            of the model that you just defined. 
                            This summary table contains the value of each variance in addition to its proportion 
                            according to the total phenotypic variance.",
    
    "inputSamplingDesign_1"= "Now you have simulated populations of individuals each with trait values for each time step. 
                            It is time to sample as a biologist would by capturing and testing or observing 
                            individuals for a limited amount of time during the study period. 
                            To mimic this situation SQuID offers several options related to the 
                            sampling design you want to use.",
    "inputSamplingDesign_2"= "In the top left hand side of the sampling design section you have to enter the average 
                            number of records per trait. This number has to be between 1 and the number of 
                            time steps of the study period. SQuID does not let you specify other numbers. 
                            In the input cell underneath you can enter a value for the among-individual 
                            variance in timing of sampling (between 0 and 0.95); a variance of zero means 
                            that you have no among-individual differences in the timing of sampling. 
                            An increase in the variance leads to a decrease in the overlap between 
                            individual samples thus a decrease in the time of sampling for each individual.",
    "inputSamplingDesign_3"= "On the right hand side of the section, there are little check boxes that 
                            allow you to indicate whether you want the same or different numbers of 
                            records per individual, and if you want individuals to be sampled at the 
                            same or different times (when you have two traits you can specify 
                            whether you want records for the two traits at the same or different 
                            times and the same or different number of records for the two traits). 
                            Note that if you click on the box untitled &ldquo;same sampling time among 
                            individuals&rdquo; SQuID will automatically consider that the number of 
                            sampled records is the same between individuals in addition that records are taken
                            at the same time.",
    "inputSamplingDesign_4"= paste0('Finally, SQuID offers a previsualization of the sampling design. 
                            The figure shows when the trait $',NOT$trait.1,'$ of the first 5 individuals will be sampled. 
                            The preview figure will be updated automatically when the user changes one 
                            of the sampling parameters. Note that the sampling design displayed is 
                            just one of many possible examples. We suggest to press the "Refresh" button 
                            in order to visualize other possible examples of sampling designs that are generated 
                            according to the rules defined by the entered parameters.'),
    
    "inputRun"             = "It is now time to run your simulation and to check the output in the output tab. 
                            Note that if any inputs have been improperly entered the run button will be 
                            inaccessible and it will not be possible to run the simulation.
                            For instance, this could happen if you enter a correlation value in the 
                            correlation/variance matrix that is out of the authorized range (between -1 and 1) 
                            or if the number of sampled records is higher than the duration of the sampling period. 
                            In that case you should fix all the input errors and then run 
                            the simulation. ",
    
    "inputRcode"          = "Note that simulations can also be run directly in R using our function <i>squidR()</i>. 
													 You can download the R code required to run the current 
													 simulation that is based on the parameter values you have entered.",   
    
    "output_1"            = "While you are running the simulation, SQuID is bringing you to the output tab. 
                          Here you have the opportunity to download generated (raw and sampled) 
                          data or to inspect figures showing different components of 
                          your simulation such as the environment patterns, 
                          the individual phenotypic values, and the sampling 
                          events over the simulation time. ",
    "output_2"            = "The first section contains figures that show how the different environmental parameters 
                          are distributed in time. When you do not set up any environment 
                          parameters the figure show a flat line.",
    "output_3"            = "If you click on the &ldquo;Individual Phenotypes&rdquo; option you can access to top figure 
                          showing the complete set of values for each individual at each time step, 
                          and the bottom one showing the values sampled for each individual according 
                          to your sampling design.",
    "output_4"            = "Finally by clicking on the &ldquo;Sampling time&rdquo; option you can see a figure illustrating 
                          the distribution of sampling occasions 
                          for each individual through time.",
    "output_5"            = "We also provide a brief description of the generated data, 
                          either raw data or sampled data, which are available to 
                          download as a .csv files.",
    "output_figure_color" = paste0("The figures below show the data related to one trait ($",NOT$trait.1,"$) and one 
                                replicate of the 20 first individuals of the simulated population."),
    
    
    
    
    
    
    
    
    
    
    "last" = "last"
    
    
    
  ),
  
  # Step 1 --------------
  "Mod1Step1_txt" = list(
    
    "title"      = "Step 1: Mean and variance when the trait is expressed once and does not change",
    "goal"    = "In the first step of this module we aim to illustrate the concepts of mean and variance, 
                  for traits with no within-individual variance, but that include measurement error.",
    "intro"      = paste("<b>Background</b> <br>
                       Imagine a trait as it is typically measured: for a group of individuals from a population that is
                       is characterised by its mean ($",NOT$mu,"$) and its variance ($V_",NOT$total,"$).",sep=""),
    
    "para1"      = paste("Every time that we measure something, our measurement is likely to be in accurate, i.e. include error. For example,
                       due to faulty or poorly calibrated equipment, or because it was raining and we rushed the measurement.
                       We assume that this error is non-directional, for example, in the case of body size we could measure an individual as
                       both too large and too small, and we do not consistently measure males as too large and females as too small. Ideally, measurement error represents only a small portion of 
                       the total variance $V_",NOT$total,"$. The larger the variance of the measurement error $V_", NOT$mError, "$ the more likely it becomes
                       that our inference on other variance components is inaccurate, if it is not controlled for. Thus, generally we want the variance 
                       of our measurement error to be low, for example lower than 5% of the total variance. However, the measurement some traits is more involved
                      than that of other traits, so that some traits are associated with higher measurement error than others.",sep=""),
    
    "explanation1"  = paste("A statistical model usually incorporates several kinds of variance components to control for the different aspects that
                          drive the variance on the trait. Measurement error can be one source of variance, but another that is usually part of a
                          statistical model is &ldquo;error variance&rdquo; or &ldquo;residual variance&rdquo;.
                          Residual variance accounts for other sources of error, besides measurement error.
                          To distinguish these with notation, we will use $V_",NOT$mError,"$ for the variance of the measurement error 
                          and $V_",NOT$residualUpper,"$ for the variance of the residual (i.e. left-over) error. In this particular step we assume, 
                          $V_",NOT$residualUpper,"=V_",NOT$mError,"$, i.e. that all of the variance in the residuals is due to measurement error. ",sep=""),
    
    "exercise"   = "<b>Exercise</b> <br> The following app facilitates you to explore the consequences of measurement error on traits.
                  In this instance, we assume that we only have one value of the trait for each individual. You first have to select how many 
                  individuals you want to 'measure'. Second, you select the magnitude of the measurement error variance. Then, hitting the 'run' button
                  visualizes the results.",
    
    "note1"      = paste("Note that in this module, the total phenotypic variance $(V_",NOT$total,")$ is restrained to 1. 
                       This will allow a better understanding of the proportions of the different model variance components.",sep=""),
    
    "point"      = paste("We will differentiate here between a the true total variance $V_",NOT$total, "$, and an estimate of the total variance, $\\hat{V}_",NOT$total, "$. 
                       The total variance hehre can be partitioned into that due to individual differences $(V_",NOT$devI,")$ and that associated with the measurement error $(V_",NOT$mError,")$.
                       The variance associated with the measurement process $(\\hat{V}_",NOT$total,")$ is likely to be higher than the
                       variance associated with differences between individuals $(V_",NOT$devI,")$, if there is measurement error (and,  let's face it, 
                       who measures without error?!). And, the estimated total variance $\\hat{V}_",NOT$total,"$
                       typically differs slightly from the truth because we only have a sample
                       from a population (typically it is too expensive to sample the whole population), and our sample might not perfectly represent the properties of population. 
                       This difference is caused by <i>sampling variance</i>.",sep=""),
    
    "solutions"  = "<b>Solutions</b> <br> The impact of measurement error can be reduced by
                  controlling for it in a statistical model. If our sample size is large, and we have a correctly specified statistical model,
                  we expect the variance estimate to accurately that of the true population. If we have a small sample size, or if our model is incorrectly specified,
                  this might unfortunately not b ethe case. To be able to estimate the measurement error variance, individuals need to be measured more than once.
                  Afterall, we do not expect certain traits on an individual to change between samplings, so any difference
                  is then due to measurement error. This concept is further explained in step two of this module.",
    
    "statModTitle"  = "<b>Statistical model</b>",
    "statmodel1"  = "Throughout these modules we will inform you of the statistical 
                  model that we are exploring in every step. These are usually provided in the form of two different types of equations. 
                  The first is an equation that describes the data 
                  (particular measurements on individual phenotypes). Since we are using 
                  phenotypic measures as the focus here, we call this the &ldquo;phenotypic equation&rdquo;. 
                  You have just explored the following phenotypic equation:",
    "statmodel1_eq1" = paste("$$",NOT$trait.1,"_{",NOT$time,NOT$ind,"}=",NOT$devI,"_",NOT$ind,"+",NOT$error,"_{",NOT$time,NOT$ind,"},$$",sep=""),
    
    "statmodel2"  = paste0("where $",NOT$trait.1,"_{",NOT$time,NOT$ind,"}$ is the measured phenotypic 
                          value of the $h^{th}$ measurement 
                         (in this case $",NOT$time,"$ = 1) on the $i^{th}$ individual, $",NOT$devI,"_",NOT$ind,"$ is the mean
                         of the trait (also called an intercept in a regression), and $",NOT$error,"_{",NOT$time,NOT$ind,"}$ is the residual 
                         , i.e. the left-over information in the data after accounting for the other  components of the model.
                         In this scenario, this represented measurement error, because that was not incorporated in the model."),
    
    "statmodel3"  = paste0("The second type of equation demontrates how the phenotypic variance is partitioned,
                         where the terms are defined as above. These have direct connection 
                         to the values in the phenotypic equation, with the exception 
                         that in this scenario the variance in $",NOT$error,"_{",NOT$time,NOT$ind,"}$, i.e. the residual variance,
                         is associated with measurement error $(V_",NOT$mError,").$"),
    "statmodel3_eq1" = paste("$$V_p=V_",NOT$devI,"+V_",NOT$mError,".$$",sep="")
  ),
  
  # Step 2 --------------
  "Mod1Step2_txt" = list(    
    "title"     = "Step 2: Repeatability and measurement error",
    "goal"   = paste0("In this second step, we will focus on measurement error variance $(V_",NOT$mError,")$ 
                    in traits varying solely among individuals."),
    "intro"     = "<b>Background</b> <br> In the first step of this module we focussed on different sources of variance, 
                  and variance due to measurement error in particular. From this you learned that some of the observed 
                  variation in data might be due to measurement error, 
                  which occurs when the measured trait value deviates 
                  from its true biological value due to e.g. faulty equipment. In essence, besides our biological process there is another
                  process going on that we need to explicitly incorporate in the statistical model: the measurement process.
                  Here, we focus on how we retrieve an estimate of the measurement error variance. 
                  Before we begin, for simplicity we first assume that we have a trait that is constant
                  for individuals (cf. a &lsquo;fixed&rsquo; rather than &lsquo;labile&rsquo; trait, 
                  e.g. structural size in adulthood). Measurement error variance can only be estimated 
                  if you measure the same set of individuals multiple times 
                  (preferably in a blind and randomized order), and the measurements slightly differ (because if they do not, there is no variance!). Since the trait values are fixed, 
                  any deviation in the measurements of the same individuals is due to measurement error.",
    "exercise"    = paste("<b>Exercise</b> <br> In this exercise, 
                  it is best if you start off with a set of parameters that you also explored in the app of the previous step, 
                  for the number of individuals and for the measurement error 
                  ($V_",NOT$mError,"$; expressed as a proportion of the total phenotypic variance, $V_",NOT$total,"$). Additionally, you will here
                  specify how often each individual is measured. We call this variable &lsquo;number of trait expressions&rsquo;.",sep=""),
    
    "para1"   =   "For simplicity, we assume that each individual 
                is measured the same number of times. The minimum number of trait expressions
                is two, since we are interested in exploring scenarios where individuals are
                measured repeatedly. The purpose of this app is for you to explore the effects of
                repeated measurements of an  invididual on the measurement error. The number of repeated measurements 
                per individual affects how closesly the estimated variance for the measurement error approaches the true variance in the measurement process, because
                the more measurements we have, the better an impression we get of the difference in the trait induced by each measurement.",
    
    "para2"   =  paste("In the bottom of the app you can find a button to show extra information. 
                There, you find the app output in the form of a collection of figures and tables that show the estimated values.
                The three plots show the distribution of the simulated phenotypes, and the associated estimated total phenotypic variance $(\\hat{V}_",NOT$total,")$, 
                the estimated variance among individuals $(\\hat{V}_",NOT$devI,")$, and 
                the estimated variance within individuals $(\\hat{V}_",NOT$mError,")$. 
                It demonstrates graphically that $\\hat{V}_",NOT$total,"=\\hat{V}_",NOT$devI,"+\\hat{V}_",NOT$mError,"$.",sep=""),
    
    "para3"   =   "The 'estimated values' are coefficients from a linear mixed-effects model fitted to the simulated data. The coefficients are
                presented next to the true values (i.e. your inputs) for comparison. 
                Compare how the estimated values deviate from the true values; 
                try different numbers for the &lsquo;number of trait expressions&rsquo; 
                to see how the number of repeated measurements per individual 
                affects the accuracy of the estimates, how much their deviation from the true values changes.",
    
    "point"   =  "If you tried the same inputs as for step one you will notice
                that we are now (more) properly estimating the individual variance. 
                This is because we have explicitly incorporated the within-individual variance 
                due to measurement error by measuring each individual (at least) twice.",
    
    "para4"   =  "By now you will have noticed the text 'repeatability' above the run button in the app, which changes with youor input.
                Repeatbility expresses the amount of biological variance as a proportion 
                of the total observed variance in the form of a standardized metric:",
    "para4_eq1" = paste("$$Repeatability=\\frac{\\hat{V}_",NOT$devI,"}{\\hat{V}_",NOT$devI,"+\\hat{V}_",NOT$mError,"}.$$",sep=""),
    
    "para5"   =  "Measurement error can obscure the true biological variance, so repeatability tells you how well your current measurement predicts a 
                future measurement of the same individual. Logically, the repeatability 
                is one if there is no measurement error (try it out!). The effect 
                of measurement error can be nicely illustrated in a plot where we visualize the first and second measurement.",
    
    "para6"   =  paste0("The final scatterplot hidden under 'extra results' shows how correlated the first and second measurements are. 
                In the absence of measurement error (i.e., $V_",NOT$mError,"=0$), 
                all points align on a line ($y=x$). If you have experimented with different valuees for the measurement error variance $V_",NOT$mError,"$; 
                you might have noticed that the higher the value, the more widely the data points get dispersed around $y=x$, 
                i.e. the higher the measurement error the lower our ability 
                to predict an individual's phenotype based on a previous measurement. 
                Repeatability thus provides an assessment of how well one has measured 
                a particular phenotype. Repeatability can be used for several other purposes too, 
                in which case the way it is calculated may vary. We will develop some of these nuances later on."),
    "RCode"      = "# install.packages(&quot;lme4&quot;)<br>
                  LMM <- lme4::lmer(Phenotype ~ 0 + (1|Individual), data = sampled_data)"
  ),
  
  # Step 3 --------------
  "Mod1Step3_txt" = list(  
    "title"     = "Step 3: Within- and among-individual variance",
    
    "goal"   = "In this step, our goal is to illustrate the hierarchical structure of variance when individuals 
                         express traits multiple times, when a trait varies within-individuals.",
    
    
    "intro"     = "<b>Background</b><br> Traits for individuals may vary at
                times due to the influence of the environment. Collecting two or more measures 
                for each individual then provides additional information. 
                We have already emphasized that measuring a trait multiple times allows for the estimation of measurement error. 
                If the measurements are spread over time, it also becomes possible to determine
                how much variance in the trait can be attributued to the environment and how the phenotype 
                responds to the environment. Moreover, repeatedly measuring a trait can elaborate
                whether differences among individuals are solely due to differences in the 
                environment at the time of the measurement, or if there is an additional unknown source of variation.",
    
    
    "exercise"  = paste0("<b>Exercise</b><br> The following app builds on the previous two apps by adding
                       the option to select the among-individual variance of a random intercept term. 
                       It allows you to test how the number of individuals sampled and the number 
                       of repeated measures per individual affect the estimation of ","$V_",NOT$devI,"$.
                      Previously, you generated a population of individuals that varied in 
                      their true value $(V_",NOT$devI,")$ and also due to measurement error $(V_",NOT$mError,")$. 
                      We then assumed that individuals had the same trait value throughout 
                      the duration of our study. But, what if trait values changed over time, 
                      perhaps in response to some environmental gradient? To start exploring this idea, 
                      let's assume that all individuals would respond to this gradient in the same way, 
                      but they might experience different values of the environment.  
                      This means that in addition to $V_",NOT$devI,"$ and $V_",NOT$mError,"$ there is variation due to the population 
                      mean response to an environmental effect on the phenotype of an individual. 
                      In this step, the environmental effect is considered individual-specific 
                      but unknown to the observer. An (individual-) specific environmental effect 
                      means that each individual of the population will experience different environmental 
                      conditions than do other individuals. For instance, the intensity of 
                      intra- and inter-specific competition within a population might be experienced 
                      differently between individuals. An unknown environmental effect represents 
                      environmental values that are not measured thus cannot be included in the statistical analysis. 
                      Earlier we noted that $V_",NOT$residualUpper,"$ is called &ldquo;residual variance&rdquo;. Now, unknown, 
                      environmental variance will be combined with $V_",NOT$mError,"$ to make $V_",NOT$residualUpper,"$, 
                      and is the primary reason for calling it &ldquo;residual&rdquo; variance.  
                      In reality, there may be many environmental effects, both known and unknown. 
                      We will use the term $V_",NOT$envEffect,"$ to refer to all phenotypic variance due to the environment. 
                      Known environmental variance will be indicated by $V_{",NOT$mean," ",NOT$env,"}$."),
    
    "exercise2"  = paste0("In this exercise, let's assume there is only one environmental effect. 
                        We will specify it to generate phenotypes, so let's use the term $V_{",NOT$mean," ",NOT$env,"}$. 
                        You can thus try several combinations of $V_",NOT$mError,"$, $V_",NOT$devI,"$, and $V_{",NOT$mean," ",NOT$env,"}$ 
                        (with the constraint that they add up to 1) to uncover how the input values 
                        affect the estimates of repeatability and each variance component. 
                        Just remember that for now $V_{",NOT$mean," ",NOT$env,"}$ is one environmental effect but 
                        it will be measured as part of the residual."),
    
    "para1"    = "Once again you can calculate repeatability as",
    "para1_eq1" = paste("$$Repeatability=\\frac{\\hat{V}_",NOT$devI,"}{\\hat{V}_",NOT$devI,"+\\hat{V}_",NOT$residualUpper,"}.$$",sep=""),
    
    
    "point"    = paste0("We can now estimate a particular variance component 
                of $V_{",NOT$total,"}$ that represents among-individual differences that are consistent through time. 
                This variance is also, in some circumstances, the index for individual 
                &ldquo;personality&rdquo; differences. The residual variance combines both measurement 
                error and the variance due to the unmeasured (unknown) specific environment to each individual. 
                $V_{",NOT$envEffect,"}$ in general reflects plasticity to unknown environments, 
                with $V_{",NOT$mean," ",NOT$env,"}$ indicating variance due to a specified environmental predictor $(",NOT$env,")$, 
                which so far has not been measured."),
    "point2"    = "Repeatability now does not represent the same thing as previously 
                because the denominator of the ratio includes both measurement error 
                and variance due to plasticity. This new repeatability is not simply 
                a measure of your skill at measuring phenotypes. 
                Instead, it now is an estimate of a biological phenomenon: 
                consistent individual differences (i.e. personality in the case of behaviour). 
                This estimate is conservative because measurement error reduces the estimate 
                to be less than the true biological repeatability. Measurement errors 
                in this scenario are not separable from the plastic response of individuals 
                to an unmeasured environment. To calculate measurement error alone, 
                you would have to collect more than one measure on the same trait 
                for each individual in the same environment (e.g. two persons can observe the behaviour 
                of an individual on the same video recording or measure the trait at close to the same time).",
    
    "statmodel"   = "Because the environmental effect in this scenario was unknown, 
                    the statistical models are the same as before, with two exceptions.  
                    First, the phenotypic equation is as before,",
    "statmodel_eq1" = paste("$$",NOT$trait.1,"_{",NOT$time,NOT$ind,"}=",NOT$devI,"_",NOT$ind,"+",  NOT$error,"_{",NOT$time,NOT$ind,"},$$",sep=""),
    
    "statmodel2"  = paste0("except that $",NOT$error,"_{",NOT$time,NOT$ind,"}$ contains both measurement 
                           error and deviations described by $",NOT$mean," ",NOT$env,"_{",NOT$time,NOT$ind,"}$"),
    "statmodel2_eq1" = paste("The variance equation is now ","$$V_",NOT$total,"=V_",NOT$devI,"+V_",NOT$residualUpper,",$$",sep=""),
    "statmodel2_eq2" = paste("$$V_",NOT$residualUpper,"=V_{",NOT$mean," ",NOT$env,"}+V_",NOT$mError,".$$",sep=""),
    
    "RCode"       = "# install.packages(&quot;lme4&quot;)<br>
                  LMM <- lme4::lmer(Phenotype ~ 0 + (1|Individual), data = sampled_data)"
  ),
  
  
  # Step 4 --------------
  "Mod1Step4_txt" = list( 
    "title"     = "Step 4: Explaining Environmental Variance",
    
    "goal"   = "Here we will go further explain the concept of environmental variance.",
    "intro"     = paste0("<b>Background</b><br> In the third step of this module we introduced $V_{",NOT$mean," ",NOT$env,"}$ 
                       as the variance in a phenotype due to changes in the environment. 
                       At that point we were unaware of what that effect represented (it was unmeasured). However,
                       usually we can measure the environment, and assess its influence on a phenotype. 
                       In this step, we consider that concept a bit further."),
    "exercise"    = paste0("<b>Exercise</b><br> As before, we will generate a new group of individuals, 
                  with phenotypic variance due to measurement error $(V_",NOT$mError,")$, individual differences $(V_",NOT$devI,")$, but now also
                  due to measured environmental effects $(V_{",NOT$mean," ",NOT$env,"})$. 
                  In the app below, you can set $V_",NOT$mError,"$, $V_",NOT$devI,"$ and $V_{",NOT$mean," ",NOT$env,"}$, but we suggest to use the same values as you did in step three.
                  The app requires the variances to add up to one, as this simplifies calculating the percentage of contribution to the total variance by each term in the model."),
    
    "para1"    = paste0("At this point, we will further expand on the idea of statistical models. 
                The equations of the effects that produce each individual data point represent our
                hypotheses about the real world. In the made-up world of SQuID, 
                statistical models have the potential of recreating it exactly. 
                The real world is different, and most of the modules that we cover focus 
                on scenarios where much is unknown. For now, we will specify a model that should recreate our simulated set of effects 
                completely (with the caveat that we are sampling from an infinite population so 
                observed values will differ from input values). This new model will make explicit 
                that $",NOT$devI,"_",NOT$ind,"$ is defined as the deviation of each individual from a population value. 
                Until now, we have assumed that $",NOT$devI,"_",NOT$ind,"$ was zero.
                But, since we are now including a slope term that allows us to explain environmental variation, 
                it is important to also introduce the population intercept term. 
                For now, we will keep the population mean equal to zero in our simulations, but retain the intercept in all 
                equations for demonstration purposes. The statistical model is:"),
    "para1_eq1" = paste("$$",NOT$trait.1,"_{",NOT$time,NOT$ind,"}=", EQ3$mean0, "+", NOT$devI,"_",NOT$ind,"+", NOT$mean," ", NOT$env,"_{",NOT$time,NOT$ind,"} +", NOT$error,"_{",NOT$time,NOT$ind,"},$$",sep=""),
    
    "para2"    = paste0("where $",NOT$trait.1,"_{",NOT$time,NOT$ind,"}$ is the phenotype measured at the 
                     $",NOT$time,"^{th}$ time for the $",NOT$ind,"^{th}$ individual, 
                     $",EQ3$mean0,"$ is the population mean phenotype, 
                     $",NOT$devI,"_",NOT$ind,"$ is the individual mean deviation from the population mean for the $",NOT$ind,"^{th}$ individual, 
                     $",NOT$mean,"$ is the population-level effect of measured environment $",NOT$env,"_{",NOT$time,NOT$ind,"}$ on the measure of phenotype, 
                     and $",NOT$error,"_{",NOT$time,NOT$ind,"}$ is the residual error."),
    
    "note1"    = paste0("Note that in SQuID each environmental effect $(",NOT$env,")$ is expressed in unit variance 
                      (i.e., $V_{",NOT$env,"}=1$) and mean-centered (i.e., $E(",NOT$env,")=0$).
                      Then $V_{",NOT$mean," ",NOT$env,"}=V_{",NOT$mean," ",NOT$env,"}=",NOT$mean,"^2V_{",NOT$env,"}=",NOT$mean,"^2$"),
    
    "para3"    = "A mixed statistical model estimates these parameters:",
    "para4"    = "The first (left-hand) plot that the app generates visualizes the effect of the simulated environment on the phenotype. 
                In contrast, the right-hand plot expresses the assumption of a population-level intercept (as in the left-hand plot) to that of an individual-level intercept.",
    
    "para5"    = paste0("We encourage you to test the effects of the magnitude of $V_",NOT$mError,"$ 
                on the estimates of  $",NOT$mean,"$
                and $V_",NOT$devI,"$. You can also play around with the slope and the ratio of 
                $V_{",NOT$mean," ",NOT$env,"}$ and $V_",NOT$devI,"$ to better understand the effects."),
    
    "point"    = "This exercise introduced predictors (also known as fixed-effects). 
               Since we treated individual as a random-effect, we refer to this model as a mixed-effects model, as it included both fixed- and random-effects. 
               The fixed-effect part is the same as in an ordinary linear regression. Even if this is all you want to do with your data, 
               it is vital to understand that a sampling regime in which individuals 
               are measured more than once creates the need to account for <i>pseudoreplication</i> using a mixed-effects model. 
               Although we do not focus much on significance testing here, the structure of data collected 
               in this simulation strongly affects inferences based on hypothesis testing. 
               More importantly, the combination of random-effects and fixed-effects sets one up 
               to investigate a wide array of processes involved at one or more levels in 
               this hierarchal structure of among versus within-individual variance.",
    "RCode"    = "# install.packages(&quot;lme4&quot;)<br>
               LMM <- lme4::lmer(Phenotype ~ 1 + X1 + (1|Individual), data = sampled_data)",
    "statMod_eq1" = paste("$$",NOT$trait.1,"_{",NOT$time,NOT$ind,"}=", EQ3$mean0, "+", NOT$devI,"_",NOT$ind,"+", NOT$mean," ", NOT$env,"_{",NOT$time,NOT$ind,"} +", NOT$error,"_{",NOT$time,NOT$ind,"},$$",sep=""),
    "statMod_eq2" = paste("$$V_",NOT$total,"=V_",NOT$devI,"+V_{",NOT$mean," ",NOT$env,"}+V_",NOT$mError,".$$",sep="")
  ),
  
  "module3_txt" = list(
    "title" = "Exploring the impact of sampling",
    "goal"  = "<b>Goal:</b> Real studies encounter a variety of issues that affects the conclusions 
            that can be drawn from data analysis. Here, we explore the real world problem of 
            biases in sampling and what happens when the researcher does not know about the 
            reason for the bias. We also then investigate how the results from data analysis 
            improve as the researcher knows more about the underlying mechanisms leading to biased sampling."        
  ),
  
  # Step 1 --------------
  "Mod2Step1_txt" = list(
    
    "title"      = "Step 1: Sampling and non-stochastic environment",
    "goal"    = "Here we explore how hidden patterns in the environment, combined with variance in sampling, affect the accuracy and interpretation of parameter estimates.",
    
    "intro"      = paste0("<b>Background</b><br> In the previous module <i>",Module_titles$mod1,"</i>, 
                        we partitioned phenotypic variance into several components: 
                        the variance among individuals, $V_",NOT$devI,"$, the variance of measurement error, $V_",NOT$mError,"$, 
                        and variance due to the environment, $V_",NOT$envEffect,"$. In the final step of that module, 
                        we illustrated how measurements of the environment can help explain some of the phenotypic variance. 
                        Often when we study phenotypes in natural populations, many aspects of the environment
                        that affect phenotypes will be unknown, i.e. unmeasured. In the third step of the first module, 
                        unmeasured environmental variance ended up as &ldquo;residual&rdquo; variance. We assumed the environment was
                        randomly determined from one sampling period to another, and that all individuals were sampled at the same time. As a consequence,
                        all individuals experienced the same environment, and it thus had no effect on the estimate of the among-individual variance.
                        In the present module we explore what happens when we relax this assumption, for example when the environment changes during the sampling period. 
                        If the timing of measurements differ for individuals ( we are usually unable to measure them at the same time),
                          how do you think this will affect the total phenotypic variance?"),
    
    "exercise"   = paste0("<b>Exercise</b><br> As in previous simulations, we will generate a new group of individuals, 
                        with phenotypic variation generated by measurement error $(V_",NOT$mError,")$, individual differences $(V_",NOT$devI,")$, 
                        and now also with the impact of an environmental predictor $",NOT$env,"$. This predictor causes phenotypic variance to increase, due 
                        to differences in the environment $(V_",NOT$envEffect,")$ between  individuals.
                        We here use $V_",NOT$envEffect,"$ to indicate variance due to the unmeasured environmental predictors, instead of $V_{",NOT$mean," ",NOT$env,"}$, 
                        which we used in step three and step four of the module on ",Module_titles$mod1,". 
                        We do this because we will soon explore what happens when only some of the environmental 
                        predictors are known, and we will use $V_{",NOT$mean," ",NOT$env,"}$ for variance due to measured environmental predictors."),
    
    "para1"      = paste0("As before, you can set $V_",NOT$mError,"$, $V_",NOT$devI,"$ and $V_{",NOT$envEffect,"}$, 
                        and for this module, $V_{",NOT$envEffect,"}$ must be greater than 0."),
    
    "note1"      = paste0("Note that from now on, the total variance ($V_",NOT$total,"$) is not restrained to 1 anymore 
                        and the proportion of each variance component is shown next to the input element."),
    "note2"      = "Also, the number of individuals will be set to 100 all along this module.",
    
    "para2"      = paste0("The environment for this simulation is, for convenience, set as being linear over time, 
                  affecting all individuals similarly (i.e., it is &ldquo;shared&rdquo;). 
                  The environment is also expressed with unit variance (i.e., $V_{",NOT$env,"}=1$) 
                  and mean-centered (i.e., $E(",NOT$env,")=0$)."),
    "para3_image" = '<div style="clear:both; text-align:center"><img id="Vit" src="images/Vit_examples.jpg" alt="Examples of among-individual variance in timing of sampling" width=80% height=80%></div>',
    "para3_image_caption" =paste("<b>Figure:</b> two examples of 4 individuals that are sampled 5 times each and that among-individual variance in timing of sampling $(",general_VAR$btwIndVarTimSamp,")$ is 0.1 (left) and 0.9 (right).<br><br>",sep=""),
    "para3"      = "Next we also enter parameters for variance in the sampling timing within 
                  and among individuals. For this simulation, the total number of expressions of 
                  the phenotype from which you can sample is fixed at 100. While you can vary the 
                  number of individual samples taken, for this module to effectively illustrate the 
                  issues with sampling, the number of samples must be much less than 100. 
                  The key parameter to be entered by you will be the among-individual variance in timing 
                  of those records. To illustrate, below are examples of sampling records for a small 
                  number of individuals when the among-individual variance in sampling timing is 0, 
                  and when it is 0.9.",
    "para4"      = "Now you can try yourself in the following app. The plot shows time of sampling of a subset of individuals according to the values entered.",
    
    "para5"      = "If we have no information about the environment, we would fit the model:",
    "para5_eq1" = paste0("$$",NOT$trait.1,"_{",NOT$time,NOT$ind,"}=",NOT$devI,"_",NOT$ind,"+",NOT$error,"_{",NOT$time,NOT$ind,"}.$$"),
    
    "RCode"      = "# install.packages(&quot;lme4&quot;)<br>
                  LMM <- lme4::lmer(Phenotype ~ 0 + (1|Individual), data = sampled_data)",
    "para6"      = paste0("However, if the unmeasured environment changes over 
                        time AND there is among-individual variance in sampling and we fit this model, then $V_",NOT$envEffect,"$ is instead absorbed by the residual variance (making residual variance larger 
                        than just measurement variance $V_",NOT$mError,"$), and some might be absorbed by $V_",NOT$devI,"$, also making it bigger than it should be."),
    "conclusion"      = paste0("To conclude, if you do not account for among-individual variance in timing of sampling when needed, 
                        estimates of $V_",NOT$devI,"$ will be incorrect. Sampling biases thus have the potential to produce &ldquo;pseudo-personality&rdquo; or 
                        &ldquo;pseudo-repeatability&rdquo; (<a href='http://onlinelibrary.wiley.com/doi/10.1111/1365-2656.12013/abstract' target='_blank'>Dingemanse & Dochtermann 2013</a>) 
                        and could lead to overestimation of differences between individuals."),
    
    "para7"     = paste0("Among-individual variance in sampling, and systematic changes in the environment,
                  are likely in real systems. Next up, we explore how to get accurate estimates of $V_",NOT$devI,"$.")
  ),
  
  # Step 2 --------------
  "Mod2Step2_txt" = list(    
    "title"      = "Step 2: Sampling to reduce effects of non-stochastic environment",
    "goal"    = "In this step we use simulations to generate sampling regimes 
                  that limit the effects of non-stochastic environments.",
    "intro"      = "<b>Background</b><br> The first step of this module revealed a problem: non-stochastic environments 
                  through time and variability in the timing of sampling can create biases 
                  in estimates of among-individual variation. In this step we encourage you 
                  to adjust the sampling regime to minimize this problem. It should be obvious 
                  that if all individuals are sampled with the same timing, then the bias 
                  in the estimates of among-individual variance disappears, 
                  but it is worthwhile to assess how close one has to be to identical sampling,
                  and whether there are biases in other parameters that still remain. 
                  So, in this step we will get you to simulate several types of 
                  non-stochastic environments and adjust the sampling regime.",
    
    "exercise"   = paste0("<b>Exercise</b><br> As in the first step of this module, we will generate a new group of individuals, 
                        with phenotypic variance due to measurement error $(V_",NOT$mError,")$, individual differences $(V_",NOT$devI,")$, 
                        and the impact of the environment $(V_",NOT$envEffect,")$."),
    "para1"      =  "You now get to set the environment. In the first of this module, we used an environment that was 
    experienced similarly by all individuals (&ldquo;shared&rdquo;) and which changed systematically over time. 
                  Below, you can simulate data with different settings, e.g. to have environments that each individual experiences uniquely 
                  (&ldquo;unshared&rdquo;), or environments which change over time following some function (e.g., stochastically or 
                  with autocorrelation).",
    "para2"      =  "As in the first step of this module, you also must enter parameters for variance in the sampling timing 
                  within and among individuals. As before, the number of expressions of the 
                  phenotype will be fixed to 100, so keep this in mind as you enter values here.",
    "para3"      =  "The figure below shows time of sampling of a subset of individuals according to the values entered.",
    
    "para4"      =  "As before, the model we fit is wrong since the environmental effect is not included:",
    "para4_eq1" = paste0("$$",NOT$trait.1,"_{",NOT$time,NOT$ind,"}=",NOT$devI,"_",NOT$ind,"+",NOT$error,"_{",NOT$time,NOT$ind,"}.$$"),
    
    "RCode"      = "# install.packages(&quot;lme4&quot;)<br>
                  LMM <- lme4::lmer(Phenotype ~ 0 + (1|Individual), data = sampled_data)",
    "para5"      =  "We then estimate the parameters following this misspecified model, so that we can compare them with your inputs (see the table).",
    
    "para6"      =  paste0("The results of any given simulation may vary, but hopefuly the overall impression that emerges 
                         is that the estimates are more precise when $V_",NOT$envEffect,"$ is small, 
                         when individuals are measured more frequently, and when the sampling time is increasingly similar 
                         among individuals."), 
    "para7"      =  paste0("No matter what the sampling regime, 
                         the estimate of $V_",NOT$devI,"$ is too high if the environment is not shared among individuals. To understand that, we need return to the definitions 
                         of the variance components: we defined $V_",NOT$devI,"$ as the variance among individuals that 
                         affects their phenotype throughout the sampling period. Biologically, 
                         this can be ascribed to genetic differences, or to environments experienced before measurements started. 
                         When environments are not shared during sampling, the environment affects the phenotype each time it is expressed. However, because 
                         the environment is autocorrelated across sampling periods, and since it differs among individuals, 
                         apparent individual differences arise because individuals experience different environments,
                         not because they were different when they entered the period of phenotypic expression. 
                         This may lead you to think that since individuals in the real world partially 
                         choose their environment, their phenotype is not solely defined by the environment that we observe them in. 
                         Though that is true, it does not change the fact that the focal trait is sensitive 
                         to the environment the individual is, when it is expressed. We will get to 
                         the issue of multiple phenotypic characters and how they might integrate in the 
                         &ldquo;<i>",Module_titles$mod4,"</i>&rdquo; module."),
    "para8"     =  "To conclude, if you do not know what environment affects
                    trait expression, (identical) sampling in parallel for all individuals could account for biases created by non-stochastic environments. 
                    However, because unshared environments can create biases, even with identical 
                    sampling, the only other solution is to measure the environment and account for 
                    possible biases explicitly, which we explore next."
  ),
  
  # Step 3 --------------
  "Mod2Step3_txt" = list(  
    "title"      = "Step 3: Biased sampling and known and unknown environments",
    "goal"    = " Now we introduce ways to control for biases due to the environment.",
    
    "intro"      = paste0("<b>Background</b><br> The first step of this module illustrated that environmental 
                        effects on phenotypes can produce biases in estimates of among-individual variance $(V_",NOT$devI,")$.  
                        The second step of this module explored how altering sampling regimes can reduce this problem, but also revealed that in some circumstances adjusting the sampling regime is not sufficient. 
                        Sometimes individuals experience different environments, and no sampling regime can adjust for that. 
                        However, if it is possible to measure the environment then such differences can be accounted for. 
                        Environmental variance can be accounted for using linear mixed-effects models, as in the fourth step of the 
                        &ldquo;<i>",Module_titles$mod1,"</i>&rdquo; module. Here we demonstrate that this can, 
                        under some circumstances, solve the bias in the sampling."),
    "exercise1"  = paste0("<b>Exercise</b><br> We will generate a group of individuals with phenotypic variance due to measurement error $(V_",NOT$mError,")$, 
                        individual differences $(V_",NOT$devI,")$, and due to the impacts of the environment $(V_",NOT$envEffect,")$. The environment can be chosen as in second step of this module. 
                  Combined with the sampling regime, it will affect within- and among-individual 
                  variance in the environment. Additionally you get to set the proportion of the variance due to measured environmental effects.
                  Along with the proportion of total variance due to environmental this will determine the correlation 
                  between the phenotype and the known environment. The results of step one should 
                  have shown you what happens when all the environmental variance is unknown 
                  (or not included in your statistical model). Here, we start off by assuming that all 
                  of the environmental variance is due to measured effects, but you are free to adjust that and explore the consequences."),
    "results"    = paste0("In the fourth step of the module &ldquo;<i>",Module_titles$mod1,"</i>&rdquo;, 
                        the statistical model was"),
    "results_eq1" = paste0("$$",NOT$trait.1,"_{",NOT$time,NOT$ind,"}=",EQ3$mean0,"+",NOT$devI,"_",NOT$ind,"+",NOT$mean," ",NOT$env,"+",NOT$error,"_{",NOT$time,NOT$ind,"}.$$"),
    
    "RCode1"    = "# install.packages(&quot;lme4&quot;)<br>
                  LMM1 <- lme4::lmer(Phenotype ~ 1 + X1 + (1|Individual), data = sampled_data)",
    "para4"      = "This is the model we will investigate here too. 
                  We will compare it to a model in which all of the environmental 
                  variance is due to unmeasured environmental predictors:",
    "para4_eq1" = paste0("$$",NOT$trait.1,"_{",NOT$time,NOT$ind,"}=",EQ3$mean0,"+",NOT$devI,"_",NOT$ind,"+",NOT$error,"_{",NOT$time,NOT$ind,"}.$$"),
    "RCode2"    = "LMM2 <- lme4::lmer(Phenotype ~ 1 + (1|Individual), data = sampled_data)",
    "para5"      = paste0("This should show you that when there is among-individual variance in sampling 
                        and you can account for all the environmental variance with a predictor, 
                        any bias in $V_",NOT$devI,"$ due to the biased sampling disappears."),
    "reminder"   = paste0("A brief reminder about notation: when unknown environments affect phenotypic variance, 
                        we have referred to that variance as $V_",NOT$envEffect,"$.  In the model where the environment is known $(",NOT$env,")$, 
                        there now is a specific component of variance due to that known environmental predictor, 
                        $V_{",NOT$mean," ",NOT$env,"}$. In the case above, $V_",NOT$envEffect,"=V_{",NOT$mean," ",NOT$env,"}$, 
                        but in the real world with many environmental predictors, 
                        $V_{",NOT$mean," ",NOT$env,"}$ will be only a fraction of $V_",NOT$envEffect,"$."),
    "exercise2"  = "<b>Exercise</b><br> Now, let's repeat the same simulation as above, 
                  except this time explore what happens as you change the proportion of the environmental 
                  variance that is known. Below is the bar that allows you to adjust this.",
    "para6"      = "If you want, you can also change the level of bias in sampling.",
    "para7"      = "As above, we will show you the true values you entered, 
                  the values estimated when the environment is unknown, and those estimated 
                  when some portion of the environment is known and included in the model.",
    "conclusion" = "<b>Conclusion</b><br> There are two lessons to be learned from this step. 
                  First, biases in sampling are usually inevitable, but measuring the underlying 
                  environment, if they differ among individuals, can help reduce them. 
                  If you want to measure among-individual variance, 
                  it might be worthwile to consider measuring the environment, as 
                  it is likely to provide you with a better estimate of the among-individual variance.",
    "conclusion2" = paste0("The second lesson is that bias in sampling usually occurs without
                         you being aware of it. The unknown environment will affect 
                         your estimate of among-individual variance, and if left unaccounted for any among-individual variance estimated from real data could 
                         be due to unknown environments. It is impososible to be sure that 
                         you have accounted for all of the environmental variance, so better safe than sorry (and include it in your model)! 
                         Regardless, $V_",NOT$devI,"$ that is determined from real data must always be interpreted cautiously."),
    "finalcaveat" = paste0("A consequence of variance in sampling among individuals is that it produces variance in the experienced 
                         environment that exists both within and among individuals. We have assumed 
                         that the impact of the environmental variance that exists among individuals 
                         is the same as that of the variance in environment within-individuals. 
                         As an example, individuals may be on territories with different average 
                         levels of resources through the whole period of time you are taking measurements, 
                         and those resources may fluctuate some from day to day as well. Thus in your population, 
                         there is both among-individual variance in environment 
                         (e.g., differences between territories) and within-individual variance in environment 
                         (differences between days within a territory). We have assumed these have 
                         the same effect on phenotype. It is possible that this is not the case. 
                         If so, the method we have demonstrated here will not give accurate estimates of $V_",NOT$devI,"$.")
    
  ),

  # Step 1 --------------
  "Mod6Step1_txt" = list(
    "title" = "Step 1: Phenotypic correlations between two repeatedly expressed traits that are not different between individuals.",
    
    "goal" = "Now we consider within-individual correlation, and variance-covariance matrices more generally.",
    
    "intro" = paste0("<b>Background</b><br> As we have seen in the module <i>",Module_titles$mod1,"</i>, 
				 and as you will see in the module on <i>",Module_titles$mod6,"</i> later on, repeatedly expressed traits can vary both within and among individuals. 
  			 In this module, we introduce the notion of correlations at multiple levels. 
  			 We explain how correlations at each level influence the overall 
  			 phenotypic correlation, and how their influence is mediated by the amount of 
  			 variation occurring at each level. We will introduce these ideas one step at the time; 
  			 we will start with focussing on two repeatedly expressed traits that do not vary among individuals. 
  			 In other words, two traits that only include within-individual variation."),
    
    "para1" = paste0("As a worked example, we consider two traits that are correlated because of trade-offs. 
  				 For our example we will focus on egg size $",NOT$trait.1,"$ and clutch size $",NOT$trait.2,"$ (i.e., the number of eggs in a clutch). 
  				 Imagine a female of your favorite egg-laying species that has a set amount of resources available to her.
  				 She might produce few large eggs, so that her resources deplete faster with the number of eggs than for a female
  				 that produces many small eggs (i.e., a smaller versus a larger clutch size).
  				 The first situation translates to a negative correlation
  				 between egg size and clutch size, whereas in the second situation a positive correlation exists between egg size and clutch size. For convenience in the next steps, we represent our traits as:"),
    
    "exercise_eq1" = paste0("$$",NOT$trait.1,"_{",NOT$time,NOT$ind,"} = ",NOT$error,"_{",NOT$trait.1,NOT$time,NOT$ind,"},$$
  				  $$",NOT$trait.2,"_{",NOT$time,NOT$ind,"} = ",NOT$error,"_{",NOT$trait.2,NOT$time,NOT$ind,"},$$ i.e. here we assume the traits to be equal to the residual in a model."),
    
    
    "para2" = paste0('Because we expect these two traits to be correlated, we represent the properties of these two traits with the usual within-individual variances $V_{',NOT$error,"_",NOT$trait.1,"}$ and $V_{",NOT$error,"_",NOT$trait.2,"}$, and additionally with covariance $cov_{",NOT$error,"_",NOT$trait.1,",",NOT$error,"_",NOT$trait.2,'}$. These parameters form the elements of a 
    within-individual variance-covariance matrix. This matrix holds the variances of the two traits on the diagonals and their covariance on the off-diagonals:'),
    "para2_eq1" = paste0("$$ \\Omega_{",NOT$error,"}=	\\begin{pmatrix}	V_{",NOT$error,"_",NOT$trait.1,"} & cov_{",NOT$error,"_",NOT$trait.1,",",NOT$error,"_",NOT$trait.2,"} \\\\
		  	cov_{",NOT$error,"_",NOT$trait.1,",",NOT$error,"_",NOT$trait.2,"} & V_{", NOT$error,"_",NOT$trait.2,"} \\\\
		  	\\end{pmatrix} .$$"),
    
    "exercise" = paste0("<b>Exercise</b><br> The app below
                     allows you to experiment with different amounts of within-individual variation  ($V_{",NOT$error,"_",NOT$trait.1,"}$ and $V_{",NOT$error,"_",NOT$trait.2,"}$), with the magnitude and strength of the correlation between the traits,
                     and with the sign of the correlation (i.e., negative or positive correlation), so that you can explore the aforementioned scenarios."),
    
    "para3" = "We will generate multi-level data for two repeatedly expressed traits. 
  			 We will consider a scenario where the two traits are examined simultaneously for multiple individuals. 
  			 All individuals are examined (sampled) repeatedly, but always at the same time. For the moment, we assume our studies includes 10 individuals that we examine 10 times.",
    
    "para4" = paste0("Note that you did not enter the covariance of the traits $cov_{",NOT$error,"_",NOT$trait.1,",",NOT$error,"_",NOT$trait.2,"}$ in the app.
                    Later on in this module you will learn that  covariances are important for various calculations, which is why we introduced them here. 
                   However, correlation and covariance are related: if we standardized the covariance matrix so that the variances equal one (i.e. divide the columns of the matrix by the variances),
                   the off-diagonals express the correlation of the traits. This therefore results in a standardized metric that can be compared 
                   across samples that differ in their variances. The relationship between the within-individual correlation ($r_{",NOT$error,"_",NOT$trait.1,",",
  				 NOT$error,"_",NOT$trait.2,"}$) and covariance ($cov_{",NOT$error,"_",NOT$trait.1,",",
  				 NOT$error,"_",NOT$trait.2,"}$) is:"),
    "para4_eq1"  = paste0("$$r_{",NOT$error,"_",NOT$trait.1,",",NOT$error,"_",NOT$trait.2,"}=
             \\frac{cov_{",NOT$error,"_",NOT$trait.1,",",NOT$error,"_",NOT$trait.2,"}}
  				 {\\sqrt{V_{",NOT$error,"_",NOT$trait.1,"}","V_{",NOT$error,"_",NOT$trait.2,"}}}.$$"),
    
    "para5" = "The relationship between the two traits is negative for a negative correlation, and this relationship exists within individuals. 
  	That is, when a female increases egg size from one instance (e.g. year) to the next, 
  	she simultaneously decreases the size of her clutch. In other words, the changes in one trait across 
  	repeated expressions of the same individual are associated with changes in another trait.",
    
    "conclusion" = "Variance-covariance matrices hold information on the amount of variance 
  			 existing in each trait as well as the covariances between them. 
  			 The correlations between two traits are calculated using this information 
  			 on variances and covariances as derived metrics."
  ),
  
  # Step 2 --------------
  
  "Mod6Step2_txt" = list(
    "title" = "Step 2: Phenotypic correlations between two repeatedly expressed traits that also differ between individuals.",
    "goal" = "We continue to explore phenotypic correlations, but instead of  assuming correlation between traits of an individual, we now also consider correlation between individuals.",
    "intro" = paste0("<b>Background</b><br> In step one, we focussed on within-individual correlations caused by trade-offs 
								between two costly traits that were repeatedly expressed within the same individual. 
								We assumed for simplicity that both traits harboured no among-individual variance. 
								This meant that the individual repeatability was zero for both traits 
								(see module on <i>",Module_titles$mod1,"</i> for an introduction to repeatability). 
								We will now consider a more complex, and more realistic, scenario where these two traits (egg size and clutch size) 
								vary both within- and among-individuals, as is usually the case in real-world populations.
								The models for this step will be:"),
    "intro_eq1" = paste0("$$",NOT$trait.1,"_{",NOT$time,NOT$ind,"} = ",NOT$devI,"_{",NOT$trait.1,NOT$ind,"} + 
																											 ",NOT$error,"_{",NOT$trait.1,NOT$time,NOT$ind,"},$$
  				  $$",NOT$trait.2,"_{",NOT$time,NOT$ind,"} = ",NOT$devI,"_{",NOT$trait.2,NOT$ind,"} + 
					 																						 ",NOT$error,"_{",NOT$trait.2,NOT$time,NOT$ind,"}.$$"),
    "para1" = paste0("For example, female passerine birds often adjust their clutch size to changes in breeding 
						density while females also differ consistently in clutch sizes across repeated breeding attempts 
						(Nicolaus <i>et al.</i> 2013). Previously, because the traits did not harbour any among-individual variation, 
						all variation existed at the within-individual level. This meant that the phenotypic correlation 
						between the two traits was identical to the within-individual correlation. 
						We can see why this is the case by introducing an equation with components that affect 
						the phenotypic correlation $r_{",NOT$total,"_",NOT$trait.1,",",NOT$total,"_",NOT$trait.2,"}$
						(Dingemanse & Dochtermann 2013; Dingemanse <i>et al.</i> 2012):"),
    "para1_eq1" = paste0("$$r_{",NOT$total,"_",NOT$trait.1,",",NOT$total,"_",NOT$trait.2,"} =  r_{",NOT$devI,"_" ,NOT$trait.1,",",NOT$devI,"_" ,NOT$trait.2,
                         "}\\sqrt{\\biggl(\\frac{V_{",NOT$devI,"_" ,NOT$trait.1,"}}{V_{",NOT$devI,"_" ,NOT$trait.1,"} + V_{",NOT$error,"_" ,NOT$trait.1,"}}\\biggr)\\biggl(\\frac{V_{",NOT$devI,"_" ,
                         NOT$trait.2,"}}{V_{",NOT$devI,"_" ,NOT$trait.2,"} + V_{",NOT$error,"_" ,NOT$trait.2,"}}\\biggr)} + r_{",NOT$error,"_" ,NOT$trait.1,",",NOT$error,"_" ,NOT$trait.2,
                         "}\\sqrt{\\biggl(\\frac{V_{",NOT$error,"_" ,NOT$trait.1,"}}{V_{",NOT$devI,"_" ,NOT$trait.1,"} + V_{",NOT$error,"_" ,NOT$trait.1,"}}\\biggr)\\biggl(\\frac{V_{",NOT$error,"_" ,NOT$trait.2,
                         "}}{V_{",NOT$devI,"_" ,NOT$trait.2,"} + V_{",NOT$error,"_" ,NOT$trait.2,"}}\\biggr)}.$$"),
    "para2" = paste0("This equation demonstrates that the phenotypic correlation 
  				 ($r_{",NOT$total,"_",NOT$trait.1,",",NOT$total,"_",NOT$trait.2,"}$) 
  				 is affected by both the strength and direction of among-individual correlation ($r_{",NOT$devI,"_",NOT$trait.1,",",NOT$devI,"_",NOT$trait.2,"}$) 
  				 and the within-individual correlation ($r_{",NOT$error,"_",NOT$trait.1,",",NOT$error,"_",NOT$trait.2,"}$). 
  				 Note that the impact of the among-individual correlation on the phenotypic correlation is weighted 
  				 by:"),
    "para2_eq1" = paste0("$$\\sqrt{\\bigl(\\frac{V_{",NOT$devI,"_" ,NOT$trait.1,"}}{V_{",NOT$devI,"_" ,NOT$trait.1,
                         "} + V_{",NOT$error,"_" ,NOT$trait.1,"}}\\biggr)\\biggl(\\frac{V_{",NOT$devI,"_" ,NOT$trait.2,"}}{V_{",NOT$devI,"_" ,
                         NOT$trait.2,"} + V_{",NOT$error,"_" ,NOT$trait.2,"}}\\biggr)}.$$"),
    
    "para3" = paste0('This term is referred to as the "geometric mean repeatability". It represents the square root of the product 
								of the repeatability of trait $',NOT$trait.1,'$ i.e., $(\\frac{V_{',NOT$devI,'_' ,NOT$trait.1,'}}
								{V_{',NOT$devI,'_',NOT$trait.1,'} + V_{',NOT$error,'_',NOT$trait.1,'}})$ 
								and trait $',NOT$trait.2,'$ i.e., $(\\frac{V_{',NOT$devI,'_' ,NOT$trait.2,'}}
								{V_{',NOT$devI,'_',NOT$trait.2,'} + V_{',NOT$error,'_',NOT$trait.2,'}})$ .
  				 			The second term in the equation above i.e., $\\sqrt{
			           \\biggl(\\frac{V_{',NOT$error,'_',NOT$trait.1,'}}
			           {V_{',NOT$devI,'_',NOT$trait.1,'} + V_{',NOT$error,'_',NOT$trait.1,'}}\\biggr)
			           \\biggl(\\frac{V_{',NOT$error,'_',NOT$trait.2,'}}
			           {V_{',NOT$devI,'_',NOT$trait.2,'} + V_{',NOT$error,'_',NOT$trait.2,'}}\\biggr)}$
								represents one minus this geometric repeatability. For two traits that 
  							have high repeatability (such as sets of morphological traits), the phenotypic correlation 
  							will largely reflect the among-individual correlation, while for two traits that have 
  							a low repeatability (such as sets of behavioural traits), the phenotypic correlation will instead 
  							largely reflect the within-individual correlation (Dingemanse & Dochtermann 2013).'),
    "para4" = paste0("In the first step of this module we considered a situation where two 
  	repeatedly expressed traits (egg and clutch size) were potentially negatively correlated within-individuals, but did 
  	not have any among-individual variance. You set the within-individual variances for traits $y$ and $z$, as well as their 
  				 covariance, but you assumed that the among-individual variances 
  				 ($V_{",NOT$devI,"_",NOT$trait.1,"}$, $V_{",NOT$devI,"_",NOT$trait.2,"}$) were equal to zero. In that instance, the geometric mean repeatability (defined above) is equal to zero, 
                   while one minus this metric is equal to one, and therefore:"),
  	"para4_eq1" = paste0("$$r_{",NOT$total,"_",NOT$trait.1,",",NOT$total,"_",NOT$trait.2,"} = r_{",NOT$error,"_",NOT$trait.1,",",NOT$error,"_",NOT$trait.2,"}.$$"),
    
    "exercise" = paste0("<b>Exercise</b><br>","In the app below you now also introduce among-individual variance in both egg size 
  							(i.e., $V_{",NOT$devI,"_",NOT$trait.1,"}>0$) and clutch size (i.e., $V_{",NOT$devI,"_",NOT$trait.1,"}>0$). 
  							For simplicity we will assume that the average egg size for an individual, across repeated observations,
  							is not correlated with average clutch size, i.e., 
  							that the among-individual correlation is zero. As in the first step of this module, we assume that both the number of individuals, and the number of repeated measures per individual, is 10."),
    
    "para5" = "In the app you defined the values for the among-individual matrix:",
    "para5_eq1" = paste0("$$ \\Omega_{",NOT$devI,"}=\\begin{pmatrix}V_{",NOT$devI,"_",NOT$trait.1,"} & cov_{",NOT$devI,"_",NOT$trait.1,",",NOT$devI,"_",NOT$trait.2,
                         "}\\\\cov_{",NOT$devI,"_",NOT$trait.1,",",NOT$devI,"_",NOT$trait.2,"} & V_{", NOT$devI,"_",NOT$trait.2,"} \\\\\\end{pmatrix}.$$"),
    
    "para6" = paste0("As you set both the among- and within-individual variances, you consequently defined the repeatabilities of both traits. 
  	As detailed in the module on <i>",Module_titles$mod1,"</i>, repeatability ranges between zero and one and is calculated as:"),
    "para6_eq1" = paste0("$$Repeatability=\\frac{\\hat{V}_",NOT$devI,"}{\\hat{V}_",NOT$devI,"+\\hat{V}_",NOT$error,"}.$$"),
    
    "para7" = "We will now return to the equation that describes the components that shape the phenotypic correlation:",
  
    "para8" = paste0("Note that the phenotypic correlation ($r_{",NOT$total,"_",NOT$trait.1,",",NOT$total,"_",NOT$trait.2,"}$)
  				 no longer matches the within-individual correlation ($r_{",NOT$error,"_",NOT$trait.1,",",NOT$error,"_",NOT$trait.2,"}$). 
  				 This is because both traits now harbour non-zero repeatability; as we have set the among-individual correlation 
  				 ($r_{",NOT$devI,"_",NOT$trait.1,",",NOT$devI,"_",NOT$trait.2,"}$) to zero, in this specific scenario, 
  				 we can simplify the equation into:"),
    "para8_eq1" = paste0("$$r_{",NOT$total,"_",NOT$trait.1,",",NOT$total,"_",NOT$trait.2,"} = r_{",NOT$error,"_" ,NOT$trait.1,",",NOT$error,"_" ,NOT$trait.2,
                          "}\\sqrt{\\biggl(\\frac{V_{",NOT$error,"_" ,NOT$trait.1,"}}{V_{",NOT$devI,"_" ,NOT$trait.1,"} + V_{",NOT$error,"_" ,NOT$trait.1,"}}\\biggr)\\biggl(\\frac{V_{",NOT$error,"_" ,
                          NOT$trait.2,"}}{V_{",NOT$devI,"_" ,NOT$trait.2,"} + V_{",NOT$error,"_" ,NOT$trait.2,"}}\\biggr)}.$$"),
    
    "para9" = "Doing so clarifies that the geometric mean repeatability of the two traits defines how well 
  	the phenotypic correlation corresponds to the within-individual correlation, 
  	because of the presumed trade-off between investments in egg and clutch size. 
  	The equation also clarifies that the higher repeatability of two traits is, the less apparent a 
  	trade-off is if one would focus solely on the overall phenotypic correlation. This insight can be visualized by presenting your data in two scatter plots as in the aforementioned app. The first scatter plot shows the correlation between the two traits that your entries 
  	(of within- and among-individual variances and covariances) above produced. The second scatter plot also uses your entries but assumes that you entered zero among-individual variances. 
  	This second plot therefore depicts the correlation in your data at the within-individual level alone. The first graph should show a weaker overall phenotypic association as explained above." ,
    
    "conclusion" = "The phenotypic correlation reflects the within-individual correlation when 
  			 measured for repeatedly expressed traits; however, their correspondence is a function of how 
  			 repeatable the two traits are. You may explore this idea more fully by re-running the exercise 
  			 for different levels of trait repeatabilities."
  ),
  
  # Step 3 --------------
  "Mod6Step3_txt" = list(
    "title" = "Step 3: Level-specific correlations.",
    "goal" = "Adding another level of complexity, we here further study the role of level-specific correlations in shaping 
				 phenotypic correlations in repeatedly expressed traits.",
    
    "intro" = paste0("<b>Background</b><br> As a final step in our analysis of the within-individual 
								trade-off between egg and clutch size, we will introduce another level of complexity. 
								We will consider the idea that correlations often differ between hierarchical levels 
								because of multiple mechanisms shaping phenotypic correlations. We will continue our example where 
								individuals have to allocate limited resources into multiple costly traits, causing negative within-individual correlations due to trade-offs. We will now introduce the notion that there is a second 
								mechanism causing covariance, namely among-individual variation in the acquisition of resources. 
								This may lead to a situation where individuals with many resources are able to produce both large 
								eggs and large clutches whereas individuals with fewer resources produce small eggs 
								and small clutches instead. Variation in acquisition combined with allocation trade-offs 
								therefore will lead to level-specific associations (van Noordwijk & de Jong 1986). 
								In statistical terms, an individual its egg size will correlate positively with 
								its clutch size over all its expressions. Essentially, what we have now introduced 
								is a situation where the correlations between egg size and clutch size are opposite across hierarchical levels."),
    
    "exercise" = "<b>Exercise</b><br> 
    The following app allows you to explore the aforementioned scenairo, with within- and among-individual correlation, as well as within- and among-individual variation.
     Rhe repeatabily of both traits is started off at 0.5, so that
    the phenotypic correlation is affected equally by within- and among-individual correlation between the two traits.
    Within- and among-individual correlation are set to 0.5 and -0.5 respectively, so that the two terms contribute to the phenotypic correlation equally.
		Again, we have already set both the number of individuals, and the number of repeated measures per individual, to 10.",
    
    "results" = 'As in the first step of this module, you defined the elements of the within-individual variance-covariance matrix:',
    "results_eq1" = paste0("$$ \\Omega_{",NOT$error,"}=\\begin{pmatrix}V_{",NOT$error,"_",NOT$trait.1,"} & cov_{",NOT$error,"_",NOT$trait.1,",",NOT$error,
                           "_",NOT$trait.2,"}  \\\\cov_{",NOT$error,"_",NOT$trait.1,",",NOT$error,"_",NOT$trait.2,"} & V_{", NOT$error,"_",NOT$trait.2,"} \\\\\\end{pmatrix}.$$"),
    
    "para1" = "In addition, you now also defined the elements of the among-individual variance-covariance matrix:",
    "para1_eq1" = paste0("$$ \\Omega_{",NOT$devI,"}=\\begin{pmatrix}V_{",NOT$devI,"_",NOT$trait.1,"} & cov_{",NOT$devI,"_",NOT$trait.1,",",NOT$devI,"_",
                         NOT$trait.2,"}  \\\\cov_{",NOT$devI,"_",NOT$trait.1,",",NOT$devI,"_",NOT$trait.2,"} & V_{", NOT$devI,"_",NOT$trait.2,"} \\\\\\end{pmatrix}.$$"),
    
    "para2" = "We will now again return to the equation that describes the components which affect the phenotypic correlation:",
    "para2_eq1" = paste0("$$ r_{",NOT$total,"_",NOT$trait.1,",",NOT$total,"_",NOT$trait.2,"} = r_{",NOT$devI,"_" ,NOT$trait.1,",",NOT$devI,"_" ,NOT$trait.2,
                         "} \\sqrt{ (\\frac{V_{",NOT$devI,"_" ,NOT$trait.1,"}}{V_{",NOT$devI,"_" ,NOT$trait.1,"} + V_{",NOT$error,"_" ,NOT$trait.1,"}})(\\frac{V_{",
                         NOT$devI,"_" ,NOT$trait.2,"}}{V_{",NOT$devI,"_" ,NOT$trait.2,"} + V_{",NOT$error,"_" ,NOT$trait.2,"}})} + r_{",
                         NOT$error,"_" ,NOT$trait.1,",",NOT$error,"_" ,NOT$trait.2,"}\\sqrt{(\\frac{V_{",NOT$error,"_" ,NOT$trait.1,"}}{V_{",NOT$devI,"_" ,NOT$trait.1,
                         "} + V_{",NOT$error,"_" ,NOT$trait.1,"}})(\\frac{V_{",NOT$error,"_" ,NOT$trait.2,"}}{V_{",NOT$devI,"_" ,NOT$trait.2,"} + V_{",NOT$error,"_" ,NOT$trait.2,"}})} .$$"),
    
    "para3" = paste0("Note that if you entered values for the within-individual correlation 
		($r_{",NOT$error,"_",NOT$trait.1,",",NOT$error,"_",NOT$trait.2,"}$) versus the among-individual correlation 
		($r_{",NOT$devI,"_",NOT$trait.1,",",NOT$devI,"_",NOT$trait.2,"}$) that were not the same, the overall phenotypic correlation does not 
		accurately reflecting either. Only when the among- and individual-correlation have the same value and the same sign
		is the phenotypic correlation the same value. 
		Hopefully, you tried different strengths of within- and among-individual correlation to study how their relative magnitudes affect the phenotypic 
		correlation."),
		
		"para4" = "Another issue that you may have investigated is the role of repeatability in determining the phenotypic correlation. 
		For example, by selecting within- and among-individual correlations of equal strength but opposite sign 
		(e.g. -0.8 vs. 0.8), and for a range of different repeatabilities. This would allow you to test the affects
		of a single trait with high reproducibility and a second trait with low repeatability. 
		When both traits have high repeatabikity, the phenotypic correlation more
		closely reflects among-individual correlation. This is in contrast to a stuation where both traits have low repeatability. Then,
		the phenotypic correlation will more closely reflect within-individual correlation. 
		The patterns of correlation within versus among individuals are visualized in the bottom of the app, in the form of three types of scatter plots. 
		The first plot is one of the raw data, which represents the overall phenotypic association between the two traits. 
		The second plot visualizes each individual its mean value of the two traits. This is a visual representation of the among-individual correlation. 
		Lastly, for the third plot we visualize the deviation of each observation from an individual its mean value of each trait, which 
		represents a visual of the within-individual correlation.",
		
		"conclusion" = "Repeatedly expressed traits often vary across multiple levels, 
		such as within and among individuals. This means that the phenotypic correlation summarizes 
		the correlations existing at different levels. The influence of the correlation at each level on phenotypic correlation is weighted
		by the amount of variance at each level. In other words, the correlation between 
		two traits that have low repeatability (e.g., physiology or behaviour) will largely represent 
		within-individual correlation, whereas correlation between traits that have high repeatability 
		(e.g. morphology) will largely represent among-individual correlation. For this reason it is 
		important to partition the phenotypic correlation into its underlying components when one is 
		interested in patterns patterns of correlations, such as correlation within individuals 
		due to trade-offs."
  ),
  
  # Step 4 --------------
  "Mod6Step4_txt" = list(
    "title" = "Step 4: The Bivariate mixed-effects model.",
    "goal" = "Now that we have covered multiple traits, the next step is to nderstandg the difference between a univariate and a multivariate mixed-effects model,
     so that you can model level-specific correlations.",
    
    "intro" = paste0("<b>Background</b><br> In the previous modules (<i>",Module_titles$mod1,", ",Module_titles$mod3,", and ",
                     Module_titles$mod6,"</i>) we considered univariate mixed-effects models. As you have seen, 
								the univariate mixed-effects model enabled us to estimate the variance attributable to variation within- 
								and among-individuals in a single trait ($",NOT$trait.1,"$) with the following equation:"),
    "intro_eq1" = paste0("$$",NOT$trait.1,"_{",NOT$time,NOT$ind,"} = (",EQ3$mean0," + ",NOT$devI,"_",NOT$ind,") + ",NOT$error,"_{",NOT$time,NOT$ind,"}$$"),
    
    "para1" = paste0("Formally, even when we assume the individual intercepts $",NOT$devI,"_",NOT$ind," $among individuals to be independent (i.e., have zero covariance) with a mean of zero,
    and covariance matrix $\\Omega_{",NOT$devI,"}$, we can write this as:"),
    "para1_eq1" = paste0("$$",NOT$devI,"_",NOT$ind," \\sim MVN(0, \\Omega_{",NOT$devI,"}).$$"),
    
    "para2" = paste0("Then, the diagonals of this covariance matrix hold the among-individual variance
					 (denoted as $V_",NOT$devI,"$, the variance across random intercepts of individuals), but the covariance matrix is <i>diagonal</i>, i.e. has zero for the covariances. 
					 In univariate regression, we make the same assumption, namely that the residual error $",NOT$error,"_{",NOT$time,NOT$ind,"}$ follows a multivariate normal distribution, with zero mean 
								and a covariance matrix $\\Omega_{",NOT$error,"}$ where the off-diagonal entries are zero, and with diagonal entries equal to the <i>within-individual variance</i>, so that we can write:"),
    "para2_eq1"= paste0("$$",NOT$error,"_{",NOT$time,NOT$ind,"} \\sim MVN(0, \\Omega_{",NOT$error,"}).$$"),
    
    "para3" = paste0("However, what if you want the covariance matrix of the errors to include off-diagonal entries, instead of the covariance matrix of the random-effects? Then, you need to use a <i>bivariate</i> mixed-effects models. 
								We formulate the bivariate model as a set of two phenotypic equations, one for $",NOT$trait.1,"$ and one for $",NOT$trait.2,"$:"),
    "para3_eq1" = paste0("$$", NOT$trait.1,"_{",NOT$time,NOT$ind,"} = (",EQ$mean0.1," + ",EQ$dev0.1,") + ",NOT$error,"_{",NOT$trait.1,NOT$time,NOT$ind,"},$$ $$"
                         ,NOT$trait.2,"_{",NOT$time,NOT$ind,"} = (",EQ$mean0.2," + ",EQ$dev0.2,") + ",NOT$error,"_{",NOT$trait.2,NOT$time,NOT$ind,"}.$$"),
    
    "para4" = paste0("Now, in the bivariate case, we do not assume independence of neither the random 
					 intercepts nor the residual errors, while in the univariate mixed-effects model we did assume the errors to be independent.
					 Instead, here we assume the random intercepts to follow a multivariate normal distribution with a variance-covariance matrix 
					 $\\Omega_{",NOT$devI,"}$, which includes the among-individual variances $V_{",NOT$devI,"_",NOT$trait.1,"}$ and $V_{",NOT$devI,"_",NOT$trait.2,"}$, 
					 and the among-individual covariance between the two random intercept terms $cov_{",NOT$devI,"_",NOT$trait.1,",",NOT$devI,"_",NOT$trait.2,"}$: "),
    "para4_eq1" = paste0("$$ \\Omega_{",NOT$devI,"}=\\begin{pmatrix}V_{",NOT$devI,"_",NOT$trait.1,"} & cov_{",NOT$devI,"_",NOT$trait.1,",",NOT$devI,"_",
                         NOT$trait.2,"}\\\\cov_{",NOT$devI,"_",NOT$trait.1,",",NOT$devI,"_",NOT$trait.2,"} & V_{", NOT$devI,"_",NOT$trait.2,"}\\\\\\end{pmatrix}.$$"),
    
    "para5" = paste0("The errors $",NOT$error,"_{",NOT$time,NOT$ind,"}$ have within-individual variances $V_{",NOT$error,"_",NOT$trait.1,"}$ and $V_{",NOT$error,"_",NOT$trait.2,"}$, and within-individual 
		covariances $cov_{",NOT$error,"_{",NOT$trait.1,"},",NOT$error,"_{",NOT$trait.2,"}}$:"),
		"para5_eq1" = paste0("$$ \\Omega_{",NOT$error,"}=\\begin{pmatrix}V_{",NOT$error,"_",NOT$trait.1,"} & cov_{",NOT$error,"_",NOT$trait.1,",",NOT$error,"_",
		                     NOT$trait.2,"}  \\\\cov_{",NOT$error,"_",NOT$trait.1,",",NOT$error,"_",NOT$trait.2,"} & V_{", NOT$error,"_",NOT$trait.2,"} \\\\\\end{pmatrix}.$$"),
		
		"para6" = "From these covariance matrices we can calculate the phenotypic variances for each trait by adding up the variances estimated at each level:",
		"para6_eq1" = paste0("$$V_{",NOT$total,"_",NOT$trait.1,"} = V_{",NOT$devI,"_",NOT$trait.1,"} + V_{",NOT$error,"_",NOT$trait.1,"},$$
					  $$V_{",NOT$total,"_",NOT$trait.2,"} = V_{",NOT$devI,"_",NOT$trait.2,"} + V_{",NOT$error,"_",NOT$trait.2,"}.$$"),
		
		"para7" = "In the same fashion, we can calculate the phenotypic covariance between the 
		two traits by adding up the covariances estimated at each level:",
		"para7_eq1" = paste0("$$cov_{",NOT$total,"_",NOT$trait.1,", ",NOT$total,"_",NOT$trait.2,"} = cov_{",NOT$devI,"_",NOT$trait.1,",",NOT$devI,"_",NOT$trait.2,
		                     "} +  cov_{",NOT$error,"_",NOT$trait.1,",",NOT$error,"_",NOT$trait.2,"}.$$"),
		
		"para8" = "With this information in hand, we can now calculate the overall phenotypic correlation in the data:",
		"para8_eq1" = paste0("$$r_{",NOT$total,"_",NOT$trait.1,", ",NOT$total,"_",NOT$trait.2,"} = 
					 \\frac{cov_{",NOT$total,"_",NOT$trait.1,",",NOT$total,"_",NOT$trait.2,"}}
					 {\\sqrt{V_{",NOT$total,"_",NOT$trait.1,"}V_{",NOT$total,"_",NOT$trait.2,"}}}.$$"),
		
		"conclusion" = "Bivariate mixed-effects models differ distinctly from univariate mixed-effects 
		models as the former assumes multivariate normality of the errors, while the latter assumes univariate normality of the errors. 
		Bivariate mixed-effects models estimate variances and covariances within and among each specified 
		level from which overall phenotypic variances and covariances, and consequently correlation, 
		can be derived."
  ),
  
  # Step 5 -------------- 
  "Mod6Step5_txt" = list(
    "title" = "Step 5: Environmentally-induced correlations.",
    "goal" = "In this step we introduce integration of plasticity as a mechanism causing correlations.",
    
    "intro" = paste0("<b>Background</b><br> In the previous steps we considered a bivariate phenotypic 
								equation where two traits correlated among- and/or within-individuals without considering 
								plasticity as a mechanism causing this variation. This is why the double equation included no fixed-effects, apart from the intercepts:"),
    "intro_eq1" = paste0("$$", NOT$trait.1,"_{",NOT$time,NOT$ind,"} = (",EQ$mean0.1," + ",EQ$dev0.1,") + ",NOT$error,"_{",NOT$trait.1,NOT$time,NOT$ind,"},$$,$$",
                         NOT$trait.2,"_{",NOT$time,NOT$ind,"} = (",EQ$mean0.2," + ",EQ$dev0.2,") + ",NOT$error,"_{",NOT$trait.2,NOT$time,NOT$ind,"}.$$"),
    
    "para1"  = paste0('In the final step of this module, we investigate the role of within-individual plasticity in generating correlations 
					 among repeatedly expressed traits. Returning to our example of egg size and clutch size, 
					 imagine that individuals breed repeatedly across years, sometimes having "good" 
					 and sometimes having "bad" years. We then expect females to plastically adjust both their egg 
					 size and their clutch size to food availability. For example, so that eggs are smaller in years with little food. 
					 We represent this scenario as a statistical model that includes food availability
					 ($',NOT$env,'_{',NOT$time,NOT$ind,'}$) as a fixed-effect, affecting both egg size $',EQ$mean1.1,NOT$env,'_{',NOT$time,NOT$ind,'}$ and clutch size $',EQ$mean1.2,NOT$env,'_{',NOT$time,NOT$ind,'}$:'),
    "para1_eq1" = paste0("$$", NOT$trait.1,"_{",NOT$time,NOT$ind,"} = (",EQ$mean0.1," + ",EQ$dev0.1,") + ",EQ$mean1.1,NOT$env,"_{",NOT$time,NOT$ind,"} + ",
                         NOT$error,"_{",NOT$trait.1,NOT$time,NOT$ind,"},$$ $$", NOT$trait.2,"_{",NOT$time,NOT$ind,"} = (",EQ$mean0.2," + ",EQ$dev0.2,") + ",EQ$mean1.2,NOT$env,"_{",
                         NOT$time,NOT$ind,"} + ",NOT$error,"_{",NOT$trait.2,NOT$time,NOT$ind,"}.$$"),
    
    "para2" = "To keep matters simple, we will assume in this example that the two traits are independent within- and among-individuals
    due to other mechanisms than variation in food availability. 
		At the same time, we assume that both traits harbour both among- and within-individual variation. ",
		
		"exercise" = "<b>Exercise</b><br> The following app will facilitate you in generating datasets for 100 individuals, each sampled 10 times . 
				 You have the possibility to determine the within- and among-individual variances for the two traits. You will also have the possibility to determine
				 the within- and among-individual correlations, as before. we additionally assume that the environment 
				 changes stochastically between the 10 sampling times, and that the average phenotype in the population has a value of zero.",
		
		"para3" = "In the app, you used the following bivariate phenotypic equation:",
		"para3_eq1" = paste0("$$",NOT$trait.1,"_{",NOT$time,NOT$ind,"} = (",EQ$mean0.1," + ",EQ$dev0.1,") + ",EQ$mean1.1,NOT$env,"_{",NOT$time,NOT$ind,"} +",NOT$error,
		                     "_{",NOT$trait.1,NOT$time,NOT$ind,"},$$ $$", NOT$trait.2,"_{",NOT$time,NOT$ind,"} = (",EQ$mean0.2," + ",EQ$dev0.2,") + ",EQ$mean1.2,NOT$env,"_{",NOT$time,NOT$ind,
		                     "} + ",NOT$error,"_{",NOT$trait.2,NOT$time,NOT$ind,"}.$$"),
		
		"para4" = "As we have seen in previous steps, it is possible to visualize the patterns at the 
		overall phenotypic level, within individuals, and among individuals (see the bottom of the app). A plot of the mean value for each of the two traits per individual
		represents a visual of the among-individual correlation, whereas the deviation of observations from an individual its mean value for 
		each of the two traits represents a visual of the within-individual correlation. If you chose within- and among-individual correlation equal to zero, in combination with non-zero 
		slopes for the fixed-effects of both traits, you will clearly be able to discern within-individual correlation from this plot. 
		The correlation emerges at this level because the simulation produces a situation 
		where all individuals were sampled equally often, and at the same time 
		(i.e., there was no variation in the timing of sampling). This means that the environment 
		(food availability) varied within but not among individuals, and therefore induced correlations 
		between egg size and clutch size within but not among individuals. Finally, we fit a bivariate mixed-effects model to data, with the 
		following phenotypic equation:",
		"para4_eq1" = paste0("$$",NOT$trait.1,"_{",NOT$time,NOT$ind,"} = (",EQ$mean0.1," + ",EQ$dev0.1,") + ",NOT$error,"_{",NOT$trait.1,NOT$time,NOT$ind,
		                     "}.$$ $$", NOT$trait.2,"_{",NOT$time,NOT$ind,"} = (",EQ$mean0.2," + ",EQ$dev0.2,") + ",NOT$error,"_{",NOT$trait.2,NOT$time,NOT$ind,"}.$$"),
		
		"para5"  = "Note, that the model excluded the effect of food availability. 
		Given our ecological process, where food availability affected both traits but only 
		varied within individuals, the residual within-individual correlation will 
		thus be nonzero even if you modelled it to be zero. We will fit another bivariate mixed-effects model to these data, wherewe account for 
		the effect of food availability on egg size and number:",
		"para5_eq1" = paste0("$$", NOT$trait.1,"_{",NOT$time,NOT$ind,"} = (",EQ$mean0.1," + ",EQ$dev0.1,") + ",EQ$mean1.1,NOT$env,"_{",NOT$time,NOT$ind,"} +",
		                     NOT$error,"_{",NOT$trait.1,NOT$time,NOT$ind,"}$$ $$", NOT$trait.2,"_{",NOT$time,NOT$ind,"} = (",EQ$mean0.2," + ",EQ$dev0.2,") + ",EQ$mean1.2,NOT$env,
		                     "_{",NOT$time,NOT$ind,"} + ",NOT$error,"_{",NOT$trait.2,NOT$time,NOT$ind,"}$$"),
		
		"para6" = paste0("This new model should properly recover the effect of food availability on $y$ and $z$. 
					 You will notice that the residual within-individual covariance ($cov_{",NOT$error,"_",NOT$trait.1,",",NOT$error,"_",NOT$trait.2,"}$) 
					 should now also better resemble the estimate that you would have expected based on 
					 the within-individual correlation that you entered previously. This is because 
					 the within-individual covariance is now explained by the fixed-effect covariate, 
					 and therefore food availability no longer contributes to the residual within-individual variances."),
		
		"conclusion" = "<b>Conclusion</b><br> Integration of plasticity, where the same environmental predictor affects multiple phenotypic traits, 
		leads to patterns of trait correlations in phenotypic data. Provided that such environmental predictors 
		varied solely within individuals, environmental variation would cause residual within-individual correlations 
		if not accounted for. Though not further articulated here, we can imagine that such types of environmental 
		effects could also cause among-individual correlations in situations where the sampling design was such 
		that it resulted in among-individual variation in the timing of sampling. In such situations, among- 
		and within-individual correlations would occur in the presence of integration of plasticity, provided 
		that its effects were not modelled in the fixed-effects structure of the statistical model. 
		We will explore this issue and others in another module."
  ),
  
  
  
  
  # Step 1 -------------- 
  "Mod4Step1_txt" = list(
    "title" = "Step 1: Population level MDPP",
    "goal" = "In this step, we cover average (population-level) effects of multiple environmental predictors on the phenotype.",
    "intro" = paste0("<b>Background</b><br> In the <i>",Module_titles$mod3,"</i> module, we accounted for the effect of a single environmental 
                     predictor on phenotype. This process ended up describing the organism's phenotype
      			 as a line that is constructed with the environment (the environment on the X-axis, phenotype on the Y-axis).
      		 	 For example, parent birds typically increase the rate of food delivery to the nest as their offspring grow older.
      			 We call this line a reaction norm, and in the case of parent birds, it makes adaptive sense because older
      			 offspring are bigger and need a faster food intake to maintain growth. A simple reaction norm line for a single environmental predictor is a simplified scenario,
      	because we know organisms exist in environments that have multiple environmental predictors
      	(i.e., the environment is a multidimensional space). There is increasing evidence that multiple predictors
      	can influence many phenotypes. In the case of parent birds increasing food delivery to
      	older offspring, maintaining the rate of increase with age over all environmental conditions
      	makes little sense. If, for example, brood size varies among nesting attempts,
      	we might expect parents to respond to both nestling age and brood size.
      	For parent birds, the environment now has two dimensions, nestling age and brood size,
      	and instead of a reaction norm line, their behavioural response could be described by a
      	plane in this three-dimensional space (the third dimension is the phenotype). This is what we call 'multidimensional phenotypic plasticity'
      	abbreviated as MDPP. In theory, an organism could be responding to many environmental predictors,
      	so they would have a reaction norm hyperplane existing in n-dimensional environmental space.
      	It is hard for us to visualize more than three dimensions (imagine a fourth dimension as represented using e.g., the color in a figure, or as change through time), 
      	so here we will focus on the behaviour of a reaction norm plane with just two environmental axes, but if you get comfortable with this concept,
      	it will become easier to imagine three, or even more, environmental predictors. Our general goal is to help you
      	gain some understanding of how specific parameter values in the phenotypic equation influence
      	shape and orientation of a reaction norm plane. When there are multiple sources of environmental variance $V_",NOT$envEffect,"$ that affect a single trait, 
  							expressed multiple times within individuals but measured within a single population, we instead use <i>multiple</i> regression to simultaneously
  							relate those predictors to the trait. This is in contrast to the <i>simple</i> linear regression that we have applied so far, 
  							as now we include a slope parameter for each of the predictors.
  							This step illustrates some of the differences between simple and multiple regression, in addition to
  							the simulation of more complex data structures, such as when there is correlation between environments."),
    
      "para1" = "When we assumed that there was only one environmental effect, we used the following model:",
  "para1_eq1" = paste0("$$", NOT$trait.1,"_{",NOT$time,NOT$ind,"} = ",EQ1$mean0," + ",EQ1$dev0,"  +	",EQ1$mean1,NOT$env,"_{1",NOT$time,NOT$ind,"} + ",
                         NOT$error,"_{",NOT$time,NOT$ind,"},$$"),
   
    "para2" = paste0("Now, we instead add a second effect, so that our model becomes:",
                     "$$", NOT$trait.1,"_{",NOT$time,NOT$ind,"} = ",EQ1$mean0," + ",EQ1$dev0,"  + ",EQ1$mean1,NOT$env,"_{1",NOT$time,NOT$ind,"} + ",
                     EQ1$mean2,NOT$env,"_{2",NOT$time,NOT$ind,"} + ",NOT$error,"_{",NOT$time,NOT$ind,"},$$", 
                     "though we could add as many predictors as our sample size allows. In this equation, there are thus three <i>dimensions</i>, namely:
                     1) the response variable, 2) the first predictor and 3) the second predictor. Each environmental predictor contributes 
		the value $",NOT$mean,"^2V_{",NOT$env,"}$ to the total phenotypic variance (see Table 1 in Allegue <i>et al.</i> 2016), 
		so the slope, whether it is negative or positive, will affect the total phenotypic variance.
		Remember that in SQuID each environmental effect is standardized (i.e. mean = 0 and variance = 1), so that the calulation for the total phenotypic variation
		is straightforward."),
	
  "exercise" = paste0("<b>Exercise</b><br> In the app below we simulate phenotypes that are influenced by two environmental predictors, 
                      both of which have the same effect on the whole population (e.g., think of spring temperature), 
                      but the values are different from one measurement period to the next. 
                      In the app, you are thus able to explore a model that includes multiple sources of $V_",NOT$envEffect,"$. However, the app also fits a model with only
                      one environmental predictor (left-hand side table and plot), so that you can study what happens to the other components in the model when a predictor is erroneously omitted."),
  
		
  "para3" = paste0("This makes the simple point, also made in Module <i>",Module_titles$mod3,"</i>,
		that leaving out an important predictor inflates other variance components. In this case
		it was mostly the residual variance because the environment was set as random from one
		measurement to the next and all individuals experienced it."),

  "para4" = paste0("Individuals in this simulation vary in their intercept by the amount you entered previously in $V_{",NOT$devI,"}$.
		Below we pick three individuals across the range of the intercept variance to illustrate
		how each individual's plane sits in the space defined by the two environmental predictors.
		You can see that the three planes are parallel or very close to parallel, and differ only
		in their elevation. If you play around with the number of measures within an individual,
		you will see that the resolution of these planes requires fairly large sample sizes
		(this is covered in more detail later)."),

  "para5" = paste0("Run through this simulation several times using different values for $",EQ1$mean1,"$ and $",EQ1$mean2,"$,
					 including having some slopes negative. In particular, try making the two have opposite signs.
					 Inspect the table above and look at the two graphs so you gain a feel for how the two slopes
					 produce a flat plane that may be tilted in various ways."),
  
  "conclusion" = "To conclude, in this step we introducued the idea of multidimensional phenotypic plasticity,
  i.e., that the expression of a phenotype can be affected by more than one predictor, and that we can model that process in a regression.
  This then allows us to partition the phenotypic variance based on the different predictors, so that we may get a better understanding of what
  drives phenotypic variation. In the next step, we will focus on situations where the effect of one predictor on the phenotype is affected by another."
  
  ),
  
  # Step 2 -------------- 
  "Mod4Step2_txt" = list(
    
    "title" = "Step 2: Interaction terms",
    "goal" = "We continue studying multidimensional plasticity, by learning how to account for dependencies in the effect of one predictor by another predictor, also known as 'interactions' in a regression.",
    
    "intro" = "<b>Background</b><br> In the first step of this module we introduced the idea that two or more environments 
					might both affect the expression of a phenotype. An ecological example of this is the rate at which parents feed their offspring,
					which we can hypothesize to to be affected by both offspring age and by the number of offspring. 
          In a regression, we thus include both predictors and study their relationship to feeding rate.      
          However, as offspring gets older it requires larger meals, so if there are a lot of older offspring parents might feed less often but provide
          larger meals, while parents might feed more frequently smaller meals when the offspring is younger.
          Differently put, we might expect the response to one environmental 
					predictor to be plastic in the face of other environmental predictors. This plasticity in response 
					to one environment of a reaction norm to another (i.e., plasticity of plasticity) is a fascinating 
					potential consequence of multidimensional environments.", 
          
    "para1" = "In the first step you explored the effect of two environmental predictors that produce a flat plane. 
  The second equation in the first step of this module illustrated these as additive effects of the two environmental 
  predictors. Put another way, the effects of the predictors were treated as separately affecting the phenotype.
  However, the plasticity of plasticity as described above statistically results from <i>interactions</i> between predictors. In a mixed-effects model, or any regression-based analysis (e.g., GLM)
  a multiplication of two predictors in the model is referred to as an interaction term, and this term gets its own parameter. Interactions of environmental predictors can have fascinating ecological implications.",

  "para2" = "The statistical model with interaction of the predictors is:",
  "para2_eq1" = paste0("$$", NOT$trait.1,"_{",NOT$time,NOT$ind,"} = ",EQ1$mean0," + ",EQ1$dev0,"  + ",EQ1$mean1,NOT$env,"_{1",NOT$time,NOT$ind,"} + ",
                       EQ1$mean2,NOT$env,"_{2",NOT$time,NOT$ind,"} + ",EQ1$mean12,NOT$env,"_{1",NOT$time,NOT$ind,"}",NOT$env,"_{2",
                       NOT$time,NOT$ind,"} + ",NOT$error,"_{",NOT$time,NOT$ind,"}.$$"),

  "exercise" = paste0("<b>Exercise</b><br> 
                      The following app will allow you to explore models with an interaction term. As in the first step of this module, we start by simulating a population, which we 'collect' data from. 
  This simulation follows the model with interaction term, but fits two models: one without interaction and one with interaction,
  so that you can study the consequences of omitting interaction terms. Specifically, by manipulating both the magnitude of the interaction between $",NOT$env,"_1$ and $",NOT$env,"_2$
    ($",EQ1$mean12,"$), and the direction relative to the other slopes, you are able to assess how this affects the
  results when the interaction is ommitted from the model.", "The regression plane for the model with interaction is shown in a 3D-plot in the app, to give you a better impression of the interaction effect. 
  The figure additionally allows you to examine in more detail how the parameter $",EQ1$mean12,"$ affects the warping of the plane."),
  
  "para3" = "Variance due to the interaction term, when that term is omitted,
  	ends up mostly in the residuals (i.e., it makes for lack of fit), which also affects the parameter estimates for the other terms. 
  Hopefully, you noticed that the plane produced from the model with interaction looks different from the ones that the app in the first step
  				 produced. Those planes were flat but tilted in various ways, but here when $",EQ1$mean12,"$ is not zero,
  				 the plane in the app looks warped or bent, which represents the effect of the interaction term.",
  
  "conclusion" = "<b>Conclusion</b><br> Multidimensionality of environmental effects in phenotypic attributes is biologically very likely.
  			 It may seem redundant to keep demonstrating that leaving out an important term causes that variance to
  			 end up in other terms, but it is a vital concept to statistical modeling. Fitting an incorrect model will cause lack-of-fit, which is
  reflected in the residuals as excess variance, or when visualized, as patterns.
        The unusual element of interactions is that the direction of the slope compared
  			 to the main effects matters, not just the magnitude of the parameter. Interaction terms form from an array of interesting biological
  			 questions about both the way organisms integrate information about environment and the selective forces
  			 shaping the reaction norm plane."
  ),
  
  # Step 1 --------------
  "Mod3Step1_txt" = list(
    
    "title"      = "Step 1: Introduction to random slopes",
    "goal"    = " In this module, our goal is to explore situations where individuals may not only differ 
                    in their intercepts but also in the slope of their reaction to changes 
                    in a given environmental predictor. Random slope regression is a great 
                    tool to analyse among-individual differences in phenotypic plasticity. In this step, our goal is to develop understanding of hierarchies in variance when individuals 
                  express their traits as a response to a changing environmental predictor, 
                  but do so differently. In other words, 
                  individuals have variable reaction norms in both intercept and slope.",
    
    "intro"      = paste0("<b>Background</b><br> In the modules titled <i>",Module_titles$mod1,"</i> and <i>",Module_titles$mod3,"</i> 
                        you have explored how among-individual variance  $V_",NOT$devI,"$ can be modelled. Then, individuals varied to some extent
                        in how an environmental predictor influenced the expression of their phenotypes, 
                        producing within-individual variance as a response 
                        to environmental fluctuations $V_{",NOT$mean,"}$. So far, 
                        we have assumed that if the environment changes, individuals change their phenotype 
                        in exactly the same way. This is a dubious assumption at best, since in most biological scenarios
                        individuals vary in how the environment affects their phenotype. For example, individuals may differ 
                        in how they cope with a stressful situation; less tolerant individuals will alter their 
                        activity to a greater degree in the presence of a stress predictor (e.g. high temperature, 
                        presence of a predator, or shortage of food) than stress-tolerant conspecifics. In general, 
                        among-individual differences in plasticity (also called individual by-environment-interaction; $I\\times E$) 
                        are necessary if adaptive plasticity is to be under selection, and to the extent that differences have 
                        a genetic basis ($G\\times E$), such interactions are necessary for the evolution of plasticity. 
                        Studies of $I\\times E$ in natural populations remain relatively rare. 
                        Here we introduce random-slope regression, in which the assumption about a common within-individual 
                        variance (and plasticity) is relaxed and we explicitly estimate among-individual variance in the slope parameter."),
    "para1"= paste0("Here we depart from the random-intercept regression model as presented in step four of the module 
                       <i>",Module_titles$mod1,"</i>. Recall, our model was:"),
    "para1_eq1" = paste0("$$",NOT$trait.1,"_{",NOT$time, NOT$ind,"}= ",EQ3$mean0,"+",NOT$devI,"_",NOT$ind,"+ ",NOT$mean," ",NOT$env,"_{",NOT$time, NOT$ind,
                            "}+",NOT$error,"_{",NOT$time, NOT$ind,"}.$$"),
    "exercise"  = "<b>Exercise</b><br> We now change our model by additionally introducing a parameter that allows defining individual 
                       deviations from the population response to environmental changes. 
                       The fundamental difference between the random-intercept regression and the random-slope model that is presented hehre, 
                       is that while the former uses individual-level random effects to model 
                       individual-specific intercepts (that account for the among-individual variance of mean 
                       trait values), the latter introduces an additional random effect the slopes 
                       (that accounts for individual responses to changing environments). Our model thus becomes:",

    "RCode1"    = "# install.packages(&quot;lme4&quot;)<br>
                 LMM1 <- lme4::lmer(Phenotype ~ 1 + X1 + (1|Individual), data = sampled_data)",
    
    "exercise_eq1" = paste0("$$",NOT$trait.1,"_{",NOT$time, NOT$ind,"}=",NOT$devI,"_",NOT$ind,"+(",
                         NOT$mean,"+", NOT$devS,"_", NOT$ind,")", NOT$env,"_{",NOT$time, NOT$ind,"}+",NOT$error,"_{",NOT$time, NOT$ind,"},$$"),
    
    "RCode2"    = "LMM2 <- lme4::lmer(Phenotype ~ 1 + X1 + (1|Individual) + (0 + X1|Individual), data = sampled_data)",
    
    "para2"    = paste0("in which $",NOT$devS,"_",NOT$ind,"$ is the effect of measured environment 
                $",NOT$env,"_{",NOT$time, NOT$ind,"}$
                on the measure of phenotype in the <i>i <sup>th</sup></i> individual. In the following app, you are able to set the
                number of individuals and trait expressions, the among-individual variance of the random-intercept $V_{",NOT$devI,"}$, the variance of the residuals $V_{",NOT$residualUpper,"}$, the variance due to the population mean effect $V_{",NOT$mean,"}$, 
                and the among-individual variance $V_{",NOT$devS,"}$ in the environment due to the predictor $x$, to explore the effects of parameter estimation in a linear mixed-effects model. Note, here you can consider residual variance as solely measurement error variance, 
                or you could consider that it might also include some unknown environmental 
                variance in addition to the known environmental variance determined below."),
    "para3"    = "Set in the background is the environmental predictor and its sampling. 
                Here we should use uniform sampling, where each individual is sampled 
                at the same time so there are no biases. By design, 
                the environmental predictor is mean centered.",
    
    "para4"    = "In the app, individual-specific responses are visualised by plotting 
                the regression line for each individual, where the y-axis represents the phenotype and the x-axis the environment. This allows
    to clearly distinguish the differences in the phenotype for individuals as a function of the environment, and the variance therein. Below follows a chunk of \\texttt{R}-code to fit this model.",
    
    "conclusion"   = "Individual-specific responses to changes that occur along an environmental 
                gradient form &ldquo;reaction norms&rdquo;. These reaction norms (if the predictor $x$ is centered around zero) can be characterized by their intercept that 
                describes individual mean expression values, and by their slope that expresses 
                the plasticity of traits within individuals. Statistically, one can evaluate whether 
                the random-intercept or the random-slope model fits the data at hand better using, e.g., information criteria (though we do not discuss those here). 
                However, the consideration of differences in how individuals respond to environmental 
                fluctuations may be straightforward on a biological basis. This model simultaneously 
                accommodates tests for individual personality differences (i.e. the calculation of 
                repeatability makes sense) as well as tests for individual by environment interaction. Then, given independence of the model terms, 
    we can calculate the phenotypic variation as:",
    
    "conclusion_eq1" = paste0("$$V_",NOT$total,"= V_",NOT$devI,"+ V_{",NOT$mean,"}+V_{",NOT$devS,"}+ V_",NOT$residualUpper,",$$"),
    "conclusion2" = paste0("where $$V_{",NOT$mean,"}=",NOT$mean,"^V_{",NOT$env,"}=",NOT$mean,"^2,$$","and where", "$$V_{",NOT$devS,"}=V_{",NOT$devS,"}V_{",NOT$env,
                     "}+E(",NOT$env,")^2V_{",NOT$devS,"}=V_{",NOT$devS,"}.$$ Note that $V_{",NOT$env,"}$ is the true variance in $",NOT$env,"$, and $E(",
                     NOT$env,")$ is the true mean of $",NOT$env,"$. In SQuID each environmental predictor $(",NOT$env,")$ is standardized (i.e., $V_{",
                     NOT$env,"}=1$ and $E(",NOT$env,")=0$), to make calculating the explained variation more straightforward."),
    
    "RCode"    = "# install.packages(&quot;lme4&quot;)<br>
               LMM <- lme4::lmer(Phenotype ~ 1 + X1 + (1|Individual) + (0 + X1|Individual), data = sampled_data)"
  ),
  
  # Step 2 --------------
  "Mod3Step2_txt" = list(    
    "title"      = "Step 2: Intercept-slope correlation",
    "goal"    = "In this second step, our goal is to introduce and understand correlation between intercepts and slopes.",
    "intro"      = "<b>Background</b><br> Up until this point, we have been making the 
                  assumption that each term in our model is independent of other terms. 
                  In other words, we have for example assumed that the measurement error is not correlated with 
                  the intercept or with responses to the environment. For the most part, we will continue with our prior assumptions, 
                  but the introduction of random slopes means we now have two variances, one for the intercepts and one for the slopes, 
                  that are part of phenotypic variance and attributes of individuals. Biologically, 
                  it becomes very interesting if there is a correlation between intercepts and slopes. 
                  That correlation can be either positive or negative, which deermines the pattern of variance within and among individuals.",
    
    "para1"      = "We use the same model as before:",
    "para1_eq1" = paste0("$$",NOT$trait.1,"_{",NOT$time, NOT$ind,"}=",EQ3$mean0,"+",NOT$devI,"_",NOT$ind,"+ (",NOT$mean,"+", NOT$devS,"_", NOT$ind,")", NOT$env,"_{",
                         NOT$time, NOT$ind,"}+",NOT$error,"_{",NOT$time, NOT$ind,"},$$"),
    
    "para2"      = "but additionally introduce new nomenclature:",
    "para2_eq1" = paste0("$$ \\begin{pmatrix}", NOT$devI,"_",NOT$ind , "\\\\", NOT$devS,"_",NOT$ind , "\\\\ \\end{pmatrix}\\sim MNV(0,\\Omega_{",NOT$devI, NOT$devS,
                         "}), \\qquad \\text{where} \\qquad \\Omega_{",NOT$devI, NOT$devS,"}= \\begin{pmatrix}V_{", NOT$devI,"} & cov_{", NOT$devI, ",", NOT$devS ,"} \\\\cov_{", NOT$devI, ",", 
                         NOT$devS ,"} & V_{", NOT$devS, "}\\\\\\end{pmatrix}. $$"),
    
    "para3"      = paste0("This represents that the intercept value of the <i>i <sup>th</sup></i> individual $(",NOT$devI,"_",NOT$ind,")$ 
                        and the slope of that same individual $(",NOT$devS,"_",NOT$ind,")$ are distributed as multivariate 
                        normal with means of 0 and a variance-covariance matrix $\\Omega_{",NOT$devI,NOT$devS,"}$. 
                        Here, as there are two terms, this is a 2-by-2 matrix. 
                        The variance terms $V_",NOT$devI,"$ and $V_",NOT$devS,"$ have also occured in other modules, 
                        so that the new term introduced here is $cov_{",NOT$devI,",", NOT$devS,"}$, which represents the magnitude to which
                        the intercepts $",NOT$devI,"_",NOT$ind,"$ and slopes $",NOT$devS,"_",NOT$ind,"$ vary together."),
    
    "exercise"   = "<b>Exercise</b><br> The simulation here will be similar to that the first step of this module, 
                  but it will instead also be possible to input a value for the covariance of the intercepts and the slopes. 
                  Though this represents this also represents covariance between the intercepts and slopes: 
    which is a form of standardized covariance:",
    "exercise_eq1" = paste0("$$cor(",NOT$devI,",",NOT$devS,")=\\frac{cov_{",NOT$devI,",",NOT$devS,"}}{\\sqrt{V_{",NOT$devI,"}","V_{",NOT$devS,"}}}.$$"),
    
    "para4"      = "You might want to simulate data with a negative correlation,with a positive correlation, and without any correlation at all,
   to find out how that affects the patterns of variance. In the app below, the left panel in the plot will constantly reflect the simulated individuals without
   covarince between the intercept and slope terms, whereas the panel on the right incorporates the selected covariance.
   The patterns of variance can be inspected visually by plotting the simulated data.",
    
    "para5"      = paste0("Earlier we presented the phenotypic variance due to a particular term 
                        (e.g., the variance due to individual differences in response to an environmental 
                        predictor, or $V_{",NOT$devS,NOT$env,"}$), but now the table included what many statistical packages produce;
                        the (marginal) variance in slopes $V_",NOT$devS,"$, rather than the phenotypic variance due to slope (i.e., variance explained)."),
    
    "point"      = "Intercept-slope covariance is an additional layer of complexity
                  to the phenotypic equation. You will notoce that it 
                  is not a parameter in the equation itself, but is rather describing 
                  the relationship between two parameters in the equation, namely
                  how they behave across individuals. The covariance does normally appear in a partitioning of variance:",
    "point_eq1" = paste0("$$V_",NOT$total,"=V_",NOT$devI,"+ V_{",NOT$mean,"}+ V_{",NOT$devS,"}+ 2cov_{",NOT$devI,",",NOT$devS,"}+ V_",NOT$residualUpper,".$$"),
    
    "note2"      = paste0("Note: In SQuID $E(",NOT$env,")=0$ and hence the covariance does not contribute to total phenotypic variance."),
    "conclusion"      = "<b>Conclusion</b><br>The biology of the covariance is just beginning to be explored 
                  (e.g., <a href='http://onlinelibrary.wiley.com/doi/10.1111/j.1461-0248.2011.01698.x/abstract' target='_blank'>Mathot et al. 2011</a>).
                  Undoubtedly further understanding of it will contribute to understanding 
                  the evolution of plasticity, since the covariance links variation 
                  in plasticity with variation in mean trait values, 
                  and therefore could affect evolution in unexpected ways.",
    "RCode"      = "# install.packages(&quot;lme4&quot;)<br>
                 LMM <- lme4::lmer(Phenotype ~ 1 + X1 + (X1|Individual), data = sampled_data)"
  ),
  
  # Step 3 --------------
  "Mod3Step3_txt" = list(  
    "title"      = "Step 3: Sample size and precision",
    "goal"    = paste0("In this step, we conclude this module by developing an understanding of how the level of replication 
                        in terms of the number of individuals and samples per individual 
                        influence the estimation of the among-individual variance in intercepts $V_",NOT$devI,"$, 
                        slopes $V_{",NOT$devS,"}$ and their correlation $cor_{",NOT$devI,",",NOT$devS,"}$."),
    "intro"      = "<b>Background</b><br> Several studies have considered the issue of sample size requirements 
                  for random regression models. The general conclusion is that accurate parameter estimates 
                  in random regression require relatively high sample sizes, 
                  even moreso so to estimate the correlation between intercepts and slopes. 
                  When planning an optimal experimental design, researchers are faced with a 
                  trade-off between the number of individuals and the number of observations 
                  per individual they can sample.",
    
    "exercise"   = "<b>Exercise</b><br> The app below performs a set of simulations following different sampling designz, with different numbers of individuals and repeats 
                  per individual, so we may find the ideal set-up to find parameter estimates that accurately represent the truth. 
                  Here, we can use SQuID to help optimize the sampling design in terms of sampling effort and precision of the parameter estimates. 
    We will use the same model as in the step two:",
    "exercise_eq1" = paste0("$$",NOT$trait.1,"_{",NOT$time, NOT$ind,"}= ",EQ3$mean0,"+ ",NOT$devI,"_",NOT$ind,"+ (",NOT$mean,"+", NOT$devS,"_", NOT$ind,")", 
                            NOT$env,"_{",NOT$time, NOT$ind,"}+ ",NOT$error,"_{",NOT$time, NOT$ind,"}.$$"),
    
    "RCode"      = "# install.packages(&quot;lme4&quot;)<br>
  
                 LMM <- lme4::lmer(Phenotype ~ 1 + X1 + (X1|Individual), data = sampled_data)",
    
    "para1"      = paste0("The simulations a stochastic environment effect $",NOT$env,"$. 
                  We will sample individual trait expressions the same number of times but 
                  at different instances of time among individuals. The among-individual variance 
                  in sampling of timing will be 0."),
    
    "para2"     = "Can you determine the optimal sampling design based on the graphic representation of the estimates in the app? 
                 The figure below summarizes parameter estimates of 100 models fitted to 100 simulated datasets. 
    For each different sample size there will be three combinations: one with more individuals than repeats, 
                one with equal number of repeats and observations, and one with more repeats than individuals. 
    Each histogram shows the frequency distribution of a parameter based on the 100 simulations 
                that you ran for each of the three study designs. &ldquo;NI&rdquo; is the number of individuals and 
                &ldquo;NR&rdquo; is the number of repeats per individuals. The red line in each figure represents the <b>true value</b>
                , i.e. the value that you set for the parameter in the simulation. The histograms provide information 
                on the expected bias (inaccuracy) and imprecision that comes with each chosen study design. 
                If the chosen study design would be perfect (i.e., resulting in highly precise and accurate estimates) 
                your parameter estimates should be narrowly distributed around the true value. 
                If your estimates are precise but inaccurate, the distribution should be narrow 
                but peaking away from the true value. If your estimates are accurate but imprecise 
                the distribution should be peaking at the true value but simultaneously very broad. 
                Finally, if your estimates are imprecise and inaccurate the distribution would both 
                wide and peaking away from the true value."
  ),
  
  "portal_txt" = list(
    "parag0_title"         = "SQuID goal",
    "parag0_contents_1"    = "<b>SQuID</b> stands for <b>S</b>tatistical <b>Qu</b>antification of <b>I</b>ndividual <b>D</b>ifferences, and is the 
                                product of the SQuID working group. The basic idea of SQuID revolves around the exploration of statistical models
                                , and sampling designs for studies, using artificially generated datasets.
                                This app aims to provide a course which aids scholars who, 
                                like us, are interested in understanding patterns of phenotypic variation. To that end, 
                                we provide an educational tool useful for students, educators and researchers who want to learn to use 
                                mixed-effects models for their study of individual differences. Individual differences are the raw material 
                                for natural selection to act on and hence the basis of evolutionary adaptation. Understanding sources
                                of phenotypic variance is thus a most essential feature of biological investigation, 
                                and mixed-effects models offer a great, albeit challenging tool. 
                                In this app you can experience how the mixed-effects model framework 
                                can be used to understand biological phenomena by interactively exploring simulated multilevel data.",
    "parag0_contents_2"    = "In this app we make use of two \\texttt{R}-packages that SQuID has developed for simulation and dessimination of 
                            knowledge on mixed-effects models: <a href='https://cran.r-project.org/web/packages/squid/index.html'>squid: Statistical QUantification of Individual Differences</a>
                            and <a href='https://github.com/squidgroup/squidSim'>squidSim: a tool for simulating data from multi-level models</a>.
                                Through these \\texttt{R}-packages we enable the generation of datasets that you may download and use for a range of simulation-based 
                                statistical analyses, such as power and sensitivity analysis.",
    "parag1_title"         = "SQuID biological goals",
    "parag1_image"         = '<img id="logo" style="padding: 1%; right-padding: 2%;" src="images/squid_logo.png" align="left" alt="SQuID" width=120px heigth=120px>',
    "parag1_contents"      = 'SQuID seeks to understand patterns of phenotypic variance, which is the material 
                                on which natural selection is acting, and thus is a most essential feature of 
                                biological investigation. Different sources of variations are at the origin of 
                                the phenotype of an individual. Individuals differ in their phenotypes because 
                                they have different genes. They also experience different types of environmental 
                                effects during their lifetime. Some are imposing a very permanent mark on the 
                                phenotype over the whole lifetime. For example, by their parental behaviour 
                                individuals can affect their offspring phenotypes permanently, causing among-individual 
                                variation. Other environmental sources play more short-term effects on the phenotype, 
                                as individuals react in the plastic way to these sources, causing within-individual variation. 
                                The patterns of variation can be very complex. For instance individuals differ not only 
                                in their average phenotypes but also in how they can change their phenotype according to 
                                changes in the environment, which represents an interaction between the among- and the 
                                within-individual levels. Selection can act differently on these different components of 
                                variance in the phenotypes of a trait, and this is why it is important to estimate them. 
                                mixed-effects models are very flexible statistical tools that provide a way to estimate the 
                                variation at these different levels, and represent the general statistical framework 
                                for evolutionary biology. Because of the progress in computational capacities mixed 
                                models have become increasingly popular among ecologists and evolutionary biologists 
                                over the last decade. However, running mixed-effects model is not a straightforward exercise, 
                                and the way data are sampled among and within individuals can have strong implications 
                                on the outcome of the model. This is why we considered it was necessary to produce a 
                                simulation tool that could help new users interested in decomposing phenotypic variance 
                                to get more familiar with the concept of hierarchical organization of traits, with mixed 
                                models and to avoid pitfalls due to inappropriate sampling.',
    
    "background_title"     = "Background",
    "background_content_1" = "The phenotype of a trait in an individual results from a sum of genetic and environmental 
                                influences. Phenotypic variation is structured in a hierarchical way and the hierarchical 
                                modeling in mixed effect models is great tool to analyze and decompose such variation. 
                                Phenotypes vary across species, across populations of the same species, across individuals 
                                of the same population, and across repeated observations of the same individual. 
                                We focused on the individual level because it represents one of the most important 
                                biological levels to both ecological and evolutionary processes. Different sources 
                                of variation are at the origin of the phenotype of an individual. Individuals may 
                                differ in their phenotypes because they carry different gene variants (i.e. alleles). 
                                But individuals also experience different environments during their lifetime. 
                                Some environmental influences impose a lasting mark on the phenotype, while others are more ephemerous. 
                                The former tend to produce long-lasting, among-individual variation, while the latter 
                                causes within-individual variation. However, this depends on the time scale at 
                                which the measurements of the phenotypes are done relative that of the environmental 
                                influences. Furthermore, individuals differ not only in their average phenotypes 
                                but also in how they respond to changes in their environment 
                                (i.e. differences in individual phenotypic plasticity). 
                                This represents an interaction between the among- and the within-individual levels of variation. 
                                The patterns of variation can, thus, be very complex. Selection can act differently on these different 
                                components of variance in the phenotypes of a trait, and this is why it is important to quantify their magnitude.",
    "background_content_2" = "mixed-effects models are very flexible statistical tools that provide a way to estimate the 
                                variation at these different levels, and represent the general statistical framework for evolutionary biology.
                                Because of the progress in computational capacities mixed-effects models have become increasingly 
                                popular among ecologists and evolutionary biologists over the last decade. However, 
                                fitting mixed-effects model is not a straightforward exercise, and the way data are sampled among 
                                and within individuals can have strong implications on the outcome of the model. 
                                This is why we created the squid simulation tool that could help new users interested 
                                in decomposing phenotypic variance to get more familiar with the concept of hierarchical 
                                organization of traits, with mixed-effects models and to avoid pitfalls due to inappropriate sampling.",
    "parag2_title"         = "History of the project",
    "parag2_contents"      =  "It all started in Hannover in November 2013 at the occasion of a workshop on 
                                personality organised by Susanne Foitzik, Franjo Weissing, and Niels Dingemanse and funded 
                                by the Volkswagen Foundation. During this workshop, a group of researchers discussed the 
                                potential issues related to sampling designs on the estimation of components of the phenotypic 
                                variance and covariance. It became obvious that there was an urgent need to develop a 
                                simulation package to help anyone interested in using a mixed-effects model approach at getting 
                                familiar with this methods and avoiding the pitfalls related to the interpretation of the results. 
                                A first model and a working version of the package were created in January 2014, 
                                during a meeting at Universit&eacute; du Qu&eacute;bec &agrave; Montr&eacute;al. The current version was produced during a workshop 
                                in November 2014, at the Max Plank Institute for Ornithology in Seewiesen.",
    "parag3_title"         = "Brief description of the modules",
    "parag3_contents1"     = "<b>SQuID</b> is made to help you to become familiar with multilevel variation, and to 
                                build up sampling designs for your study. This course is built up as a series of modules that guide 
                                you through those concepts, by increasing complexity, so that you can explore the dynamics between the way 
                                records are collected and estimates of parameters of specific interest.",
    "parag3_contents2"     = paste0("The concepts here are based on a mathematical model that creates a group of individuals (i.e. the study population) 
                                repeatedly expressing phenotypes, for one or different traits, in uniform time. Phenotypic 
                                values of traits are generated following the general principle of the phenotypic equation 
                                (<a href='http://onlinelibrary.wiley.com/doi/10.1111/1365-2656.12013/abstract' target='_blank'>Dingemanse & Dochtermann 2013, Journal of Animal Ecology</a>), 
                                where phenotypic variance ($V_",NOT$total,"$) is assumed to be the sum of a series of components (the full model). 
                                You thus have the flexibility to add different variance components that will form the phenotype 
                                of an individual at each time step, and to set up the relative importance of each component. 
                                The SQuID \\texttt{R}-packages then allow you to articifially 'collect' a subsample of phenotypes for each individual 
                                (i.e. sample from a simulated population), according to some sampling design. For most of the modules, the 
                                operational data set generated is automatically fed into a statistical model in \\texttt{R}, and the results 
                                of the analysis are shown as output."),
    "parag4_title"         = "SQuID team",
    "parag4_contents"      = "Hassen Allegue (Universit&eacute; du Qu&eacute;bec &Agrave; Montr&eacute;al, Montreal, Canada)<br>
                                Yimen G. Araya-Ajoy (Norwegian University of Science and Technology, Trondheim, Norway)<br>
                                Niels J. Dingemanse (Max Planck Institute for Ornithology, Seewiesen & University of Munich, Germany)<br>
                                Ned A. Dochtermann (North Dakota State University, Fargo, USA)<br>
                                Laszlo Z. Garamszegi (Estaci&oacute;n Biol&oacute;gica de Do&ntilde;ana-CSIC, Seville, Spain)<br>
                                Shinichi Nakagawa (University of New South Wales, Sydney, Australia)<br>
                                Denis R&eacute;ale (Universit&eacute; du Qu&eacute;bec &Agrave; Montr&eacute;al, Montreal, Canada)<br>
                                Holger Schielzeth (University of Bielefeld, Bielefeld, Germany)<br>
                                David F. Westneat (University of Kentucky, Lexington, USA)<br>",
    "patag3_image"         = '<div style="clear:both"><img id="logo" src="images/modules.png" align="center" alt="Modules" width=80% height=80%></div>',
    "beginners"            = paste0("The SQuID modules are designed for those who have some (but not a 
                                lot) of background in statistical modeling, particularly with linear mixed-effects models. 
                                We strongly recommend to being with the module <i>",Module_titles$mod1,"</i>, if you fall in this category.
                                That should be followed by the module <i>",Module_titles$mod3,"</i>. Which module you choose next depends 
                                on your interests, but step one in the module <i>",Module_titles$mod5,"</i> 
                                introduces multiple regression. The module &ldquo;",Module_titles$mod6,"&rdquo; 
                                may also be good to do after module &ldquo;Non-stochastic environments&rdquo;."),
    "teachers"             = "The SQuID modules can be very useful in teaching statistical concepts, 
                                especially ones related to linear mixed-effects models. Which module to use 
                                depends on your students' prior knowledge, and their learning goals. 
                                Brief descriptions of each module are available on this page below. We also recommend that you skim some of 
                                the modules to better understand how SQuID works.",
    "experts"              = "SQuID was designed to provide a user-friendly and web-based program 
                                for the simulation of data and for the testing a variety of ideas about sampling and 
                                bias in mixed-effects modeling. For those very familiar with 
                                these approaches and curious about SQuID, we recommend to explore the 'full model' section
                                in <a href='https://squid-group.shinyapps.io/shiny-squid/'>the original SQuID app</a>. 
                                Once you understand how SQuID works, the &ldquo;Express model&rdquo; version 
                                will work best. Finally, if you are interested in simulation in a reproducible framework,
                                we suggest you check out the \\texttt{squidSim R}-package.",
    "references_title"    = "References",
    "references_content"  = "Allegue, H., Araya-Ajoy, Y.G., Dingemanse, N.J., Dochtermann N.A., Garamszegi, 
                              L.Z., Nakagawa, S., R&eacute;ale, D., Schielzeth, H. and Westneat, D.F. (2016). 
                              SQuID - Statistical Quantification of Individual Differences: an educational 
                              and statistical tool for understanding multi-level phenotypic data 
                              in the mixed-effects modelling framework. Methods in Ecology and Evolution, 
                              8:257-267.<br><br>
                              Dingemanse, N.J. and Dochtermann N.A. (2013). Quantifying individual variation in behaviour: 
                              mixed-effect modelling approaches. Journal of Animal Ecology, 82:39-54."
    
    
  ),
  
  # Step 1 --------------
  "Mod5Step1_txt" = list(  
    "title" = "Step 1: Adding multiple slopes that vary among individuals",
    "goal" = "This module combine the concepts we have covered in previous modules, in order to figure out how we can statistically test for individual variation in interaction 
         terms, and to study what sampling regimes might improve the ability to do so.",
    
    "intro" = paste0("<b>Background</b><br> Multidimensional phenotypic plasticity is a widespread feature of most living organisms. 
                In many cases it appears to be adaptive. For example, copulating male dung flies stay in copula for 
                a length of time that depends on the size of the female, and on the abundance of females in the local 
                population. This fits reasonably well with what we would predict given the fitness gained 
                from staying in copula longer or leaving to search for a new female. For this to have evolved via 
                selection, at some point there must have been among-individual variation reflecting genetic variation 
                for multidimensionality.
                In the module titled <i>",Module_titles$mod5,"</i>, you fitted models where individuals had differed intercepts. 
                And in the module titled <i>",Module_titles$mod6,"</i>, you fitted models where  individuals had different slopes for an 
                environmental predictor. Here, we extend these ideas to regression planes with two or more dimensions, adding some complexity."),
    
    "para1" = paste0("Recall that the equation describing MDPP in the last module was:"),
    "para1_eq1" = paste0("$$", NOT$trait.1,"_{",NOT$time,NOT$ind,"} = ",EQ1$mean0," + ",EQ1$dev0,"  + ",EQ1$mean1,NOT$env,"_{1",NOT$time,NOT$ind,
                            "} + ",EQ1$mean2,NOT$env,"_{2",NOT$time,NOT$ind,"} + ",EQ1$mean12,NOT$env,"_{1",NOT$time,NOT$ind,"}",NOT$env,"_{2",
                            NOT$time,NOT$ind,"} + ",NOT$error,"_{",NOT$time,NOT$ind,"}.$$"),
    
    "para2" = paste0("This equation describes a population average plane in the space described by 
           $",NOT$env,"_{1}$ and $",NOT$env,"_{2}$, with individuals appearing like a stack of planes that 
           differ only in the intercept, which is defined as the point where both 
           $",NOT$env,"_{1}$ and $",NOT$env,"_{2}$ are zero. Whether the plane is warped ($",EQ1$mean12,"\\neq0$) or not, 
           all individuals have the same planar shape. If they varied in 
           some aspect of this plane, we would not detect that in this statistical model."),
    
    "para3" = paste0("In the module on random regression, you learned that individuals might also vary in their slope with respect to $",NOT$env,"_{1}$, and 
    that individual slope could covary with individual intercept both positively and negatively. 
    Combining the concepts from that module with that on interaction terms, the model equation becomes:"),

    "para3_eq1" = paste0("$$", NOT$trait.1,"_{",NOT$time,NOT$ind,"} = ",EQ1$mean0," + ",EQ1$dev0,"  + (",EQ1$mean1,"+",EQ1$dev1,")",NOT$env,"_{1",NOT$time,NOT$ind,
                         "} + ",EQ1$mean2,NOT$env,"_{2",NOT$time,NOT$ind,"} + ",EQ1$mean12,NOT$env,"_{1",NOT$time,NOT$ind,"}",NOT$env,"_{2",NOT$time,NOT$ind,"} + ",
                         NOT$error,"_{",NOT$time,NOT$ind,"},$$"),
    
    "para4" = paste0("where $$","\\begin{pmatrix}",EQ1$dev0," \\\\ ",EQ1$dev1," \\end{pmatrix}","\\sim MVN(0, \\Omega_{",NOT$devI,NOT$devS,"}), \\quad \\text{where } \\Omega_{",
                     NOT$devI,NOT$devS,"}= ", "\\begin{pmatrix} V_{",NOT$devI,"} & cov_{",NOT$devI,EQ3$dev1,"} \\\\  cov_{",NOT$devI,EQ3$dev1,"} & V_{",EQ3$dev1,
                     "} \\end{pmatrix}",".$$"),
    
    "para5" = paste0("A similar equation is included in the module on random regressions, though here we added 
           a subscript to identify that the slopes are for $",NOT$env,"_{1}$. 
           This means that the intercept of the $",NOT$ind,"^{th}$ individual ($",EQ1$dev0,"$) 
           and the slope of that individual ($",EQ1$dev1,"$) for $",NOT$env,"_{1}$ are 
           distributed as a multivariate normal distribution, with means of zero and a variance-covariance 
           matrix $\\Omega_{",NOT$devI,NOT$devS,"}$. The variance-covariance matrix has four entries, of which the off-diagonal entries $cov_{",NOT$devI,EQ3$dev1,"}$ represents how much $",EQ1$dev0,"$ and 
           $",EQ1$dev1,"$ covary."),
    
    "exercise" = "<b>Exercise</b><br>The following app will allow you to explore the aforementioned model with simulation.
                        Once the data are simulated, two models are fitted, one which includes covariance between the intercepts and slopes,
                        and another that ignores that covariance, so that you may explore the consequences of ignoring covariance between terms. In this app we present two figures, the first illustrates what
    variance the random slopes can capture, and the second shows the reaction norm planes of three of the individuals picked form the data.",
    
    "para6" = paste0("The above should illustrate again that model misspecification (e.g., leaving out terms that should be included),
    will produce inaccurate estimates in other terms. A key feature is that while there is a plane that describes the reaction norm as defined 
           by $",NOT$env,"_{1}$ and $",NOT$env,"_{2}$, the random slopes for $",NOT$env,"_{1}$ are measured 
           in only one value of $",NOT$env,"_{2}$, where it equals zero. As you could see from the difference the two figures, these planes vary in only one dimension of the environmental space. 
           Since we did not specify any variation in the reaction to $",NOT$env,"_{2}$, or to the interaction between 
           $",NOT$env,"_{1}$ and $",NOT$env,"_{2}$, all individuals are assumed to have the same plane in those directions. If you tried this in the app with several different values for the parameters 
           $V_{",NOT$devI,"}$, $V_{",EQ3$dev1,"}$, and $cov_{",NOT$devI,EQ3$dev1,"}$, 
           you will see that these affect the orientation of the plane only in one dimension."),
    
    "para7" = paste0("We continue by adding among-individual variation in response to $",NOT$env,"_{2}$. 
    In the phenotypic equation, we add $",EQ1$dev2,"$ to the part that depends on $",NOT$env,"_{2}$, so that the statistical model becomes:"),
    
    "para7_eq1" = paste0("$$", NOT$trait.1,"_{",NOT$time, NOT$ind,"} = ",EQ1$mean0," + ",EQ1$dev0,"  + (",EQ1$mean1,"+",EQ1$dev1,")",NOT$env,"_{1",NOT$time,NOT$ind,
                            "} + (",EQ1$mean2,"+",EQ1$dev2,")",NOT$env,"_{2",NOT$time,NOT$ind,"} + ",EQ1$mean12,NOT$env,"_{1",NOT$time,NOT$ind,"}",NOT$env,"_{2",NOT$time,NOT$ind,
                            "} + ",NOT$error,"_{",NOT$time,NOT$ind,"}.$$"),
    
    "para8" = "However, we now have a more complex variance-covariance expression, 
    which includes combinations of 
    three terms instead of two as before:",
    
    "para8_eq1" = paste0("$$", "\\begin{pmatrix}",EQ1$dev0," \\\\ ",EQ1$dev1," \\\\ ",EQ1$dev2," \\end{pmatrix}", "\\sim MVN(0, \\Omega_{",NOT$devI,NOT$devS,
                         "}), \\quad \\text{where } \\Omega_{",NOT$devI,NOT$devS,"}= ", "\\begin{pmatrix} V_{",NOT$devI,"} & cov_{",NOT$devI,EQ3$dev1,"} & cov_{",NOT$devI,EQ3$dev2,
                         "} \\\\ cov_{",NOT$devI,EQ3$dev1,"} & V_{",EQ3$dev1,"} & cov_{",EQ3$dev1,EQ3$dev2,"} \\\\ cov_{",NOT$devI,EQ3$dev2,"} & cov_{",EQ3$dev1,
                         EQ3$dev2,"} & V_{",EQ3$dev2,"}\\end{pmatrix}",".$$"),
    
    "exercise2" = "<b>Exercise</b><br>We will now simulate data with this extended model, and assess one consequence of random slopes in a reaction 
           norm plane. First, we will explore where variation due to the random slope exists in the two environmental 
           dimensions. We start with a population of 100 individuals each measured 20 times in which 
           both predictors were also measured, and where both environments are random and unshared. Large values for the covariances, either positive 
    or negative, will be visible in the figures more quickly. In this app, only the the correct model is fitted, and the figure is thus based on the 'true' model.",
    
    "para9" = paste0("Trying several different values for the parameters 
           $V_{",NOT$devI,"}$, $V_{",EQ3$dev1,"}$, and $V_{",EQ3$dev2,"}$, 
           and the covariances, will show that these affect the orientation of the plane 
           around the zero for both environments, and its height at that spot, 
           but any curvature of the plane due to the parameter $",EQ1$mean12,"$ is the same for everyone. 
           As you can see, these planes now vary in both dimensions of the environmental space. If you think of the intercept as a pole in this space, the individual slopes cause 
    the planes to wobble or tip in all directions at the top of the pole relative to the population mean plane and the variation in intercept causes the plane 
    to rise or sink at the intercept relative to the population mean plane. Covariances can be thought of as constraining the range 
    of plane tipping in just certain directions, and the different covariances cause different constraints.")
  ),
  
  # Step 2 --------------
  "Mod5Step2_txt" = list(
    "title" = "Step 2: Adding the random interaction term",
    "intro" = paste0("Step one built on concept of having the random slopes for each predictor $",NOT$env,"$, 
           and these served to tip the population mean plane in various directions in environmental space. 
           However, the population mean plane could be warped due to an interaction between 
           the two predictors. Because it appears that such warping is adaptive in real organisms, 
           this would imply that individual variation in the extent of warping is possible. 
           Here we add that last random-effect term to the phenotypic equation. In other words, here we explore individual-specific parameters for interaction terms."),
    
    "para1" = paste0("As such, the phenotypic equation is expanded to include three slope terms, $",EQ1$dev1,"$, 
           $",EQ1$dev2,"$, and $",EQ1$dev12,"$, which are the individual deviation from the population 
           slope with respect to $",NOT$env,"_{1}$, $",NOT$env,"_{2}$, and the interaction between the 
           two $",NOT$env,"$ predictors, respectively. The model equation is then:"),
    "para1_eq1" = paste0("$$", NOT$trait.1,"_{",NOT$time,NOT$ind,"} = ",EQ1$mean0," + ",EQ1$dev0,"  + (",EQ1$mean1,"+",EQ1$dev1,")",NOT$env,"_{1",NOT$time,NOT$ind,
                         "} + (",EQ1$mean2,"+",EQ1$dev2,")",NOT$env,"_{2",NOT$time,NOT$ind,"} + (",EQ1$mean12,"+",EQ1$dev12,")",NOT$env,"_{1",NOT$time,NOT$ind,"}",
                         NOT$env,"_{2",NOT$time,NOT$ind,"} + ",NOT$error,"_{",NOT$time,NOT$ind,"}.$$"),
    
    "para2" = "The addition of another random-effect expands the variance-covariance matrix again too. 
    It becomes increasingly difficult to understand the variance-covariance matrix, but moving through it systematically makes it clear that it just
    a accounts for relationships between the different parameters:",
    "para2_eq1" = paste0("$$ \\begin{pmatrix}",EQ1$dev0," \\\\ ",EQ1$dev1," \\\\ ",EQ1$dev2," \\\\ ",EQ1$dev12,"\\end{pmatrix} \\sim MVN(0, \\Omega_{",NOT$devI,NOT$devS,
                         "}), \\qquad \\text{where } \\Omega_{",NOT$devI,NOT$devS,"}= \\begin{pmatrix} V_{",NOT$devI,"} & cov_{",NOT$devI,EQ3$dev1,"}  & cov_{",NOT$devI,EQ3$dev2,"}  & cov_{",
                         NOT$devI,EQ3$dev12,"} \\\\ cov_{",NOT$devI,EQ3$dev1,"}  & V_{",EQ3$dev1,"} & cov_{",EQ3$dev1,EQ3$dev2,"}  & cov_{",EQ3$dev1,EQ3$dev12,"} \\\\ cov_{",
                         NOT$devI,EQ3$dev2,"}  & cov_{",EQ3$dev1,EQ3$dev2,"}  & V_{",EQ3$dev2,"} & cov_{",EQ3$dev2,EQ3$dev12,"} \\\\cov_{",NOT$devI,EQ3$dev12,"} & cov_{",
                         EQ3$dev1,EQ3$dev12,"} & cov_{",EQ3$dev2,EQ3$dev12,"} & V_{",EQ3$dev12,"} \\end{pmatrix}.$$"),
    
    "exercise" = "<b>Exercise</b><br>
    We will now simulate data with this new model, and explore the situation of random slopes 
    in two dimensions. First, we consider where variation due to the interaction term 
    ends up in a model that lacks that term. Second, we will try to visualize where 
    variation due to warping is more likely to be seen. A 3D plot of the population mean (below) provides you with a visual orientation 
           to the average phenotype across the environmental space created by the two predictors. ",
    
    "para3" = paste0("Since there are now more parameters in the model, we need more information to accurately estimates them, and thus we increase the number of sampled individuals to 500. 
           As before, each individual is measured 20 times for both predictors and both environments are random and unshared."),
    
    "para4" = "By default, the app simulates assuming that there are no covariances between the parameters. Then, you can increase them one by one
    to more easily see what each does. Once the data are simulated, we again fit the correct model, and the model without individual-specific interaction term as in the previous step, i.e., following the equation:",
    "para4_eq1" = paste0("$$", NOT$trait.1,"_{",NOT$time,NOT$ind,"} = ",EQ1$mean0," + ",EQ1$dev0,"  + (",EQ1$mean1,"+",EQ1$dev1,")",NOT$env,"_{1",NOT$time,NOT$ind,
                         "} + (",EQ1$mean2,"+",EQ1$dev2,")",NOT$env,"_{2",NOT$time,NOT$ind,"} + (",EQ1$mean12,")",NOT$env,"_{1",NOT$time,NOT$ind,"}",NOT$env,"_{2",
                         NOT$time,NOT$ind,"} + ",NOT$error,"_{",NOT$time,NOT$ind,"}$$"),
    
    "para5" = paste0("As usual, omission of a key parameter causes variation to be placed elsewhere in the equation, 
    in this case mostly in the residual. "),
    
    "conclusion" = "<b>Conclusion</b><br> The effect of interactions between environments on phenotypes has three important characteristics. First, it seems biologically likely given 
the complexity of the environment, and it has been observed in many traits. Second, these effects can be captured using mixed-effects models, including the random-effects 
of individuals on the response to each environment, and in theory on the interaction term itself. The third characteristic is that these models are exceedingly complex. There are many more extensions of the phenotypic equation to explore, but you now should have all the basic tools you need! 
"

  ),

"placeholder_image"         = '<div style="clear:both; text-align:center"><img id="logo" src="images/underConstruction_pic.png" align="center" alt="Modules" width=120px height=120px></div>',

"extra" = list(
  
  # Step 1 --------------
  "Extra1Step1_txt" = list(
    "title" = "Step 1: The biology that produces binary or count data",
    
    "goal" = "Biology often involves non-normally distributed data. Here, we introduce some other distributions.",
    
    "intro" = "<b>Background</b><br> Before you start analyzing your data, one thing you want to consider is the biological process that
        generated the data, and how the phenomena that you are interested in is expressed by organisms. 
         Most of the statistical methods we are familiar with make assumptions about how data are distributed 
         (or really how the errors are distributed). In the linear mixed-effects models that we considered in the first module,
       we assumed a normal distribution for the errors (which is equivalent to a Gaussian error structure). However, is this always an appropriate assumption?",
    
    "para1" = "While the assumption of normality may work in many instances, violation of that assumption has a range of consequences.
    In biological terms, let us consider examples of traits that we would not expect to be normally distributed. 
    A common example is the sex-ratio of offspring. Since the biological sex of our offspring can only be female or male, it is unlikely
    that data would be normally distributed, and thus should not be analyzed with a linear (mixed-effects) model. 
    This is apparent in species with temperature-dependent sex determination where the temperature 
    an egg is incubated at determines whether the offspring will be female or male.",
    
    "para1_image" = '<div style="clear:both; text-align:center"><img src="images/Alligator_mississippiensis.jpg" alt="Alligator mississippiensis" width=50% height=50%></div>',
    
    "para1_image_caption" = "<a href='https://en.wikipedia.org/wiki/American_alligator'><i>Alligator mississippiensis</i></a>, 
           a species that exhibits temperature-dependent sex determination.<br><br>",
    
    "para2" = "The below app allows you to explore the effects of incubation temperature on the sex ratio found in offspring of American alligators. 
    From the plot alone, it is clear that sex ratio does not conform to a normal distribution, so that a linear regression to try and understand 
    how temperature affects sex ratio would be inappropriate.",
    
    "para3" = "A different example is one where sex is determined via particular 
    combinations of allosomes  (i.e. sex chromosomes). In such cases the sex of offspring 
    will be determined via what is known as a binomial process. The most classical example
    of a binomial process is that of coin flipping. Let us consider how the coin flip process of 
    genetic sex determination interacts with the number of coin flips to give a distribution of sexes. We can either flip a single coin many times, or many coins a single time.
    The results of both can be expressed as binary data, if all coins are unweighted the resulting probability will be the same. The difference is our
    unit of interest; do we focus on the coin or the flips? When we focus on the flips, this is known as a Bernoulli process: a binomial process with a single trial.
    The following app simulates a binomial process where your input determines the number of coin flips, with equal chance for the coin to land on either side.",
    
    "para4" = "The outcome of a single coin flip, like that for a single egg, represents what is known as binary data, i.e., 
    this data takes the form of one or zero (A or B, female or male, etc.). Many other biological processes take a similar form: 
    at a particular instance one of two outcomes is possible. Importantly, this process also works when the odds of either 
    outcome are not exactly 50/50, for example when we are flipping with a weighted coin that has a higher chance to land on the heads-side. 
    If one of our many coins is weighted, we will probably not notice the difference
    in a Binomial process with a large enough number of coins, while if our single coin of the Bernoulli process is weighted it will affect our results a lot!
    The following app simulates 100 coin flips, where 
  'female probability' corresponds to the chance for the coin to land on the head-side.
  The 'male probability' is then the chance for the coin to land on the tails-side 
  (which is just the total number of flips minus the number of times it landed on the heads-side!).",
  
  "para5" = "This situation is now starting to approach what we saw with temperature-dependent sex determination. In that case,
  the trait we are measuring is always one of two conditions (e.g. female or male), the probability to get either outcome depends on an additional
  predictor: environmental condition. Many biological traits are expressed in binary terms, including e.g. expressed repeatedly over a lifetime.
  An example of this is whether a bird mates during a particular breeding season or 
  whether a plant flowers during a particular year. This Bernoulli process can  statistically be modelled using the likenamed distribution, parameterized by the parameter we explored so far:
  the probability for a 'success'. Naturally, the larger the number of coin flips (i.e. observations) the better your estimate for
  the probability of the coin to land on either side, since the randomness will average out.",
  
  "para6" = "However, if we also flip multiple coins, we might be less affected by a single weighted coin amongst unweighted coins.
  In biological terms, we might instead have multiple clutches of eggs. The case of a single coin flip is known as a Bernoulli process, which is a special case of the binomial process.
    In light of our example of the sex of offspring, the sex of each individual egg is the result of a Bernoulli process with a single observation, while that for the whole
    clutch is the result of a binomial process with the size parameter equal to the number of eggs. Thus, for multiple clutches, we have a binomial process where the number of eggs equals the number of trials (size parameter), and the number of clutches equals the number of observations",
  
  "exercise" = "<b>Exercise</b><br> Now, use the following app to explore the two parameters of the binomial distribution (number of trials and probability of success) simultaneously, in combination with the sample size.
  Can you find out for which number of trials (number of offspring), number of clutches (sample size), and probability for female offspring, the binomial distribution resembles a normal distribution?",
  
  "para7" = "Many types of biological data might similarly be expressed as proportions: 
    for example, a count of seeds that successfully germinate and a the number of females in a group. 
    We now know that this type of data is <b>binomially distributed</b>.",
  
  "para8_title" = "Independence of observations",
  
  "para8" = "The most important characteristic of the data above is that each observation is generated via a Bernoulli process: 
    an egg is either female or male, a seed either germinates or it does not. 
    The germination of one seed is not affected by another, so the data are independent of each other, which is a assumption for 
    most statistical models and distributions. In contrast, we might encounter data that are in some way similar, e.g. we might often observe an individual performing a particular action as binary data.
    An individual might be foraging now, and after it was foraging it might be more likely to be eating than sleeping.
    Similarly, if an individual is currently foraging, that means it is likely to still be foraging if we observe its behavior a short moment later, 
  whereas if we observe it a week from now there is no saying what it will be doing. This distinction can be very important 
    in statistical analyses as it violates the assumption of independent Bernoulli trials, or whatever process you assume generated your data.
    If you assume independence of observations in scenarios where that is noot appropriate, the resulting p-values and confidence intervals of estimates are likely wrong.",
  
  "para9_title" = "Count Data",
  
  "para9" = "Besides binary data, another common type of data in ecology is that from a Poisson process, i.e. count data. 
    Examples include traits like such as the number of clutches that a bird has in a single year, and the number of
    flowers that a plant is able to produce over the course of the growth season. In both of these examples the key aspect 
    is that some act is performed or something is produced at a continuous rate. The average production 
    over some sampling period (breeding season, life-time, etc.) is then the average of as Poisson distribution, which is characterized by the rate ($\\lambda$) parameter. 
    This single parameter fully determines the shape of the resulting distribution. The following app allows you to test
  different magnitudes for the rate parameter to explore how it affects the shape of a Poisson distribution.",
  
  "para10" = "If you set a high enough mean, the Poisson distribution begins 
    to resemble a normal distribution (if you have not tried to do so yet, try to enter a large number for the rate parameter in the app and see). 
    Similarly as in the binomial case, this distribution is not actually normal and should not be considered 
    as one due to additional properties of the Poisson process. A Poisson process usually has the additional property that the variance is equal to the mean, and of course counts cannot be negative!"
  ),
  
  # Step 2 --------------
  "Extra1Step2_txt" = list(
    "title" = "Step 2: The Bernoulli, binomial and Poisson distributions",
    
    "goal" = "Here we aim for you to learn the properties of the three key non-Gaussian statistical distributions: the Bernoulli, binomial, and Poisson distributions.",
    
    "intro" = "<b>Background</b><br> In the first step of this module we considered biological scenarios where non-Gaussian data could arise. 
         The two most important types of data are binary and counts, for which we consider three distributions here namely the Bernoulli, binomial and Poisson distributions. 
        We emphasized before that the Bernoulli distribution is a special case of the binomial distribution, but also note that there are connections between a binomial and a Poisson distribution (naturally, because we use both of them to analyse count data).
        This is possible to explore using the last app of the previous step, where you will see that as the number of trials and the number of observations gets large, and the probability of success is small, the binomial resembles a Poisson distribution.
        Remember that a Gaussian (normal) distribution is characterized with a mean ($\\mu$) and variance ($V$). Statistical parameters for the three non-Gaussian distributions 
         are not the mean and variance (at least they are not called so), though those distributions also have a mean and variance. Let us have a closer look at the parameters that define
         each of the aforementioned non-Gaussian distributions now.",
    
    "para1" = "A <b>Bernoulli</b> distribution is characterized by one (free) parameter, $p$, which is often interpreted 
         as a probability of success. Biologically, as before you can consider it as the probability 
         of female offspring. We could sormulate a Bernoulli distribution with two parameters, where the probability of not getting female offspring, 
    i.e. the probability to get male offspring, is $q = 1-p$. However, because $q$ is fully determined by $p$, we just formulate the distribution with $p$.
    More formally, we can denote a trait $y$ follows a Bernoulli distribution with a mean ($\\mu$) and variance ($V$) as:",
    "para1_eq1" = "$$y \\sim Bernoulli(p)$$",
    "para1_eq2" = "$$\\mu = p$$",
    "para1_eq3" = "$$V = p(1-p)$$",
    
    "para2" = "Furthermore, a <b>binomial</b> distribution has one more (free) parameter, which is the number of trials $m$. 
         A biological example is multiple clutches of eggs, with the number of clutches being $m$, and with the probability of female being $p$. 
         More formally, we can denote the trait $y$ following a binomial distribution as:",
    "para2_eq1" = "$$y \\sim binomial(m,p)$$",
    "para2_eq2" = "$$\\mu = mp$$",
    "para2_eq3" = "$$V = mp(1-p)$$",
    
    "para3" =  "This makes it clear that a Bernoulli distribution is just a binomial distribution with $m = 1$. Lastly, the <b>Poisson</b> distribution has one (free) parameter, which often called, $\\lambda$ (the 'rate' parameter). We can denote the trait $y$ as following a Poisson distribution:",
    "para3_eq1" = "$$y \\sim Poisson(\\lambda)$$",
    "para3_eq2" = "$$\\mu = \\lambda$$",
    "para3_eq3" = "$$V = \\lambda$$",
    
    "para4" = "As you can see, the mean equals the variance in a Poisson distribution, so as for the Bernoulli we can also formulate it as being a two parameter distribution. 
    For both Bernoulli and binomial distributions, the mean and variance are also connected as you can see in the equations above. 
    In fact, a unique feature of a Gaussian distribution is the lack of relationship between its mean and variance. 
    Non-Gaussian distributions, in general have a mean-variance relationship. 
    Finally, we can more formally show that a binomial distribution resmebles a Poisson distribution when $p$ is very small becauuuse:",
    "para4_eq1" = "$$V = mp(1-p) \\approx mp = \\lambda$$",
    
    "exercise" = "<b>Exercise</b><br> The following plot visualizes the mean-variance relationship for Bernoulli distributions with $p$ ranging from 0 to 1 and for Poisson distributions where $\\lambda$ varies between 0.5 and 100."
  ),
  
  # Step 3 --------------
  "Extra1Step3_txt" = list(
    "title" = "Step 3:  Background to generalized linear mixed-effect models (GLMMs)",
    
    "goal" = "Mixed-effects models are called 'generalized' for non-normal distributions. Here, we explain the concept of the link and inverse link functions, and that of overdispersion, 
         and some of the differences in modeling Gaussian and non-Gaussian traits.",
    
    "para1" = "<b>Background</b><br> In other modules, we assumed that the trait of interest $y$ follows a Gaussian distribution.
         We then used thhe mixed-effects modeling framework to partition variance in $y$. 
         For a non-Gaussian trait, $y$ we still want to relate a similar model to our data so that we can use the same mixed-effects model framework 
         that we also have been using in other modules so far. This requires acknowledging the mean-variance relationship of non-Gaussian data generating processes,
        in addition to adhering to the properties of the parameters that define each statistical distribution. For example, in the Bernoulli case we want to model the 
    probability of success $p$, but it can only range from zero to one. In the Poisson case, the rate parameter $\\lambda$ needs to always be positive.
    These 'restrictions' are facilitated using a 'link' function in generalized linear models (GLMs). In GLMs we also assume that different values of $y$ are independent of each other,
    or we use generalized linear mixed-effects models (GLMMs) when y values are repeated measures and if they follow from some kind of a correlational structure (e.g. relatedness between indivdiuals). 
    Usually, the link is determined by a distribution, which is referred to as 'the canonical link function' of a certain GLM, which is the only type we deal with here. 
    However, there are few link functions that work for every distribution, and in some cases you might want to consider using an alternative.
         Also, the 'inverse link' function can bring results from the 'link' scale ($y^\\prime$, alternatively referred to as the 'latent' scale) back to the response (or original) scale (e.g. $0-1$ for probabilities, or $0-\\infty$ for rates). 
         The canonical link function for binary data is the logit link function, but alternatives include the probit or the complementary log-log link functions. In the case of a linear regression, the link function is the 'identity' link, which means that the latent and original scale are the same.
    The logit function and its inverse can be presented mathematically as:",
    "para1_eq1" = "$$y \\sim Bernoulli(p)$$",
    "para1_eq2" = "$$logit(p) = ln(\\frac{p}{1-p}) = y^\\prime$$",
    "para1_eq3" = "$$logit^{-1}(y^\\prime) = \\frac{1}{1 + e^{-y^\\prime}} = p$$",
    
    "exercise" = "<b>Exercise</b><br> To understand the concept of the link and inverse link functions better, 
         we will simulate a trait $y^\\prime$ on the latent scale, and transform it to $p$.",
    
    "para2" = "We here generated binary data with a normal distribution, by using the inverse link function 
    and the Bernoulli distribution.",
    
    "intro2" = "The second concept we will learn for modeling non-Gaussian data is overdispersion, 
         ('dispersion' relates to variability of a distribution, like the variance in a Gaussian distribution, but 
         it is a more general term). Overdispersion occurs when 
                     the variation in the data is more than expected by that of the statistical distribution it is modelled with. In the Binomial case, this usually
                     occurs when the number of trials differs for the observations, and is not known a-priori.
    Imagine that we record the number of female and male offspring per breeding season and for a number of years.
        We again call our data $y$, but we give it the indices $i$ for the female that mothered the offspring, in season $h$. 
        Then, using the logit link function and a binomial distribution, $y$ can be 
         expressed as a GLMM:",
    "intro2_eq1" = "$$y_{hi} \\sim binomial(m_{hi}, p_{hi})$$",
    "intro2_eq2" = paste0("$$p_{hi} = logit^{-1}(y^\\prime) = logit^{-1}(",EQ3$mean0," + ",EQ1$dev0," + o_{hi})$$"),
    "intro2_eq3" = paste0("$$",EQ1$dev0," \\sim N(0,V_", NOT$devI,")$$"),
    "intro2_eq4" = "$$o_{hi} \\sim N(0,V_o)$$",
    
    "para3" = paste0("where $\\text{logit}^{-1}$ is the inverse link function and $o_{hi}$ is an overdispersion term.
           We assume $o_{hi}$ to be normally distributed, as we do for the individual random-intercept $",EQ1$dev0,"$. All the key parameters (population mean $",EQ3$mean0,"$ and individual-specific deviation $",EQ1$dev0,"$)
           are estimated on the latent scale where random-effects are (assumed to be) normally distributed.
           It is also interesting to notice that $o_{hi}$ is very much like $",NOT$error,"_{hi}$ (residuals),
           which we have seen in other modules, but here $o$ is referred to as additive (over)dispersion.
           The overdispersion $o_{hi}$ is also known as the observation-level random-effect
           because the number of categories of this random-effect matches the number of data points,
           this aspect is thus somewhat analogous to the residuals in a linear mixed-effects model."),
    
    "para4" = "Overall the GLMM above looks very similar to a linear mixed-effects models, apart from the overdispersion 
    and the (inverse) link function that connect $p_{hi}$ and $y_{hi}$. 
    For a binary trait (dead or alive, male or female, present or absent), $m_{hi}$ is equalt one. Then, $o_{hi}$ 
    is always 0 because overdispersion is not 'identifiable' in binary data (it cannot be determined, or be present for that matter). Now, imagine instead the number of matings ($y$) per female ($i$) animal and per season ($h$). 
  Then, using the log link function with a Poisson distribution, so that $y$ can again be written as a GLMM:",
  
  "para4_eq1" = "$$y_{hi} \\sim Poisson(\\lambda_{hi})$$",
  "para4_eq2" = paste0("$$\\lambda_{hi} = exp(",EQ3$mean0," + ",EQ1$dev0," + o_{hi})$$"),
  "para4_eq3" = paste0("$$",EQ1$dev0," \\sim N(0,V_", NOT$devI,")$$"),
  "para4_eq4" = "$$o_{hi} \\sim N(0,V_o)$$",
  
  "para5" = "where exp is the inverse link function (of log), and the other notations are the same as above. 
    Again, on the latent scale, random-effects are all normally distributed, and the equation is very 
    similar to a Gaussian trait.",
  
  "exercise2" = paste0("<b>Exercise</b><br> In the following coding exercise we input the true values for the parameters ($",EQ3$mean0,"$, $V_", NOT$devI,"$, and $V_o$) 
                on the latent scale in the Poisson GLMM with the log link function, and use them to generate count data. 
                The simulation starts done with 50 individuals that are sampled 2 times each. You can test the impact of different values
                for the inputs, and their effects on the parameter estimates from the GLMM."),
  "conclusion" = "<b>Conclusion</b><br> The underlying biological process that generates phenotypes is important to consider 
         as not all biological processes produce Gaussian data. Deciding how you are going to 
         analyze your data requires that you consider how it was generated, as it is the biological process that determines
         which analysis is most suitable to conduct. Once you have identified you are dealing with non-Gaussian data, including binary data or
         counts, you can continue using GLMMs for the modeling (with appropriate link function 
         and distribution, e.g., log link function with a Poisson distribution). Finally, on the latent scale, 
         we can thus estimate regression coefficients and variance components just like we did in the case of Gaussian data."
  )
)
)