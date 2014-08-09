best <- function(state, outcome) {
  my_state <- ""
  rate <- 30.0
  idx <- 1
  h_idx <- c()
  
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
    outcome <- 13
  }
  
  else if (outcome == "heart failure") {
    outcome <- 19
  }
  
  else if (outcome == "pneumonia") {
    outcome <- 25
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
  
  ## Finds lowest rate of death
  outcomeCol <- as.numeric(paste(state_data[,outcome]))
  outcomeCol <- na.omit(outcomeCol)
  for (k in outcomeCol) {
    if (k < rate) {
      rate <- k
      h_idx <- c(h_idx, idx)
    }
    idx <- idx + 1
  }
  
  ## Find and return hospital name
  possible_o <- c()
  for (l in h_idx) {
    possible_o <- c(as.character(paste(state_data[l,2])), possible_o)
  }
  
  possible_o <- sort(possible_o)
  print(possible_o)
  
  return(possible_o[1])
}

