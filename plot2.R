# Martin Nossett
# Exploratory Data Analysis Course Project 1

## DOWNLOAD AND SAVE RAW DATA TO "raw_data" FOLDER
zipurl = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(zipurl, destfile="./raw_data/ExData.zip", mode="wb")
unzip(zipfile = "./raw_data/ExData.zip", exdir = "./raw_data/")

          #  read file for data set
setwd("./raw_data")
RawData <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?", 
                      stringsAsFactors = FALSE)
dim(RawData)   # 2,075,259 rows x 9 columns

          #  subset to only show data between dates 2007-02-01 and 2007-02-02
ExData <- RawData %>% mutate(Time = strptime(paste(Date, " " ,Time), "%d/%m/%Y %H:%M:%S")) %>% 
        mutate(Date = as.Date(Date, "%d/%m/%Y")) %>% 
        filter(Date >= "2007-02-01" & Date <= "2007-02-02")



##  CREATE PLOT 2
setwd("C:/Users/rattl/Documents/RStudio_files/datasciencecoursera/ExData_Plotting1")
png(filename = "./plot2.png")
plot(ExData$Global_active_power, type="n", xlab="", xaxt = "n",
     ylab= "Gloabal Active Power (kilowatts)")
axis(1, at=c(0, 1441, 2880), labels = c("Thu", "Fri", "Sat"))
lines(x=c(1:2880), y=ExData$Global_active_power)
dev.off()

# plot creates the graph area with y-axis and y-axis label
# axis creates a customized x-axis
# lines draws the lineplot of the data

# Thank you to Ekkalak Thongthanomkul for the hint about the axis command in the discussion board
