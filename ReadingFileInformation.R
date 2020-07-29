#reading file. Only the rows for dates 2007-02-01 and 2007-02-02

data<-read.table("household_power_consumption.txt",skip=66637,nrows=2880)
head(data)
tail(data)