#' Potentially reverse and rescale variables
#'
#' @param var A variable or a selection of variables
#' @param reverse Logical, defaults to FALSE.
#' @param to a vector of integers the variables in var should be rescaled to
#' @examples
#'
#' #Make a data frame
#' df<-data.frame(var1=seq(1,10,1),
#' var2=seq(-1,9,1),
#' var3=seq(10,1,1))
#' #Run the function on one variable
#' revScale(df$var1, reverse=F, to=c(0,1))
#' #Store the rescaled variable back into the data frame
#' var4<-revScale(df$var1, reverse=F, to=c(0,1))
#' head(df)
#' #See how the function handles negative numbers
#' revScale(df$var2)
#' #Run the function on a series of variables
#' library(tidyverse)
#' df %>%
#' select(c(1,3)) %>%
#' mutate(across(everything(), revScale))
#' #Run the function on a series of variables reversing
#' library(tidyverse)
#' df %>%
#' select(c(1,3)) %>%
#' mutate(across(everything(), revScale, reverse=F))
#' #Try a different vector to scale to
#' df %>%
#' select(c(1,3)) %>%
#' mutate(across(everything(), revScale, to=c(-1,1)))
#' Provide a meaningful name to the reversed variable
#' df %>%
#' select(c(1,3)) %>%
#' mutate(across(everything(), revScale, to=c(-1,1)), .names="{.col}_reversed")

#define arguments
revScale<-function(var, reverse=F, to=c(0,1)){
 if(min(var)<= -1) stop("this function cannot handle negative numbers")
   #Under the no reverse condition, just rescale to the values defined in to
  if (reverse==F){
  out<-  scales::rescale(as.numeric(var), to)
  #return out to the parent environment (I think)
  return(out)}
   #Else condition, where we also want to reverse score the variable
  else {
    #This is the reversing formula
  out<- abs(as.numeric(var)-(as.numeric(max(var, na.rm=T))+as.numeric(min(var, na.rm=T))))
  #Now Rescale
  out<-  scales::rescale(as.numeric(out), to)
  return(out)
  }
   }
