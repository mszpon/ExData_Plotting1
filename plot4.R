data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactors = FALSE)
data[,"Date"] <- as.Date(data[,"Date"],format = "%d/%m/%Y")
selectedData <- subset(data,Date == "2007-02-01" | Date == "2007-02-02")
GAP <- suppressWarnings(as.numeric(selectedData[,"Global_active_power"]))

dateFormatData <- strptime(paste(selectedData$Date,selectedData$Time,sep = " "), "%Y-%m-%d %H:%M:%S")

s1 <- as.numeric(selectedData[,"Sub_metering_1"])
s2 <- as.numeric(selectedData[,"Sub_metering_2"])
s3 <- as.numeric(selectedData[,"Sub_metering_3"])
GRP <- as.numeric(selectedData[,"Global_reactive_power"])
V <- as.numeric(selectedData[,"Voltage"])

png("plot4.png",width = 480, height = 480)
par(mfrow = c(2,2))

#1
plot(dateFormatData,GAP,type = "l",xlab = " ",ylab = "Global Active Power")
#2
plot(dateFormatData,V,type = "l",xlab = "datetime",ylab = "Voltage")
#3

plot(dateFormatData,s1,type = "l", xlab = " ", ylab = "Energy sub metering", col = "black")
lines(dateFormatData, s2, col = "red")
lines(dateFormatData, s3, col = "blue")
legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty = c(1,1,1), col = c("black","red","blue"))

#4
plot(dateFormatData,GRP,type = "l",xlab = "datetime",ylab = "Global_reactive_power")
dev.off()