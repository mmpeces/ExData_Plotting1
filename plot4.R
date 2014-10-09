##exploratory data analysis
##project 1
##plot 4

##setwd("~/R/coursera/exploratory_data_analysis/project_1")


install.packages("data.table")
library(data.table)

##Location to download zip file and getting data
##skip  file download and unzip if data already in working directory

fileurl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
zipfile <-"./exdata-data-household_power_consumption.zip"
download.file(fileurl, zipfile)
zipfile_download_date <- date()
unzip(zipfile, overwrite=TRUE)


## household_power_consumption data needs to be in working directory
alldata <- read.table("./household_power_consumption.txt", header=TRUE, 
                      sep = ";", colClasses=c("character", "character", rep("numeric", 7)), 
                      na.strings="?")

##subset for days wanted
data <- subset(alldata, alldata$Date == "1/2/2007" | alldata$Date =="2/2/2007")

##format date and time ino column for plotting
data$DateTime <- as.POSIXct(paste(data$Date, data$Time, sep=" "), format="%d/%m/%Y %H:%M:%S")

##clean up column names
names(data)<-tolower(gsub("_","",names(data)))

##plot data

png(filename = "plot4.png", width = 480, height = 480)

par(mfcol=c(2,2))

##plot 1
plot(data$datetime, data$globalactivepower, type="l", col="black", 
     xlab="", ylab="Global Active Power", main="")

##plot 2
plot(data$datetime, data$submetering1, type="l", 
     col= "black" ,xlab="",ylab="Energy sub metering")
lines(data$datetime, data$submetering2, type="l", col= "red")
lines(data$datetime, data$submetering3, type="l", col= "blue")

##legend
legend("topright",legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
                           col=c("black", "red", "blue"), lty = "solid", 
       box.col="transparent", inset = .01)

##plot 3
plot(data$datetime, data$voltage, type="l", col="black", 
     xlab="datetime", ylab="Voltage", main="")


##plot 4
plot(data$datetime, data$globalreactivepower, type="l", col="black", 
     xlab="datetime", ylab="Global_reactive_power", main="")

##save png

dev.off()



