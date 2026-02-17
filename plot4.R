# plot4.R

data <- read.table("household_power_consumption.txt",
                   header = TRUE,
                   sep = ";",
                   stringsAsFactors = FALSE,
                   na.strings = "?")

data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

sub <- subset(data, Date == as.Date("2007-02-01") | Date == as.Date("2007-02-02"))

sub$datetime <- strptime(paste(sub$Date, sub$Time),
                         format = "%Y-%m-%d %H:%M:%S")

sub$Global_active_power <- as.numeric(sub$Global_active_power)
sub$Global_reactive_power <- as.numeric(sub$Global_reactive_power)
sub$Voltage <- as.numeric(sub$Voltage)

sub$Sub_metering_1 <- as.numeric(sub$Sub_metering_1)
sub$Sub_metering_2 <- as.numeric(sub$Sub_metering_2)
sub$Sub_metering_3 <- as.numeric(sub$Sub_metering_3)

png("plot4.png", width = 480, height = 480)

par(mfrow = c(2, 2), mar = c(4, 4, 2, 1))

plot(sub$datetime, sub$Global_active_power,
     type = "l",
     xlab = "",
     ylab = "Global Active Power")

plot(sub$datetime, sub$Voltage,
     type = "l",
     xlab = "datetime",
     ylab = "Voltage")

plot(sub$datetime, sub$Sub_metering_1,
     type = "l",
     xlab = "",
     ylab = "Energy sub metering")

lines(sub$datetime, sub$Sub_metering_2, col = "red")
lines(sub$datetime, sub$Sub_metering_3, col = "blue")

legend("topright",
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"),
       lty = 1,
       bty = "n")

plot(sub$datetime, sub$Global_reactive_power,
     type = "l",
     xlab = "datetime",
     ylab = "Global_reactive_power")

dev.off()
