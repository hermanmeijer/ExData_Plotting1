## set working directory and read data 
setwd("D:/Data Science Course/Assignments/Irvine")
dat<-read.csv("household_power_consumption.txt", sep=";", na.strings = "?", 
              stringsAsFactors = FALSE)

## restrict dates and format date and time
dat<-dat[dat$Date == "1/2/2007" | dat$Date=="2/2/2007",]
dat$Time <- strptime(paste(dat$Date, dat$Time) , "%d/%m/%Y %H:%M:%S")
dat$Date <- as.Date(dat$Date , "%d/%m/%Y")

## make the plot on the png device and close it
png(file="plot3.png")
plot(dat$Time,dat$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
points(dat$Time,dat$Sub_metering_1,type="l")
points(dat$Time,dat$Sub_metering_2,type="l",col="red")
points(dat$Time,dat$Sub_metering_3,type="l",col="blue")
legend("topright", col=c("black","red","blue"), lwd=1, lty=1, 
       legend=c("Sub_metring_1","Sub_metring_2","Sub_metring_3") )
dev.off()