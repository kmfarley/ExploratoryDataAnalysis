p2data <- read.csv("./exdata-data-household_power_consumption/household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                   nrows=2075259, quote='\"')
p2data$Date <- as.Date(p2data$Date, format="%d/%m/%Y")
subdata <- subset(p2data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(p2data)
datetime <- paste(as.Date(subdata$Date), subdata$Time)
subdata$Datetime <- as.POSIXct(datetime)
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(subdata, {
  plot(Global_active_power~Datetime, type="l", 
       ylab="Global Active Power (kilowatts)", xlab="")
  plot(Voltage~Datetime, type="l", 
       ylab="Voltage (volt)", xlab="")
  plot(Sub_metering_1~Datetime, type="l", 
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(Global_reactive_power~Datetime, type="l", 
       ylab="Global Rective Power (kilowatts)",xlab="")
})
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()