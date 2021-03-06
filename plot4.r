# Anuj jain
# plot4.R
# Week 1 Assignment

library(datasets)

# Data is already available in the working directory

fileName <- "./Data/household_power_consumption.txt"

#df <- read.csv2(fileName, header = TRUE, sep=";")

colNames <- read.csv2(fileName, header = TRUE, nrows = 2)
df <- read.csv(fileName, header = FALSE, sep=";",skip = 66637, nrows = 2880, col.names = names(colNames), na.strings = "?", colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))
#remove(colNames)

# Change to Date Class Object
df$Date <- as.Date(df$Date, "%d/%m/%Y")

# CHange to Time class object
df$Time <- strptime(paste(df$Date, df$Time), "%Y-%m-%d %H:%M:%S")

df <- df[,-c(1)]
colnames(df)[1] <- "Date"

# Plotting Graph
png(file = "plot4.png", width = 480, height = 480)

par(mfcol = c(2,2))
with(df, {

# Graph at 1,1
plot(df$Date, df$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)", main = "")
  
# Graph at 2,1  
plot(df$Date, df$Sub_metering_1, type = "l", col = "black", xlab = "", ylab = "Energy sub metering")
lines(df$Date, df$Sub_metering_2, type = "l", col = "red")
lines(df$Date, df$Sub_metering_3, type = "l", col = "blue")
legend("topright", lty = 1,bty = "n", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_Metering_3"))

# Graph at 1,2
plot(df$Date, df$Voltage, type = "l", col = "black", xlab = "datetime", ylab = "Voltage", main = "")

# Graph at 2,2
plot(df$Date, df$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power", main = "")


})

dev.off()


