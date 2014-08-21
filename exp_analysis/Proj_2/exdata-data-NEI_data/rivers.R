setwd("~/prog/R_proj/exp_analysis/Proj_2/exdata-data-NEI_data/")
library(datasets)
data1 <- rivers[1:20]
data2 <- rivers[21:40]
data3 <- rivers[41:60]

par(bg="black", col.lab = "white", col.axis="white", col.main="white", lty = 5, fg="white", lwd = 2)

plot(x=seq(1, 20, 1), y = data1, main = "Sample River Lengths",
     col="blue", pch=20, xlab="River ID", ylab="River Length (Miles)")
points(data2, pch=20, col="red")
points(data3, pch=20, col="purple")
#text(col = "white")
#axis(1, at=c(.5, seq(5, 20, 5)), col="white", col.ticks="white", labels = c("0","5", "10", "15", "20"))
#axis(2, col="white", col.ticks="white")

legend(10,1490,cex=0.8, col=c("blue", "red", "purple"),
       pch=20, title="River Length/mile", 
       legend=c("rivers 00 - 20", "rivers 21 - 40", "rivers 41 - 60"), 
       bg="black", box.lty=3, bty="n", title.col="white", text.col = "white", border = "black",
       title.adj = 0)
