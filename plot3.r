# Anuj jain
# plot3.R
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

# Plotting a Graph
png(file = "plot3.png", width = 480, height = 480)

plot(df$Date, df$Sub_metering_1, type = "l", col = "black", xlab = "", ylab = "Energy sub metering")
lines(df$Date, df$Sub_metering_2, type = "l", col = "red")
lines(df$Date, df$Sub_metering_3, type = "l", col = "blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_Metering_3"))

dev.off()


