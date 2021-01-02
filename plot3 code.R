
data <- read.table(file = "household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", colClasses = c('character', 'character', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric'))
date <- as.Date(data$Date, "%d/%m/%Y")
data$Date <- as.Date(data$Date, "%d/%m/%Y")
twodays <- data[data$Date >= "2007-02-01" & data$Date <= "2007-02-02",]
twodays <- twodays[complete.cases(twodays),]
dateandtime <- paste(twodays$Date, twodays$Time)
twodays <- cbind(dateandtime, twodays)
twodays$dateandtime <- as.POSIXct(dateandtime)
png(filename = "plot3.png", width = 480, height = 480)
with(twodays, {
    plot(Sub_metering_1 ~ dateandtime, type = "l", xlab = "", ylab = "Energy sub metering", col = 'black')
    lines(Sub_metering_2 ~ dateandtime, col = 'red')
    lines(Sub_metering_3 ~ dateandtime, col = 'blue')
})
legend("topright", col = c("black", "red", "blue"), lwd = c(1,1,1), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
while (!is.null(dev.list()))
    dev.off()