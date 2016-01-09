## set working directory and read data 
setwd("D:/Data Science Course/Assignments/Irvine")
dat<-read.csv("household_power_consumption.txt", sep=";", na.strings = "?", 
              stringsAsFactors = FALSE)

## restrict dates and format date and time
dat<-dat[dat$Date == "1/2/2007" | dat$Date=="2/2/2007",]
dat$Time <- strptime(paste(dat$Date, dat$Time) , "%d/%m/%Y %H:%M:%S")
dat$Date <- as.Date(dat$Date , "%d/%m/%Y")

## make the plot on the png device and close it
png(file="plot2.png")
plot(dat$Time, dat$Global_active_power, type="l", 
     ylab="Global Active Power (kilowatts)", xlab="")
dev.off()