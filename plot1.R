
data <- read.table(file = "household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", colClasses = c('character', 'character', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric'))
date <- as.Date(data$Date, "%d/%m/%Y")
data$Date <- as.Date(data$Date, "%d/%m/%Y")
twodays <- data[data$Date >= "2007-02-01" & data$Date <= "2007-02-02",]
twodays <- twodays[complete.cases(twodays),]
png(filename = "plot1.png", width = 480, height = 480)
hist(twodays$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", col = "red")
while (!is.null(dev.list()))
    dev.off()
