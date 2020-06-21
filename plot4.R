# *** Read file ***
## The following R file reads the data in a concise way
## The file is available in the repository alongside this file.
source("Read_Electric_Power.R")

# *** Use libridate for date analysis ***
library(lubridate)
df$Date <- dmy(df$Date)
## Add time to date
df$UTC_time <- ymd_hms(paste(df$Date, df$Time))

# *** Four charts ***
## (1,1)
par(mfrow = c(2, 2)) #, mar = c(4, 4, 2, 1), oma = c(0, 0, 2, 0))
with(df, plot(UTC_time, Global_active_power, 
              xlab="", ylab = "Global Active Power (kilowatts)", type='l'))
## (1,2)
with(df, plot(UTC_time, Voltage,
              xlab="datetime", ylab = "Voltage", type='l'))

## (2,1)
with(df, plot(UTC_time, Sub_metering_1,  type="n", xlab="", ylab = "Energy sub metering"))
with(df, lines(UTC_time, Sub_metering_1, type='l'))
with(df, lines(UTC_time, Sub_metering_2, col = "red", type='l'))
with(df, lines(UTC_time, Sub_metering_3, col = "blue", type='l'))
legend("topright", lwd = 1, col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex=0.7,
       y.intersp = -0.1, box.lty = 0)
       #lty=c(0.1, 0.1, 0.1, 0.1))

## (2,2)
with(df, plot(UTC_time, Global_reactive_power,
              xlab="datetime", ylab = "Global_reactive_power", type='l'))

# ** Exporting plot **
## Width of 480 pixels and a height of 480 pixels.
dev.copy(png, 'plot4.png', width = 480, height = 480)
dev.off()
