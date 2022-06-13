# Create a slider input 

getSliderInput<- function(inputID, inputConf, placement="top", trigger="hover" , width = "49.5%", min = NULL, max = NULL, value = NULL,  step = NULL) 
{    
  
  if(inputConf$infoTxt != ""){
    mylabel  <- c(inputConf$label,getIcon(inputConf$infoTxt, placement, trigger))
  }else{
    mylabel <- inputConf$label
  }
	
	myOutput <-  span(
		sliderInput(inputID,
								mylabel, 
								value = ifelse(is.null(value),inputConf$valu,value), 
								min   = ifelse(is.null(min),inputConf$min,min), 
								max   = ifelse(is.null(max),inputConf$max,max), 
								step  = ifelse(is.null(step),inputConf$step,step),
								width = width,
								post = ""
		)
	)
  
  return(myOutput)
}

