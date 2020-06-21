# *** Read file ***
## The following R file reads the data in a concise way
## The file is available in the repository alongside this file.
source("Read_Electric_Power.R")

# *** Global Active Power histogram ***
with(df, hist(Global_active_power, col="red", main="Global Active Power", 
              xlab = "Global Active Power (kilowatts)"))

# ** Exporting plot **
## Width of 480 pixels and a height of 480 pixels.
dev.copy(png,'plot1.png', width = 480, height = 480)
dev.off()
