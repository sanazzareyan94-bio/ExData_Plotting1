# plot3.R

data <- read.table("household_power_consumption.txt",
                   header = TRUE,
                   sep = ";",
                   stringsAsFactors = FALSE,
                   na.strings = "?")

data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

sub <- subset(data, Date == as.Date("2007-02-01") | Date == as.Date("2007-02-02"))

sub$datetime <- strptime(paste(sub$Date, sub$Time),
                         format = "%Y-%m-%d %H:%M:%S")

sub$Sub_metering_1 <- as.numeric(sub$Sub_metering_1)
sub$Sub_metering_2 <- as.numeric(sub$Sub_metering_2)
sub$Sub_metering_3 <- as.numeric(sub$Sub_metering_3)

png("plot3.png", width = 480, height = 480)

plot(sub$datetime, sub$Sub_metering_1,
     type = "l",
     xlab = "",
     ylab = "Energy sub metering")

lines(sub$datetime, sub$Sub_metering_2, col = "red")
lines(sub$datetime, sub$Sub_metering_3, col = "blue")

legend("topright",
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"),
       lty = 1)

dev.off()
