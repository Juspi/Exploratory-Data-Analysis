Power <- "household_power_consumption.txt"
data <- read.table(Power, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subSetPower <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

datetime <- paste(as.Date(subSetPower$Date), subSetPower$Time)
subSetPower$datetime <- as.POSIXct(paste(subSetPower$Date, subSetPower$Time),
                                   format="%d/%m/%Y %H:%M:%S") 
subSetPower$Global_active_power <- as.numeric(subSetPower$Global_active_power)

with(subSetPower, {
  plot(Sub_metering_1~datetime, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~datetime,col='Red')
  lines(Sub_metering_3~datetime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2,
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()
