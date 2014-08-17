data <- read.table("../../household_power_consumption.txt", header = TRUE, sep=";")
first_idx <- grep("^[1]/[2]/2007", data[,1])
second_idx <- grep("^[2]/[2]/2007", data[,1])
vec <- c(first_idx, second_idx)
my_data <- data[vec,]
row.names(my_data) <- NULL
my_data$Time <- strptime( my_data$Time, format = "%H:%M:%S" )
my_data$Date <- as.Date(as.character(my_data$Date), format = "%d/%m/%Y")
my_data$Global_active_power <- as.numeric(paste(my_data$Global_active_power))

png(file = "~/prog/R_proj/exp_analysis/Proj_1/plot2.png")
plot(my_data$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="", xaxt = "n")
axis(1, at=c(0,1440,2880), labels=c("Thu","Fri","Sat"))
dev.off()