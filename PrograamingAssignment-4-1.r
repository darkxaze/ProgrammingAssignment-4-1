rawData <- read.table('household_power_consumption.txt', header = T, stringsAsFactors = F,
                      na.strings = "?", sep = ';', quote = "", skip = 66636, nrows = 2880)
tail(rawData, 10)
colnames(rawData) <- c('Date', 'Time', 'GlobalActivePower', 'GlobalReactivePower', 'Voltage',
                       'GlobalIntensity', 'SubMetering1', 'SubMetering2', 'SubMetering3')
rawData$DateTime <- strptime(paste(rawData$Date, rawData$Time), format = '%d/%m/%Y %H:%M:%S')


hist(rawData$GlobalActivePower, col = 'red',
     main = 'Global Active Power',
     xlab = 'Global Active Power (kilowatts)')

plot(x = rawData$DateTime, y = rawData$GlobalActivePower, 
     type = 'l', xlab = NA, ylab = 'Global Active Power (kilowatts)')

plot(x = rawData$DateTime, y = rawData$SubMetering1, type = 'l',
     xlab = NA, ylab = 'Energy sub metering')
lines(x = rawData$DateTime, y = rawData$SubMetering2, col = 'red')
lines(x = rawData$DateTime, y = rawData$SubMetering3, col = 'blue')
legend('topright', 
       legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'),
       col = c('black', 'red', 'blue'),
       lwd = 1)

par(mfrow = c(2, 2)) 
  #plots from left to right, top to bottom (since you used mfrow vs mfcol)
#plot 4a = plot 1
plot(x = rawData$DateTime, y = rawData$GlobalActivePower, 
     type = 'l', xlab = NA, ylab = 'Global Active Power')
#plot 4b
plot(x = rawData$DateTime, y = rawData$Voltage, 
     type = 'l', xlab = 'datetime', ylab = 'Voltage')
#plot 4c = plot 3
plot(x = rawData$DateTime, y = rawData$SubMetering1, type = 'l',
     xlab = NA, ylab = 'Energy sub metering')
lines(x = rawData$DateTime, y = rawData$SubMetering2, col = 'red')
lines(x = rawData$DateTime, y = rawData$SubMetering3, col = 'blue')
legend('topright', 
       legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'),
       col = c('black', 'red', 'blue'),
       lwd = 1, bty = 'n')
#plot 4d
plot(x = rawData$DateTime, y = rawData$GlobalReactivePower, type = 'l',
     xlab = 'datetime', ylab = 'Global_reactive_power')


