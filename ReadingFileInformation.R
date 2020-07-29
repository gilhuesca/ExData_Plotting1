#reading file. Only the rows for dates 2007-02-01 and 2007-02-02

data<-read.table("household_power_consumption.txt",skip=66637,nrows=2880,sep = ";",col.names = c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"))
head(data)
tail(data)



