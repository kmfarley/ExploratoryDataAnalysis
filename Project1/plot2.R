p2data <- read.csv("./exdata-data-household_power_consumption/household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                   nrows=2075259, quote='\"')
p2data$Date <- as.Date(p2data$Date, format="%d/%m/%Y")
subdata <- subset(p2data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(p2data)
datetime <- paste(as.Date(subdata$Date), subdata$Time)
subdata$Datetime <- as.POSIXct(datetime)
plot(subdata$Global_active_power~subdata$Datetime, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()