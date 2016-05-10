## Reading the file and filtering the information

powerdata <- read.table("./Data/household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")
powerdata <- mutate(powerdata, ts = dmy_hms(paste(Date, Time)))
powerdata$Date <- dmy(powerdata$Date)
filtereddf <- filter(powerdata, Date == "2007-02-01" | Date == "2007-02-02")

## Create graphic


with(filtereddf, plot(ts, Global_active_power, type = "l", ylab = "Global Active Power (Kilowatts)"))


## Copy the graphic to png file and creating png file.

dev.copy(png, file="plot2.png", width=480, height=480)

dev.off()
