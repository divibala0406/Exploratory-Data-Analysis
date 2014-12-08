#plot3.R
#line plot for sub-metering1, sub-metering2 and sub-metering 3 data of household power consumption for two days, 1st and 2nd of
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

#coercing the sub-metering1 value for two days and storing the 
#value in subMetering1
subMetering1 <- as.numeric(subSetData$Sub_metering_1)

#coercing the sub-metering2 value for two days and storing the 
#value in subMetering2
subMetering2 <- as.numeric(subSetData$Sub_metering_2)

#coercing the sub-metering3 value for two days and storing the 
#value in subMetering3
subMetering3 <- as.numeric(subSetData$Sub_metering_3)

#setting up plot width and height and naming the file
png("plot3.png", width=480, height=480)

#plotting using plot line function for submetering1 and setting up labels
plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")

#adding line segments for submetering2 and setting color as red
lines(datetime, subMetering2, type="l", col="red")

#adding line segments for submetering3 and setting color as blue
lines(datetime, subMetering3, type="l", col="blue")

#adding legends for those three varaibles specifying line types, line widths,
#colors
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

# setting graphic device off or close
dev.off()
