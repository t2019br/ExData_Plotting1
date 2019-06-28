#Exploratory Data  Analysis - Week 1 - Course Project 1

#Setting Working directory
DataDirectory <-"D:/viagem/Pessoal_R/Course 04 - Data Analysis/week_1"
setwd(DataDirectory)


# LOADING DATA
#Load Dataset - only lines from 2007-02-01 and 2007-02-021'
header<-read.table("./household_power_consumption.txt",sep=";",nrow=1)
power_ds<-read.table("./household_power_consumption.txt",sep=";",skip=grep("1/2/2007", readLines("household_power_consumption.txt")),nrows=(grep("3/2/2007", readLines("household_power_consumption.txt"))-grep("1/2/2007", readLines("household_power_consumption.txt"))-1))
colnames(power_ds) <- unlist(header)

#Converting column to DATE
library(dplyr)
power_ds<-mutate(power_ds,Date=as.Date(Date, format = "%d/%m/%Y")) #Time=strptime(Time, "%H:%M:%S"))

#MAKING PLOT
#open png device
png(filename="plot1.png", width = 480, height = 480, units = "px")
hist(power_ds$Global_active_power,main="Global Active Power",col="red",xlab="Global Active Power (kilowatts)")
dev.off()


