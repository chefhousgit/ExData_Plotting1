
data <- read.table(file = "household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", colClasses = c('character', 'character', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric'))
date <- as.Date(data$Date, "%d/%m/%Y")
data$Date <- as.Date(data$Date, "%d/%m/%Y")
twodays <- data[data$Date >= "2007-02-01" & data$Date <= "2007-02-02",]
twodays <- twodays[complete.cases(twodays),]
dateandtime <- paste(twodays$Date, twodays$Time)
twodays <- cbind(dateandtime, twodays)
twodays$dateandtime <- as.POSIXct(dateandtime)
png(filename = "plot4.png", width = 480, height = 480)
par(mfrow=c(2,2), mar = c(4,4,2,1), oma = c(0,0,2,0))
with(twodays, {
    plot(Global_active_power~dateandtime, type = "l", xlab = "", ylab = "Global Active Power")
    plot(Voltage~dateandtime, type = "l", xlab = "datetime", ylab = "Voltage")

    plot(Sub_metering_1 ~ dateandtime, type = "l", xlab = "", ylab = "Energy sub metering", col = 'black')
    lines(Sub_metering_2 ~ dateandtime, col = 'red')
    lines(Sub_metering_3 ~ dateandtime, col = 'blue')
    legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 1, bty = "n", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    plot(Global_reactive_power ~ dateandtime, type = "l", xlab = "datetime", ylab = "Global_Reactive_Power")
})

while (!is.null(dev.list()))
    dev.off()