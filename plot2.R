# reading relevant data
data <- read.table("household_power_consumption.txt", sep = ";", skip = 66637, nrows = 2880)

# Assigning names to variable (column)
names(data) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

#Create column in table with date and time merged together
TimeDate <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
data <- cbind(data, TimeDate)

#change class of columns to correct class
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
data$Time <- format(powerdata$Time, format="%H:%M:%S")
data$Global_active_power <- as.numeric(as.character(data$Global_active_power))

#calling the basic plot function & saving in png format
with(data, plot(TimeDate, Global_active_power, type="l", xlab="Day", ylab="Global Active Power (kilowatts)"))
dev.copy(png, file="plot2.png", width=480, height=480)
dev.off()