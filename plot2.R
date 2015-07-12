dataset<- read.table("household_power_consumption.txt",header=TRUE,sep=";",stringsAsFactors=FALSE,dec=".")
dataset$Date<-as.Date(dataset$Date,format="%d/%m/%Y")
#TODO USE FILTER TO GET dATE range data
library("dplyr")
fill<-filter(dataset,Date>="2007-02-01" , Date<="2007-02-02")
#combine data and time
subset<- mutate(fill,DateTime = paste(Date,Time,sep= ' '))
#Plot2

library(datasets)

subset$DateTime <- as.POSIXct(subset$DateTime)
plot(subset$Global_active_power~subset$DateTime, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")
dev.copy(png,'plot2.png', height=480, width=480)
dev.off()

