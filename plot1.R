# Martin Nossett
# Exploratory Data Analysis Course Project 1

## DOWNLOAD AND SAVE RAW DATA TO "raw_data" FOLDER
zipurl = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(zipurl, destfile="./raw_data/ExData.zip", mode="wb")
unzip(zipfile = "./raw_data/ExData.zip", exdir = "./raw_data/")

          #  read file for data set
setwd("./raw_data")
RawData <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")
dim(RawData)   # 2,075,259 rows x 9 columns

          #  subset to only show data between dates 2007-02-01 and 2007-02-02
ExData <- subset(RawData, RawData$Date == "1/2/2007" | RawData$Date == "2/2/2007")


## CREATE PLOT 1
png(filename = "./plot1.png")
hist(ExData$Global_active_power, col= "red", main= "Global Active Power", 
     xlab= "Global Active Power (kilowatts)", xaxp= c(0, 6, 3),
     ylab= "Frequency", ylim= c(0, 1200))
dev.off()

# hist creates histogram
# col = color
# main = Title of Graph
# xlab = label for x-axis
# xaxp =  modifies x-axis tick marks.  3 arguments are location of first tick mark, 
          # location of last tick mark, and total tick marks after the first.
# ylab = label for y-axis
# ylim = sets range of y-axis values

