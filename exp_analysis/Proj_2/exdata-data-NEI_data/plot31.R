setwd("~/prog/R_proj/exp_analysis/Proj_2/exdata-data-NEI_data/")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
NEI$year <- as.numeric(NEI$year)
##NEI <- na.omit(NEI)

type <- c("POINT", "NONPOINT", "ON-ROAD", "NON-ROAD")
years <- c("1999", "2002", "2005", "2008")
total_emissions <- c()

for (i in type) {
  n5 <- NEI[NEI$year == "1999" & NEI$type == i, ]
  z2 <- NEI[NEI$year == "2002" & NEI$type == i, ]
  z5 <- NEI[NEI$year == "2005" & NEI$type == i, ]
  z8 <- NEI[NEI$year == "2008" & NEI$type == i, ]
  
  emission_type <- c(sum(n5$Emissions), sum(z2$Emissions), sum(z5$Emissions), sum(z8$Emissions))
  total_emissions <- c(total_emissions, emission_type)
}

spec_vec <- c(max(total_emissions), total_emissions[2], total_emissions[3], min(total_emissions))

png("~/prog/R_proj/exp_analysis/Proj_2/exdata-data-NEI_data/plot31.png")

plot(spec_vec ~ years, xaxt = "n", xlab="Year", ylab="Emissions in Tons", type = c("n"), main = "Total PM2.5 Emissions")
axis(1, at = c(1999, 2002, 2005, 2008), labels = years)
lines(total_emissions[1:4] ~ years, col="red")
lines(total_emissions[5:8] ~ years, col="blue")
lines(total_emissions[9:12] ~ years, col="green")
lines(total_emissions[13:16] ~ years, col="yellow")

dev.off()