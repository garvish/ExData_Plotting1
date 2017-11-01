# Set Working Directory
setwd("D:\\Projects\\DataScience\\Coursera Certification\\Data Science Specialization\\Assignments\\ExData_Plotting1")

# Load Data and convert Date and Time variables
powerConsumption <- read.table("data/household_power_consumption.txt", sep = ";", stringsAsFactors = FALSE, header = TRUE, colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"), na.strings = "?")
powerConsumption$Time <- strptime(paste(powerConsumption$Date, powerConsumption$Time), format = "%d/%m/%Y %H:%M:%S")
powerConsumption$Date <- as.Date(powerConsumption$Date, format = "%d/%m/%Y")

# Filter dates 2007-02-01 and 2007-02-02
powerConsumption <- subset(powerConsumption, Date == "2007-02-01" | Date == "2007-02-02")

# First create Line Plot on screen
plot(x = powerConsumption$Time, y = powerConsumption$Sub_metering_1, ylab = "Energy sub metering", xlab = "", type = "l")
lines(x = powerConsumption$Time, y = powerConsumption$Sub_metering_2, col = "red")
lines(x = powerConsumption$Time, y = powerConsumption$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = c("black","red","blue"),lty = 1)

# Now Use same code to Create Line Plot on PNG device
png(filename = "Plot3.png", width = 480, height = 480, units = "px")
plot(x = powerConsumption$Time, y = powerConsumption$Sub_metering_1, ylab = "Energy sub metering", xlab = "", type = "l")
lines(x = powerConsumption$Time, y = powerConsumption$Sub_metering_2, col = "red")
lines(x = powerConsumption$Time, y = powerConsumption$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = c("black","red","blue"),lty = 1)
dev.off()
