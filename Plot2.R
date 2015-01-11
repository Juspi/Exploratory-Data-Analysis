Power <- "household_power_consumption.txt"
data <- read.table(Power, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subSetPower <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

datetime <- paste(as.Date(subSetPower$Date), subSetPower$Time)
subSetPower$datetime <- as.POSIXct(paste(subSetPower$Date, subSetPower$Time),
      format="%d/%m/%Y %H:%M:%S") 
subSetPower$Global_active_power <- as.numeric(subSetPower$Global_active_power)

plot(subSetPower$Global_active_power~subSetPower$datetime, type="l",
      ylab="Global Active Power (kilowatts)", xlab="")
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()