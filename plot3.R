library(sqldf)
download.file('https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip', 'data.zip')
unzip('data.zip')
sub_meterings = read.csv.sql('household_power_consumption.txt', sql="select Date, Time, Sub_metering_1, Sub_metering_2, Sub_metering_3 from file where Date in ('1/2/2007', '2/2/2007')", sep = ';')
png('plot3.png', width=480, height=480)
time = strptime(paste(gaptime$Date, gaptime$Time), '%d/%m/%Y %H:%M:%S')
plot(time, sub_meterings$Sub_metering_1, type = 'l', xlab = 'Energy sub metering', ylab = '', col = )
lines(time, sub_meterings$Sub_metering_2, col = 'red')
lines(time, sub_meterings$Sub_metering_3, col = 'blue')
legend(x= 'topright',
       legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'),
       lty = c(1,1,1),
       col = c('black', 'red', 'blue'))
dev.off()