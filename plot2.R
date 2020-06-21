# *** Read file ***
## The following R file reads the data in a concise way
## The file is available in the repository alongside this file.
source("Read_Electric_Power.R")

# *** Use libridate for date analysis ***
library(lubridate)
df$Date <- dmy(df$Date)
## Add time to date
df$UTC_time <- ymd_hms(paste(df$Date, df$Time))


# *** Global Active Power time series ***
with(df, plot(UTC_time, Global_active_power, 
              xlab="", ylab = "Global Active Power (kilowatts)", type='l'))

# ** Exporting plot **
## Width of 480 pixels and a height of 480 pixels.
dev.copy(png,'plot2.png', width = 480, height = 480)
dev.off()
