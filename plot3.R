# *** Read file ***
## The following R file reads the data in a concise way
## The file is available in the repository alongside this file.
source("Read_Electric_Power.R")

# *** Use libridate for date analysis ***
library(lubridate)
df$Date <- dmy(df$Date)
## Add time to date
df$UTC_time <- ymd_hms(paste(df$Date, df$Time))

# *** Sub metering time series ***
with(df, plot(UTC_time, Sub_metering_1,  type="n", xlab="", ylab = "Energy sub metering"))
with(df, lines(UTC_time, Sub_metering_1, type='l'))
with(df, lines(UTC_time, Sub_metering_2, col = "red", type='l'))
with(df, lines(UTC_time, Sub_metering_3, col = "blue", type='l'))
legend("topright", lwd = 1, col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty=c(1, 1, 1, 1))

# ** Exporting plot **
## Width of 480 pixels and a height of 480 pixels.
dev.copy(png, 'plot3.png', width = 480, height = 480)
dev.off()
