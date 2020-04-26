

data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactors = FALSE)
data[,"Date"] <- as.Date(data[,"Date"],format = "%d/%m/%Y")
selectedData<-subset(data,Date == "2007-02-01" | Date == "2007-02-02")
dateFormatData<-strptime(paste(selectedData$Date,selectedData$Time,sep = " "),"%Y-%m-%d %H:%M:%S")
GAP<-as.numeric(selectedData[,"Global_active_power"])

png("plot2.png",width = 480, height = 480)
plot(dateFormatData,GAP,type = "l",xlab = " ",ylab = "Global Active Power (kilowatts)")
dev.off()