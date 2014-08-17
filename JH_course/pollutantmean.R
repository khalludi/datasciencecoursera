

pollutantmean <- function(directory, pollutant, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'pollutant' is a character vector of length 1 indicating
  ## the name of the pollutant for which we will calculate the
  ## mean; either "sulfate" or "nitrate". 
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return the mean of the pollutant across all monitors list
  ## in the 'id' vector (ignoring NA values)
  
  add <- ""
  totalvec <- 0.000
  
  if (pollutant == "sulfate") {
    pollutant <- 2
  }
  else if (pollutant == "nitrate") {
    pollutant <- 3
  }
  
  for(i in 1:length(id)) {
    if (id[i] < 10) {
      add <- "00"
    } else if (id[i] < 100) {
      add <- "0"
    } else {
      add <- ""
    }
    
    path <- paste(directory, "/", add, id[i], ".csv",sep="")
    mydata<-read.csv(path)
    new_data <- na.omit(mydata)
    
    print(nrow(new_data))
    
    totalvec <- c(new_data[,pollutant], totalvec)
    
    i<-i+1
  }
  
  return(round(mean(totalvec), 3))
}

#pollutantmean("specdata", "sulfate", 1:10)
#pollutantmean("specdata", "nitrate", 70:72)
pollutantmean("specdata", "sulfate", 1)
