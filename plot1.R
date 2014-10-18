library(lubridate)

# Read and subset data
dat = read.delim('household_power_consumption.txt', header = T, sep = ';')
dat$Date = dmy_hms(paste(dat$Date, dat$Time))
dat2 = dplyr::filter(dat, Date < ymd('2007-02-03') & Date >= ymd('2007-02-01'))

# Plot
png('plot1.png', width = 480, height = 480)
hist(as.numeric(dat2$Global_active_power), col = 'red',
     main = 'Global Active Power',
     xlab = 'Global Active Power (kilowatts)')
dev.off()
