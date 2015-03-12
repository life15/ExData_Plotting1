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
png(filename = "plot2.png")

## plot
plot(data$DateTime, data$Global_active_power, type = "l",xlab = "", ylab = "Global Active Power (kilowatts)")

## close the png file
dev.off()
