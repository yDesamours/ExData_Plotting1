library(sqldf)
download.file('https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip', 'data.zip')
unzip('data.zip')
data=read.csv.sql('household_power_consumption.txt', sql="select * from file where Date in ('1/2/2007', '2/2/2007')", sep = ';')
png('plot4.png', width=480, height=480)
par(mfrow = c(2,2))
time = strptime(paste(gaptime$Date, gaptime$Time), '%d/%m/%Y %H:%M:%S')
plot(time, data$Global_active_power, type = 'l', xlab = '', ylab = 'Global Active Power')
plot(time, data$Voltage, type = 'l', xlab = '', ylab = 'Voltage')
plot(time, sub_meterings$Sub_metering_1, type = 'l', xlab = 'Energy sub metering', ylab = '')
lines(time, data$Sub_metering_2, col = 'red')
lines(time, data$Sub_metering_3, col = 'blue')
legend(x= 'topright',
       legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'),
       lty = c(1,1,1),
       col = c('black', 'red', 'blue'))
plot(time, data$Global_reactive_power, type = 'l', xlab = '', ylab = 'Global_reactive_power')
dev.off()