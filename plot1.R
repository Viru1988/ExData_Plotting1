dataset<- read.table("household_power_consumption.txt",header=TRUE,sep=";",stringsAsFactors=FALSE,dec=".")
dataset$Date<-as.Date(dataset$Date,format="%d/%m/%Y")
#TODO USE FILTER TO GET dATE range data
library("dplyr")
fill<-filter(dataset,Date>="2007-02-01" , Date<="2007-02-02")
#combine data and time
subset<- mutate(fill,DateTime = paste(Date,Time,sep= ' '))

#Plot1

library(datasets)
histplot<-hist(as.numeric(subset$Global_active_power), main="Global Active Power", 
                   xlab="Global Active Power (kilowatts)", ylab="Frequency",col="Red")

dev.copy(png,'plot1.png', height=480, width=480)
dev.off()


