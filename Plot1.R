df3 <- read.table("/Users/Zaid/Downloads/R projects/eda cousera/household_power_consumption.txt",header = TRUE, sep = ";", stringsAsFactors = FALSE,dec = ".")

df3 <- subset(df3, df3$Date == "2007-02-01" | df3$Date == "2007-02-02")

library(lubridate)
df3$Date <-dmy(df3$Date)
df3$Time <- hms(df3$Time, roll = FALSE)

df3$Global_active_power <- as.numeric(df3$Global_active_power)

png("plot1.png", width=480, height=480)
hist(df3$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)",xlim = c(0,6),
     freq = TRUE,ylim = c(0,1200))
