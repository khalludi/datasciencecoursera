setwd("~/prog/R_proj/exp_analysis/Proj_2/exdata-data-NEI_data/")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
NEI$year <- factor(NEI$year)
##NEI <- na.omit(NEI)

type <- c("POINT", "NONPOINT", "ON-ROAD", "NON-ROAD")
years <- c("1999", "2002", "2005", "2008")
total_emissions <- c()

balt_city <- NEI[NEI$fips == "24510", ]

for (i in type) {
  n5 <- balt_city[balt_city$year == "1999" & balt_city$type == i, ]
  z2 <- balt_city[balt_city$year == "2002" & balt_city$type == i, ]
  z5 <- balt_city[balt_city$year == "2005" & balt_city$type == i, ]
  z8 <- balt_city[balt_city$year == "2008" & balt_city$type == i, ]
  
  emission_type <- c(sum(n5$Emissions), sum(z2$Emissions), sum(z5$Emissions), sum(z8$Emissions))
  total_emissions <- c(total_emissions, emission_type)
}

my_data <- data.frame(total_emissions)
my_data[,2] <- c(rep("POINT", 4), rep("NONPOINT", 4), rep("ON-ROAD", 4), rep("NON-ROAD", 4))
my_data[,3] <- c(rep(c(1999, 2002, 2005, 2008), 4))
colnames(my_data) <- c("Emissions", "type", "year")



library(ggplot2)
png("~/prog/R_proj/exp_analysis/Proj_2/exdata-data-NEI_data/plot3.png")

ggplot(data = my_data, aes(x = factor(year), y = Emissions, group = type, colour = type)) + geom_line() + 
  geom_point(size=3, fill="white") + 
  ggtitle("PM2.5 Emissions In Baltimore City") + 
  xlab("Sample Years") + ylab("Emissions in Tons") + 
  scale_colour_hue(name="Type")

dev.off()