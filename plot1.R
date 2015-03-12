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
png(filename = "plot1.png")
## plot
hist(data$Global_active_power,freq = TRUE, col = "red", 
     main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
## close the png file
dev.off()