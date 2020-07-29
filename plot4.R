#reading file. Only the rows for dates 2007-02-01 and 2007-02-02

data<-read.table("household_power_consumption.txt",skip=66637,nrows=2880,sep = ";",col.names = c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"),na.strings = c("?"))

#merging and converting dates in a new variable

dateAndTime <- data.frame(paste(data$Date,data$Time,sep = " "))
names(dateAndTime)<-c("DateAndTime")
data <- cbind(data,dateAndTime)
data$DateAndTime <- strptime(data$DateAndTime,format = "%d/%m/%Y %H:%M:%S")

png("plot4.png",width = 480,height = 480)

#preparing canvas
par(mfrow = c(2, 2))

with(data,{

  #plot #1
  plot(DateAndTime, Global_active_power, type="l", xlab="", ylab="Global Active Power")

  #plot #2
  plot(DateAndTime, Voltage, type="l", xlab="datetime", ylab="Voltage")

  #plot #3
  plot(DateAndTime, Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
  lines(DateAndTime, Sub_metering_2, type="l", col="red", xlab="", ylab="Energy Submetering")
  lines(DateAndTime, Sub_metering_3, type="l", col="blue", xlab="", ylab="Energy Submetering")

  legend("topright", col = c("black","blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, bty = "n")

  #plot #4
  plot(DateAndTime, Global_reactive_power, type="l", xlab="datetime")
  
})

dev.off()