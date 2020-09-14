## Reading data into R
electric_consumption_data <- read.table("./household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?", colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))

## Formatting dates into Date/Time classes and subsetting data
library(datasets)
electric_consumption_data$Date <- as.Date(electric_consumption_data$Date, "%d/%m/%Y")
electric_consumption_data <- subset(electric_consumption_data, Date >= as.Date("2007-2-1") & Date <= as.Date("2007-2-2"))

## Creating a new variable called date_time that combines Date and Time so that the x axis is displayed correctly later on
date_time <- paste(electric_consumption_data$Date, electric_consumption_data$Time)
electric_consumption_data <- cbind(date_time, electric_consumption_data)
electric_consumption_data$date_time <- as.POSIXct(date_time)

## Plotting the data
png(file = "plot3.png", height = 480, width = 480)
plot(electric_consumption_data$date_time, electric_consumption_data$Sub_metering_1, xlab = '', ylab = 'Energy sub meeting', type = 'l')
lines(electric_consumption_data$date_time, electric_consumption_data$Sub_metering_2, col = "red")
lines(electric_consumption_data$date_time, electric_consumption_data$Sub_metering_3, col = "blue")
legend("topright", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd = 1)
dev.off()