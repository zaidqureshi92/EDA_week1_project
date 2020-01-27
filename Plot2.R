df3 <- read.table("/Users/Zaid/Downloads/R projects/eda cousera/household_power_consumption.txt",header = TRUE, sep = ";", stringsAsFactors = FALSE,dec = ".")
df3 <- subset(df3, Date %in% c("1/2/2007","2/2/2007"))

library(lubridate)
df3$Date <-dmy(df3$Date)
df3$Time <- hms(df3$Time, roll = FALSE)
df3$x <- with(df3, Date +Time)

png("plot2.png", width=480, height=480)
with(df3, plot(x, Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)"))
dev.off()

