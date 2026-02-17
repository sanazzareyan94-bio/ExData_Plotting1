# plot1.R

data <- read.table("household_power_consumption.txt",
                   header = TRUE,
                   sep = ";",
                   stringsAsFactors = FALSE,
                   na.strings = "?")

data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
sub <- subset(data, Date == as.Date("2007-02-01") | Date == as.Date("2007-02-02"))

sub$Global_active_power <- as.numeric(sub$Global_active_power)

png("plot1.png", width = 480, height = 480)

hist(sub$Global_active_power,
     col = "red",
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)")

dev.off()
