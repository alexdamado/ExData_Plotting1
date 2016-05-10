## Reading the file

powerdata <- read.table("./Data/household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")
powerdata$Date <- dmy(powerdata$Date)
filtereddf <- filter(powerdata, Date == "2007-02-01" | Date == "2007-02-02")
hist(filtereddf$Global_active_power,
     col = "red",
     xlab = "Global Active Power (kilowatts)",
     main = "Global Active Power")

png("plot1.png", width=480, height=480, units="px")

dev.copy(png, file="plot1.png", width=480, height=480)
dev.off()
