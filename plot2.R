#reading file. Only the rows for dates 2007-02-01 and 2007-02-02

data<-read.table("household_power_consumption.txt",skip=66637,nrows=2880,sep = ";",col.names = c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"),na.strings = c("?"))

#merging and converting dates in a new variable

dateAndTime <- data.frame(paste(data$Date,data$Time,sep = " "))
names(dateAndTime)<-c("DateAndTime")
data <- cbind(data,dateAndTime)
data$DateAndTime <- strptime(data$DateAndTime,format = "%d/%m/%Y %H:%M:%S")

#plotting
png("plot2.png")
plot(data$DateAndTime, data$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()



