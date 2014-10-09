##exploratory data analysis
##project 1
##plot 2

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
png(filename = "plot2.png", width = 480, height = 480)

plot(data$datetime, data$globalactivepower, type="l", col="black", 
     xlab="", ylab="Global Active Power (kilowatts)", main="")

##save png

dev.off()




