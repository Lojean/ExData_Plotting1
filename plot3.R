#Author: Gelonia Dent
#Exploratory Data- Project 1
# plot3.R 
#This code will produce a frequency histogram for the sub energy data metring during the two-day
# period 2007-01-01 and 2001-02-01. 
# The output will be a PNG file named "plot3.png" and will have reading from 3 meters. 

# Set the working directory where data file and output files are stored. 

setwd("~/Desktop/Coursera_R/ExData_Plotting1")
file=paste(getwd(),"/household_power_consumption.txt",sep="")


# Load the data into variable "power" for the date range February 1,2007 to February 2, 2007

power<-read.table(file,header=TRUE,sep=";",stringsAsFactors=FALSE,na.strings="?")
power<-power[power$Date %in% c("1/2/2007", "2/2/2007"),]
power$Date <-strptime(power$Date, "%a %b %d")

#Plot the Global Active Power vs. time in days:
day.name<-c("Sun", "Mon", "Tues", "Wed", "Thu", "Fri","Sat")
day<-c("Thu", "Fri","Sat")
plot(power$Sub_metering_1,type="l",ylab="Energy sub metering",xaxt="n",xlab=" ")
#axis(1,at=NULL, xaxt=day)
plot(power$Sub_metering_2,type="l",ylab="Energy sub metering",xaxt="n",xlab=" ")
#axis(1,at=NULL, xaxt=day)
plot(power$Sub_metering_3,type="l",ylab="Energy sub metering",xaxt="n",xlab=" ")
#axis(1,at=NULL, xaxt=day)
plot(power$Sub_metering_1,power$Sub_metering_2,power$Sub_metering_3, type="l",ylab="Energy sub metering",xaxt="n",xlab=" ")


fname2<-paste(getwd(),"/plot3.png",sep="")
png(filename = "plot3.png",
    width = 480, height = 480, units = "px", pointsize = 12,
    bg = "white")
plot(power$Sub_metering_1,power$Sub_metering_2,power$Sub_metering_3, type="l",ylab="Energy sub metering",xaxt="n",xlab=" ")
axis(1,at=NULL, xaxt=day)

dev.off()
