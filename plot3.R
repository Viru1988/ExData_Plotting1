dataset<- read.table("household_power_consumption.txt",header=TRUE,sep=";",stringsAsFactors=FALSE,dec=".")
dataset$Date<-as.Date(dataset$Date,format="%d/%m/%Y")
#TODO USE FILTER TO GET dATE range data
library("dplyr")
fill<-filter(dataset,Date>="2007-02-01" , Date<="2007-02-02")
#combine data and time
subset<- mutate(fill,DateTime = paste(Date,Time,sep= ' '))
#Plot3

library(datasets)

subset$DateTime <- as.POSIXct(subset$DateTime)
#getting meter record
subm1<-as.numeric(subset$Sub_metering_1)
subm2<-as.numeric(subset$Sub_metering_2)
subm3<-as.numeric(subset$Sub_metering_3)
#ploting records
plot(subm1~subset$DateTime, type="l",ylab="Energy sub metering", xlab="")
lines(subm2~subset$DateTime,type="l",col="red")
lines(subm3~subset$DateTime,type="l",col="blue")
#showing the legends on topright.
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty="solid" ,lwd=2,cex=0.5,col=c("black", "red", "blue"))
dev.copy(png,'plot3.png', height=480, width=480)
dev.off()




