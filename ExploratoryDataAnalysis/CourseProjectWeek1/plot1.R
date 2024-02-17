library(lubridate)

#import and subsetata
mydata <- read.table("/Users/joshuastein/Desktop/hello-world/ExploratoryDataAnalysis/household_power_consumption.txt", header = TRUE, sep = ";")
mydata$Date <- dmy(mydata$Date)
start_date <- ymd("2007-01-31")
end_date <- ymd("2007-02-03")

my2007data <- subset(mydata, Date >= start_date & Date < end_date)

#plot1
my2007data$Global_active_power <- as.numeric(my2007data$Global_active_power)
hist(my2007data$Global_active_power, col = "red")
