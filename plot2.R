##  CREATE PLOT 2
png(filename = "./plot2.png")
plot(ExData$DateTime, ExData$Global_active_power, type="n", xlab="", 
     ylab= "Gloabal Active Power (kilowatts)")
lines(x=ExData$DateTime, y=ExData$Global_active_power)
dev.off()

# plot creates the graph area with axes and axis labels
# lines draws the lineplot of the data