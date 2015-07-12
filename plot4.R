dataset<- read.table("household_power_consumption.txt",header=TRUE,sep=";",stringsAsFactors=FALSE,dec=".")
dataset$Date<-as.Date(dataset$Date,format="%d/%m/%Y")
#TODO USE FILTER TO GET dATE range data
library("dplyr")
periodicdata<-filter(dataset,Date>="2007-02-01" , Date<="2007-02-02")
#combine data and time
subset<- mutate(periodicdata,DateTime = paste(Date,Time,sep= ' '))

library(datasets)

subset$DateTime <- as.POSIXct(subset$DateTime)
#getting meter record
subm1<-as.numeric(subset$Sub_metering_1)
subm2<-as.numeric(subset$Sub_metering_2)
subm3<-as.numeric(subset$Sub_metering_3)
#ploting records
png("plot4.png", width=480, height=480)
oldpar<-par(mfrow=c(2,2))
#1st plot
plot(subset$Global_active_power~subset$DateTime, type="l",
     ylab="Global Active Power", xlab="")
#2nd plot 
plot(as.numeric(subset$Voltage)~subset$DateTime,type="l",ylab="Voltage",xlab="datetime")
#3rd plot
plot(subm1~subset$DateTime, type="l",ylab="Energy sub metering", xlab="")
lines(subm2~subset$DateTime,type="l",col="red")
lines(subm3~subset$DateTime,type="l",col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),bty="n", lty="solid",cex=0.90 ,col=c("black", "red", "blue"))
#4th plot
plot(as.numeric(subset$Global_reactive_power)~subset$DateTime,type="l",ylab="Global_reactive_power",xlab="datetime")
par(oldpar)

dev.off()

