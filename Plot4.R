df3 <- read.table("/Users/Zaid/Downloads/R projects/eda cousera/household_power_consumption.txt",header = TRUE, sep = ";", stringsAsFactors = FALSE,dec = ".")
df3 <- subset(df3, Date %in% c("1/2/2007","2/2/2007"))

library(lubridate)
df3$Date <-dmy(df3$Date)
df3$Time <- hms(df3$Time, roll = FALSE)
df3$x <- with(df3, Date +Time)

png("plot4.png", width=480, height=480)
par(mfcol =c(2,2))

with(df3, plot(x, Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)"))

with(df3, plot(x, Sub_metering_1, type = "n"))
with(df3,lines( x, Sub_metering_1, col = "Black"))
with(df3,lines( x, Sub_metering_2, col = "red"))
with(df3,lines( x, Sub_metering_3, col = "blue"))
legend("topright",lty = 1, lwd = 2, col = c("Black","red","blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),cex = 0.5)


with(df3, plot(x, Voltage, type="l", xlab="datetime"))
with(df3, plot(x, Global_reactive_power , type="l", xlab="datetime"))
dev.off()
