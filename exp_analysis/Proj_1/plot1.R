data <- read.table("../../household_power_consumption.txt", header = TRUE, sep=";")
first_idx <- grep("^[1]/[2]/2007", data[,1])
second_idx <- grep("^[2]/[2]/2007", data[,1])
vec <- c(first_idx, second_idx)

my_data <- data[vec,]
row.names(my_data) <- NULL

png(file = "plot1.png")
hist(my_data$Global_active_power,col='#ff2500',xlab='Global Active Power (Kilowatts)',main = "Global Active Power")
dev.off()