
##Read File after getting to directory

data_full <- read.csv("./household_power_consumption.txt", header=T, sep=';', na.strings="?", 

                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

##Getting Dates from Full Set

data_full$Date <- as.Date(data_full$Date, format="%d/%m/%Y")

data <- subset(data_full, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

rm(data_full)

##DataTime Function

datetime <- paste(as.Date(data$Date), data$Time)

data$Datetime <- as.POSIXct(datetime)


##Histogram
hist(data$Global_active_power, main="Global Active Power", 

     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

dev.copy(png, file="Plot1.png", height=480, width=480)

##Close

dev.off()