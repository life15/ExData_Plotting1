## Specify data set path
file <- "./household_power_consumption.txt" 
## read in data set
data <- read.table(file, header = TRUE, sep = ";", stringsAsFactors = FALSE, na.strings = "?", 
                   colClasses = c(rep("character", 2), rep("numeric", 7)))
## subset data
data <- data[(data$Date == "1/2/2007" | data$Date == "2/2/2007"),]
## transform data$Date and data$Time into R Date data type
data$DateTime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")

## save plot to png file
png(filename = "plot3.png")

## plot
plot(data$DateTime, data$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
## add line of Sub_metering_2
lines(data$DateTime, data$Sub_metering_2, col = "red")
## add line of Sub_metering_3
lines(data$DateTime, data$Sub_metering_3, col = "blue")
## add legends
legend("topright", lty = "solid", col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
## close the png file
dev.off()