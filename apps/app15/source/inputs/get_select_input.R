# Create a select input

getSelectInput <- function(inputID, inputConf, placement="top", trigger="hover", multiple=FALSE, selectize=TRUE) 
{    
  
  if(inputConf$infoTxt != ""){
  	mylabel  <- c(inputConf$label,getIcon(inputConf$infoTxt, placement, trigger))
  }else{
    mylabel <- inputConf$label
  }
	
	myOutput <-  span(
		selectInput(inputID, 
								mylabel, 
								inputConf$value, multiple=multiple, selectize=selectize, selected = inputConf$value[1])
	)
	
	return(myOutput)
}

