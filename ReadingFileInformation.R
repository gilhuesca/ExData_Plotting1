#reading file. Only the rows for dates 2007-02-01 and 2007-02-02

data<-read.table("household_power_consumption.txt",skip=66637,nrows=2880,sep = ";",col.names = c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"))
head(data)
tail(data)

#You may find it useful to convert the Date and Time variables to Date/Time classes in R using the \color{red}{\verb|strptime()|}strptime()  and \color{red}{\verb|as.Date()|}as.Date() functions.

#converting dates
data$Date<- as.Date(data$Date,format="%d/%m/%Y")

#converting times.
#It keeps the current date
#see if that's a problem
data$Time<- strptime(data$Time,format = "%H:%M:%S")
