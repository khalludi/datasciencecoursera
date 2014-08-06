best <- function(state, outcome) {
  my_state <- ""
  
  ## Read outcome data
  my_data <- read.csv("outcome-of-care-measures.csv")
  
  ## Check that state and outcome are valid
  for (i in levels(my_data[,7])) {
    if (state == i) {
      my_state <- i
    }
  }
  
  if (my_state)
  
  ## Return hospital name in that state with lowest 30-day death
  ## rate
  
}