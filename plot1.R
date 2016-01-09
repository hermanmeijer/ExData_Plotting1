## set working directory and read data 
setwd("D:/Data Science Course/Assignments/Irvine")
dat<-read.csv("household_power_consumption.txt", sep=";", na.strings = "?", 
              stringsAsFactors = FALSE)

## restrict dates and format date and time
dat<-dat[dat$Date == "1/2/2007" | dat$Date=="2/2/2007",]
dat$Date <- as.Date(dat$Date , "%d/%m/%Y")
dat$Time <- strptime(dat$Time , "%H:%M:%S")

## make the plot on the png device and close it
png(file="plot1.png")
hist(dat$Global_active_power, main="Global Active Power", col = "red", 
     xlab="Global Active Power (kilowatts)")
dev.off()