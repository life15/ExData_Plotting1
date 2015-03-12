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
png(filename = "plot4.png")

## save original mfrow
orginal_mfrow <- par("mfrow")
## change mfrow to 2x2
par(mfrow = c(2,2))

## plot
with(data, {
        ## top left
        plot(DateTime, Global_active_power, type = "l",xlab = "", ylab = "Global Active Power (kilowatts)")
        ## top right
        plot(DateTime, Voltage, type = "l", xlab = "datetimes", ylab = "Voltage")
        ## bottom left
        plot(DateTime, Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
        lines(DateTime, Sub_metering_2, col = "red")
        lines(DateTime, Sub_metering_3, col = "blue")
        legend("topright", lty = "solid", col = c("black", "red", "blue"), 
               legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
        ## bottom right
        plot(DateTime, Global_reactive_power, type = "l", xlab = "datetimes", ylab = "Global_reactive_power")
})

## change the mfrow back to orginal
par(mfrow = orginal_mfrow)

## close the png file
dev.off()