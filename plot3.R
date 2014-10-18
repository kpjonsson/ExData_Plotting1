library(lubridate)

# Read and subset data
dat = read.delim('household_power_consumption.txt', header = T, sep = ';')
dat$Date = dmy_hms(paste(dat$Date, dat$Time))
dat2 = dplyr::filter(dat, Date < ymd('2007-02-03') & Date >= ymd('2007-02-01'))

# Plot
y_range = c(min(dat2$Sub_metering_1, dat2$Sub_metering_2, dat2$Sub_metering_3),
            max(dat2$Sub_metering_1, dat2$Sub_metering_2, dat2$Sub_metering_3))
x_range = range(dat2$Date)

png('plot3.png', width = 480, height = 480)
plot(x_range, y_range, type = 'n', xlab = '', ylab = 'Energy sub metering')
with(dat2, lines(Date, Sub_metering_1, type = 'l', col = 'black'))
with(dat2, lines(Date, Sub_metering_2, type = 'l', col = 'red'))
with(dat2, lines(Date, Sub_metering_3, type = 'l', col = 'blue'))
legend(x = 'topright', grep('Sub_metering', colnames(dat2), value = T),
       col = c('black', 'red', 'blue'), lty = c(1,1))
dev.off()
