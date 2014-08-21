setwd("~/prog/R_proj/exp_analysis/Proj_2/exdata-data-NEI_data/")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
NEI$year <- as.numeric(NEI$year)
NEI <- na.omit(NEI)


n5 <- NEI[NEI$year == "1999", ]
z2 <- NEI[NEI$year == "2002", ]
z5 <- NEI[NEI$year == "2005", ]
z8 <- NEI[NEI$year == "2008", ]

total_emissions <- c(sum(n5$Emissions), sum(z2$Emissions), sum(z5$Emissions), sum(z8$Emissions))
years <- c("1999", "2002", "2005", "2008")

library(lattice)
png("~/prog/R_proj/exp_analysis/Proj_2/exdata-data-NEI_data/plot1.png")

plot(years, total_emissions, xlab="Year", ylab="Total Emissions", xaxt = "n", main = "Total PM2.5 Emissions")
axis(1, at = c(1999, 2002, 2005, 2008), labels = years)
lines(lowess(years, total_emissions), col="blue")

dev.off()