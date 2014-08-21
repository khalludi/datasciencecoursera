setwd("~/prog/R_proj/exp_analysis/Proj_2/exdata-data-NEI_data/")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
NEI$year <- as.numeric(NEI$year)
##NEI <- na.omit(NEI)

idx <- grep("[Cc]oal", SCC[,3])
scc <- SCC[idx, ]
scc <- subset(scc, select = SCC)
row.names(scc) <- NULL
scc <- as.numeric(paste(scc[,1]))
sub <- NEI[,2]

my_data <- c()
for (i in scc) {
  my_data <- c(my_data, grep(paste(c("(", as.character(i), ")"), collapse = ""), sub))
}

my_data <- NEI[my_data,]

n9 <- my_data[my_data$year == "1999", ]
z2 <- my_data[my_data$year == "2002", ]
z5 <- my_data[my_data$year == "2005", ]
z8 <- my_data[my_data$year == "2008", ]

total_emissions <- c(sum(n9$Emissions), sum(z2$Emissions), sum(z5$Emissions), sum(z8$Emissions))

my_data <- data.frame(total_emissions)
my_data[,2] <- c(1999, 2002, 2005, 2008)
colnames(my_data) <- c("emission", "year")

png("~/prog/R_proj/exp_analysis/Proj_2/exdata-data-NEI_data/plot4.png")

par(pch=22)
plot(my_data$year, my_data$emission, xlab="Year", ylab="Total Emissions", xaxt = "n", main = "Total Emissions from Coal")
axis(1, at = c(1999, 2002, 2005, 2008), labels = c("1999", "2002", "2005", "2008"))
lines(lowess(my_data$year, my_data$emission), col="red", lwd = 2)

dev.off()