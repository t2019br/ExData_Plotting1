#Exploratory Data  Analysis - Week 1 - Course Project 1

#Setting Working directory
DataDirectory <-"D:/viagem/Pessoal_R/Course 04 - Data Analysis/week_1"
setwd(DataDirectory)

#setting Language to wenglish, for the weekdays on X axis of the plot
Sys.setlocale("LC_TIME", "English")


# LOADING DATA
#Load Dataset - only lines from 2007-02-01 and 2007-02-021'
header<-read.table("./household_power_consumption.txt",sep=";",nrow=1)
power_ds<-read.table("./household_power_consumption.txt",sep=";",skip=grep("1/2/2007", readLines("household_power_consumption.txt")),nrows=(grep("3/2/2007", readLines("household_power_consumption.txt"))-grep("1/2/2007", readLines("household_power_consumption.txt"))-1))
colnames(power_ds) <- unlist(header)

#Converting column to DATE
library(dplyr)
power_ds<-mutate(power_ds,Date=as.Date(Date, format = "%d/%m/%Y")) #Time=strptime(Time, "%H:%M:%S"))
power_ds<-mutate(power_ds,Time=as.POSIXct(paste(Date, Time), format="%Y-%m-%d %H:%M:%S"))

#MAKING PLOT
#open png device
png(filename="plot3.png", width = 480, height = 480, units = "px")
#plot the chart
plot(power_ds$Time,power_ds$Sub_metering_1,ylab="Energy sub metering",type="l",xlab="")
lines(power_ds$Time,power_ds$Sub_metering_2,col="red",ylab="Energy sub metering",type="l")
lines(power_ds$Time,power_ds$Sub_metering_3,col="blue",ylab="Energy sub metering",type="l")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,col=c("black","red","blue"))
#Close device
dev.off()


