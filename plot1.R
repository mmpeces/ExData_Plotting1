##exploratory data analysis
##project 1
##plot 1

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
                      sep = ";", stringsAsFactors=FALSE)

data <- subset(alldata, alldata$Date == "1/2/2007" | alldata$Date =="2/2/2007")

png(filename = "plot1.png", width = 480, height = 480)

hist(as.numeric(data$Global_active_power), col = "red", 
     xlab = "Global Active Power (kilowatts)", 
     main = "Global Active Power")


dev.off()

