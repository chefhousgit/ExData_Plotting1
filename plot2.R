
data <- read.table(file = "household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", colClasses = c('character', 'character', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric'))
date <- as.Date(data$Date, "%d/%m/%Y")
data$Date <- as.Date(data$Date, "%d/%m/%Y")
twodays <- data[data$Date >= "2007-02-01" & data$Date <= "2007-02-02",]
twodays <- twodays[complete.cases(twodays),]
dateandtime <- paste(twodays$Date, twodays$Time)
twodays <- cbind(dateandtime, twodays)
twodays$dateandtime <- as.POSIXct(dateandtime)
png(filename = "plot2.png", width = 480, height = 480)
plot(twodays$dateandtime, twodays$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
while (!is.null(dev.list()))
    dev.off()

