library(lubridate)

#import and subsetata
mydata <- read.table("/Users/joshuastein/Desktop/hello-world/ExploratoryDataAnalysis/household_power_consumption.txt", header = TRUE, sep = ";")
mydata$Date <- dmy(mydata$Date)
start_date <- ymd("2007-02-01")
end_date <- ymd("2007-02-02")

my2007data <- subset(mydata, Date >= start_date & Date <= end_date)

#set four graphs to one graphing window
par(mfrow = c(2, 2))

#global active power
plot(my2007data$Global_active_power, type = "l", xaxt = "n", xlab = "", ylab ="Global Active Power (kilowatts)")
lines(my2007data$Global_active_power, type = "l", lwd = 2)
axis(side = 1, at = c(1, 1440, 2880), labels = c("Thu", "Fri", "Sat"))

#plot energy sub metering
plot(my2007data$Voltage, type = "l", col = "black", xlab = "datetime", ylab = "Voltage", xaxt = "n")
axis(side = 1, at = c(1, 1440, 2880), labels = c("Thu", "Fri", "Sat"))

# plot 3
plot(my2007data$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering", xaxt = "n")
lines(my2007data$Sub_metering_2, col = "red")
lines(my2007data$Sub_metering_3, col = "blue")
axis(side = 1, at = c(1, 1440, 2880), labels = c("Thu", "Fri", "Sat"))

legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = 1, cex = 0.75)

#plot Global reactive power
plot(my2007data$Global_reactive_power, type = "l", col = "black", xlab = "datetime", ylab = "Global_reactive_power", xaxt = "n")
axis(side = 1, at = c(1, 1440, 2880), labels = c("Thu", "Fri", "Sat"))

