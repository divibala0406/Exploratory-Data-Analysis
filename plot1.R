#plot1.R
#histogram plot for household power consumption for two days, 1st and 2nd of
#Feb 2007
data <- "household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

#subsetting data over two days period in Feb 2007
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
globalActivePower <- as.numeric(subSetData$Global_active_power)

# setting up plot width and height and naming the file
png("plot1.png", width=480, height=480)

# plotting histogram named GlobalnActive Power labelling x axis and setting color
# as red 
hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

# setting graphic device off or close
dev.off()
