best <- function(state, outcome) {
  my_state <- ""
  rate <- 30.0
  
  ## Read outcome data
  my_data <- read.csv("outcome-of-care-measures.csv")
  
  ## Check that state is valid
  for (i in levels(my_data[,7])) {
    if (state == i) {
      my_state <- i
      break
    }
  }
  
  if (my_state == "") {
    stop("invalid state")
  }
  
  ## Check that outcome is valid
  if (outcome == "heart attack") {
    outcome <- 11
  }
  
  else if (outcome == "heart failure") {
    outcome <- 17
  }
  
  else if (outcome == "pneumonia") {
    outcome <- 23
  }
  
  else {
    stop("invalid outcome")
  }
  
  ## Return hospital name in that state with lowest 30-day death
  ## rate
  state_data <- subset(my_data, State == my_state)
  if (as.numeric(nrow(state_data)) == 0) {
    return(0)
  }
  else {
    for (j in 1:nrow(state_data)) {
      if (as.numeric(levels(state_data[2, 11]) < rate) {
        rate <- state_data[j,outcome]
      }
    }
  }
  
  return(rate)
}