p1data <- read.table('household_power_consumption.txt',sep = ';',col.names = name,colClasses = rep('character',9),skip = 1)
p1data$Date = as.Date(p1data$Date,'%d/%m/%Y')
ind <- which(p1data$Date >=" 2007-02-01" &  p1data$Date <="2007-02-02")
p1 <- p1data[ind,]
p1$Global_active_power <- as.numeric(p1$Global_active_power)
p1$Date <- strptime(paste(p1$Date, p1$Time),  format = "%Y-%m-%d %H:%M:%S")
names(p1)[1]="Time"
png(file = "./plot3.png", width = 480, height = 480, units = "px")
with(p1,plot(Time,Sub_metering_1,type = 'l',col='black',xlab=" ",ylab="Energy Sub Metering"))
with(p1,lines(Time,Sub_metering_2,col='red'))
with(p1,lines(Time,Sub_metering_3,col='blue'))
legend('topright',col=c('black','red','blue'),legend=c('Sub_metering_1','Sub_metering_2','Sub_metering_3'),lty=1)
dev.off()