setwd("~/prog/R_proj/exp_analysis/Proj_2/exdata-data-NEI_data/")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
NEI$year <- as.numeric(NEI$year)
NEI <- na.omit(NEI)

idx <- grep("([Vv]eh)|([Mm]otor)", SCC[,3])
scc <- SCC[idx, ]
scc <- subset(scc, select = SCC)
row.names(scc) <- NULL
scc <- as.numeric(paste(scc[,1]))
scc <- na.omit(scc)
sub <- NEI[,2]

my_data <- c()
for (i in scc) {
  my_data <- c(my_data, grep(paste(c("(", as.character(i), ")"), collapse = ""), sub))
  print(my_data)
}

dat <- my_data
dat <- NEI[dat,]
dat1 <- subset(dat, dat$fips == "24510")
dat2 <- subset(dat, dat$fips == "06037")

n91 <- dat1[dat1$year == "1999", ]
z21 <- dat1[dat1$year == "2002", ]
z51 <- dat1[dat1$year == "2005", ]
z81 <- dat1[dat1$year== "2008", ]

total_emissions1 <- c(sum(n91$Emissions), sum(z21$Emissions), sum(z51$Emissions), sum(z81$Emissions))

dat1 <- data.frame(total_emissions1)
dat1[,2] <- c(1999, 2002, 2005, 2008)
colnames(dat1) <- c("emission", "year")

n92 <- dat2[dat2$year == "1999", ]
z22 <- dat2[dat2$year == "2002", ]
z52 <- dat2[dat2$year == "2005", ]
z82 <- dat2[dat2$year== "2008", ]

total_emissions2 <- c(sum(n92$Emissions), sum(z22$Emissions), sum(z52$Emissions), sum(z82$Emissions))

dat2 <- data.frame(total_emissions2)
dat2[,2] <- c(1999, 2002, 2005, 2008)
colnames(dat2) <- c("emission", "year")

spec_vec <- c(min(dat1$emission), 0, 0, max(dat2$emission))

png("~/prog/R_proj/exp_analysis/Proj_2/exdata-data-NEI_data/plot6.png")

par(pch=22, fg="black", bg="white")
plot(dat1$year, spec_vec, xlab="Year", ylab="Total Emissions", main = "Emissions from Vehicles", 
     xaxt="n", type = "n")
points(dat1$year, dat1$emission)
points(dat2$year, dat2$emission)
axis(1, at = c(1999, 2002, 2005, 2008), labels = c("1999", "2002", "2005", "2008"))
lines(lowess(dat1$year, dat1$emission), col="red", lwd = 2)
lines(lowess(dat2$year, dat2$emission), col="blue", lwd = 2)

legend(2001.5,4100,cex=1.2, col=c("red", "blue"),
       pch=20, title="Sample City/County", 
       legend=c("Baltimore City", "Los Angeles County"), 
       box.lty=3, bty="o", title.col="black", text.col = "black", border = "black",
       title.adj = 0.5)

dev.off()