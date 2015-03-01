p1data <- read.table('household_power_consumption.txt',sep = ';',col.names = name,colClasses = rep('character',9),skip = 1)
p1data$Date = as.Date(p1data$Date,'%d/%m/%Y')
ind <- which(p1data$Date >=" 2007-02-01" &  p1data$Date <="2007-02-02")
p1 <- p1data[ind,]
p1$Global_active_power <- as.numeric(p1$Global_active_power)
p1$Date <- strptime(paste(p1$Date, p1$Time),  format = "%Y-%m-%d %H:%M:%S")
names(p1)[1]="Time"
png(file = "./plot1.png", width = 480, height = 480, units = "px")
hist(p1$Global_active_power,xlab = 'Global Active Power (kilowatts)',col = 'Red')
dev.off()