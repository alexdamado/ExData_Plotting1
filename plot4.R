## Reading the file and filtering the information

powerdata <- read.table("./Data/household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")
powerdata <- mutate(powerdata, ts = dmy_hms(paste(Date, Time)))
powerdata$Date <- dmy(powerdata$Date)
filtereddf <- filter(powerdata, Date == "2007-02-01" | Date == "2007-02-02")

## prepare viewing screen
par(mfrow=c(2,2))

## Plot Graphics

with(filtereddf, plot(ts, Global_active_power, type = "l", ylab = "Global Active Power"))

with(filtereddf, plot(ts, Voltage, type = "l", xlab = "datetime"))

with(filtereddf, plot(ts, Sub_metering_1, type = "l", ylab = "Energy sub metering"))
with(filtereddf, lines(ts, Sub_metering_2, col = "red"))
with(filtereddf, lines(ts, Sub_metering_3, col = "blue"))

with(filtereddf, plot(ts, Global_reactive_power, type = "l", xlab = "datetime"))

## Copy the graphic to png file and creating png file.

dev.copy(png, file="plot4.png", width=480, height=480)

dev.off()
