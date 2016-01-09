## set working directory and read data 
setwd("D:/Data Science Course/Assignments/Irvine")
dat<-read.csv("household_power_consumption.txt", sep=";", na.strings = "?", 
              stringsAsFactors = FALSE)

## restrict dates and format date and time
dat<-dat[dat$Date == "1/2/2007" | dat$Date=="2/2/2007",]
dat$Time <- strptime(paste(dat$Date, dat$Time) , "%d/%m/%Y %H:%M:%S")
dat$Date <- as.Date(dat$Date , "%d/%m/%Y")

png(file="plot4.png")
par(mfrow=c(2,2))
with(dat,{
  plot(Time, Global_active_power, type="l", 
       ylab="Global Active Power", xlab="")
  
  plot(Time, Voltage, type="l", xlab="datetime") 
  
  plot(Time,Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
  points(Time,Sub_metering_1,type="l")
  points(Time,Sub_metering_2,type="l",col="red")
  points(Time,Sub_metering_3,type="l",col="blue")
  legend("topright", col=c("black","red","blue"), lwd=1, lty=1, 
         legend=c("Sub_metring_1","Sub_metring_2","Sub_metring_3"), bty="n" )
  
  plot(Time, Global_reactive_power, type="l", xlab="datetime") 
  
})
dev.off()