# plot2.R

data <- read.table("household_power_consumption.txt",
                   header = TRUE,
                   sep = ";",
                   stringsAsFactors = FALSE,
                   na.strings = "?")

data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

sub <- subset(data, Date == as.Date("2007-02-01") | Date == as.Date("2007-02-02"))

sub$datetime <- strptime(paste(sub$Date, sub$Time), format = "%Y-%m-%d %H:%M:%S")

sub$Global_active_power <- as.numeric(sub$Global_active_power)

png("plot2.png", width = 480, height = 480)

plot(sub$datetime, sub$Global_active_power,
     type = "l",
     xlab = "",
     ylab = "Global Active Power (kilowatts)")

dev.off()
