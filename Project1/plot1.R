p1data <- read.csv("./exdata-data-household_power_consumption/household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                   nrows=2075259, quote='\"')
p1data$Date <- as.Date(p1data$Date, format="%d/%m/%Y")
subdata <- subset(p1data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(p1data)
datetime <- paste(as.Date(subdata$Date), subdata$Time)
data$Datetime <- as.POSIXct(datetime)
hist(subdata$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()