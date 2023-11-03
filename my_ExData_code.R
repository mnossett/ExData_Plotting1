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
fix_date <- mutate(RawData, Date = strptime(RawData$Date, format="%d/%m/%Y", tz=""))
fix_date2 <- subset(fix_date, Date >= '2007-02-01' & Date <= '2007-02-02')
dim(fix_date2)     # 2,880 rows  x 9 columns

#  merge date and time columns & reorganize data table
fix_date2$DateTime <- paste(fix_date2$Date, fix_date2$Time, sep=" ")
ExData <- mutate(fix_date2, DateTime = strptime(fix_date2$DateTime, format="%Y-%m-%d %H:%M:%S", 
          tz=""))
ExData <- mutate(ExData, Day = weekdays(DateTime, abbreviate = TRUE))
ExData <- ExData %>% select(DateTime, Day, Global_active_power:Sub_metering_3)
          # removed old Date and Time columns and moved the created DateTime column to the front

#  save subsetted data as a text file
setwd("C:/Users/rattl/Documents/RStudio_files/datasciencecoursera/ExData_Plotting1")
write.table(ExData, "./ExData.txt")