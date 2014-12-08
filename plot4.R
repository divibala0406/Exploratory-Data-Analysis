#plot4.R
# Four line plot diagrams for Global Active power, Energy sub metering,
# Global reactive power variables over two days in Feb' 2007

dataFile <- "household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

#subsetting data over two days period in Feb 2007
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#using date-time conversion function strptime and converting to day,month,
#year,hour,min and sec
datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

#coerces the object global active power type to numeric
globalActivePower <- as.numeric(subSetData$Global_active_power)

# coerces the object global reactive power type to numeric
globalReactivePower <- as.numeric(subSetData$Global_reactive_power)

# coerces the object voltage type to numeric
voltage <- as.numeric(subSetData$Voltage)

# coerces the object Sub_metering_1 type to numeric
subMetering1 <- as.numeric(subSetData$Sub_metering_1)

# coerces the object Sub_metering_2 type to numeric
subMetering2 <- as.numeric(subSetData$Sub_metering_2)

# coerces the object Sub_metering_3 type to numeric
subMetering3 <- as.numeric(subSetData$Sub_metering_3)

#setting up plot width and height and naming the file
png("plot4.png", width=480, height=480)

#setting graphical parameter for the plot
par(mfrow = c(2, 2))

#plotting using plot line function for Global active power setting up labels and numerical
# value for mganification from the default value for symbol 
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)

#plotting using plot line function for voltage setting up labels
plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")

#plotting using plot line function for submetering1 setting up labels
plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")

#adding line segment for sub metering2 and setting up color to red
lines(datetime, subMetering2, type="l", col="red")

#adding line segment for sub metering3 and setting up color to blue
lines(datetime, subMetering3, type="l", col="blue")

#adding legends at topright for all three submetering objects and line type to default, line
#width and colors to three different colors
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

#plotting datetime in xaxis and global reactive power in yaxis and adding respective labels
plot(datetime, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")

#setting graphic device off or close
<<<<<<< HEAD
dev.off()
=======
dev.off()
>>>>>>> 3d8a3b8266bb7d7377036211c6a5ee8908af4731
