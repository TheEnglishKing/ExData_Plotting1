library(lubridate)

#import and subsetata
mydata <- read.table("/Users/joshuastein/Desktop/hello-world/ExploratoryDataAnalysis/household_power_consumption.txt", header = TRUE, sep = ";")
mydata$Date <- dmy(mydata$Date)
start_date <- ymd("2007-02-01")
end_date <- ymd("2007-02-02")

my2007data <- subset(mydata, Date >= start_date & Date <= end_date)

# plot 2
plot(my2007data$Global_active_power, type = "l", xaxt = "n", )
lines(my2007data$Global_active_power, type = "l", lwd = 2)
axis(side = 1, at = c(1, 1440, 2880), labels = c("Thu", "Fri", "Sat"))
