best <- function(state, outcome) {
  my_state <- ""
  
  ## Read outcome data
  my_data <- read.csv("outcome-of-care-measures.csv")
  
  ## Check that state and outcome are valid
  for (i in levels(my_data[,7])) {
    if (state == i) {
      my_state <- i
      break
    }
  }
  
  if (my_state == "") {
    stop("invalid state")
  }
  
  if (outcome != "heart attack" or outcome != "heart failure" or outcome != "pneumonia") {
    stop("invalid outcome")
  }
  
  ## Return hospital name in that state with lowest 30-day death
  ## rate
  
}