
data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactors = FALSE)
data[,"Date"] <- as.Date(data[,"Date"],format = "%d/%m/%Y")
selectedData<-subset(data,Date == "2007-02-01" | Date == "2007-02-02")
GAP<-suppressWarnings(as.numeric(selectedData[,"Global_active_power"]))

png("plot1.png",width = 480, height = 480)
hist(GAP, main = "Global Active Power", col = "red", xlab = "Global Active Power (kilowatts)", ylab="Frequency")
dev.off()