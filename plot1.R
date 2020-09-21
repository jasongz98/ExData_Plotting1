## reading data into R
electric_consumption_data <- read.table("./household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?", colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))

## Formatting dates into Date/Time classes and subsetting data
library(datasets)
electric_consumption_data$Date <- as.Date(electric_consumption_data$Date, "%d/%m/%Y")
electric_consumption_data <- subset(electric_consumption_data, Date >= as.Date("2007-2-1") & Date <= as.Date("2007-2-2"))

## Creating plot 1
png(file = "plot1.png", height = 480, width = 480)
hist(electric_consumption_data$Global_active_power, main = "Global Active Power", col = "red", xlab = "Global Active Power (kilowatts)")
dev.off()