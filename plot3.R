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
data$Sub_metering_1 <- as.numeric(as.character(data$Sub_metering_1))
data$Sub_metering_2 <- as.numeric(as.character(data$Sub_metering_2))
data$Sub_metering_3 <- as.numeric(as.character(data$Sub_metering_3))

#calling the basic plot function 
plot(data$TimeDate,data$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(data$TimeDate,data$Sub_metering_2,col="red")
lines(data$TimeDate,data$Sub_metering_3,col="blue")
legend("topright", col=c("black","red","blue"), c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "),lty=c(1,1), bty="n", cex=.2) 

# annotating graph
title(main="Energy sub-metering")

# saving in png format
dev.copy(png, file="plot3.png", width=480, height=480)
dev.off()