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

