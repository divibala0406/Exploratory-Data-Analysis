#plot2.R
#line plot for household power consumption for two days, 1st and 2nd of
#Feb 2007
 
dataFile <- "household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

#subsetting data over two days period in Feb 2007
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#using date-time conversion function strptime and converting to day,month,
#year,hour,min and sec
datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

# coerces the object global active power type to numeric
globalActivePower <- as.numeric(subSetData$Global_active_power)

# setting up plot width and height and naming the file
png("plot2.png", width=480, height=480)

#plotting using plot function setting type of plot to "line" and labelling axis

plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")

# setting graphic device off or close
dev.off()
