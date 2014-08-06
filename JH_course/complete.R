complete <- function(directory, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return a data frame of the form:
  ## id nobs
  ## 1  117
  ## 2  1041
  ## ...
  ## where 'id' is the monitor ID number and 'nobs' is the
  ## number of complete cases
  
  add <- ""
  nobs <- 0
  idx <- 1
  id_vec <- c()
  
  for (i in 1:length(id)) {
    id_vec <- c(id_vec, id[i] )
  }
  my_table <- data.frame(id = id_vec, nobs = NA)
  
  for(i in 1:length(id)) {
    if (id[i] < 10) {
      add <- "00"
    } else if (id[i] < 100) {
      add <- "0"
    } else {
      add <- ""
    }
    
    path <- paste(directory, "/", add, id[i], ".csv", sep="")
    my_data <- read.csv(path)
    new_data <- na.omit(my_data)
    nobs <- nrow(new_data)
    
    my_table[idx, 2] <- nobs
    
    idx <- idx + 1
  }
  return(my_table)
}

complete("specdata", 31:5)
complete("specdata", 1)
complete("specdata", c(2, 4, 8, 10, 12))
complete("specdata", 30:25)
complete("specdata", 3)