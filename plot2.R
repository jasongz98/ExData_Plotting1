## reading data into R
electric_consumption_data <- read.table("./household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?", colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))

## Formatting dates into Date/Time classes and subsetting data
library(datasets)
electric_consumption_data$Date <- as.Date(electric_consumption_data$Date, "%d/%m/%Y")
electric_consumption_data <- subset(electric_consumption_data, Date >= as.Date("2007-2-1") & Date <= as.Date("2007-2-2"))

## Creating a new variable called date_time that combines Date and Time so that the x axis is displayed correctly later on
date_time <- paste(electric_consumption_data$Date, electric_consumption_data$Time)
electric_consumption_data <- cbind(date_time, electric_consumption_data)
electric_consumption_data$date_time <- as.POSIXct(date_time)

## Plotting data
png(file = "plot2.png", height = 480, width = 480)
plot(electric_consumption_data$Global_active_power ~ electric_consumption_data$date_time, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()