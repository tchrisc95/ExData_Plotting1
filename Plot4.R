## Read in data set
pwr<-read.table("household_power_consumption.txt", header=TRUE, sep=";")

## Convert the Date column to date format
pwr$Date<-as.Date(pwr$Date,format="%d/%m/%Y")

## Create subset for appropriate date range
pwr_subset<-pwr[pwr$Date>="2007-02-01" & pwr$Date<="2007-02-02",]

#Create new column DateTime for both date and time
pwr_subset$DateTime<-as.POSIXct(paste(pwr_subset$Date, pwr_subset$Time), format="%Y-%m-%d %H:%M:%S")

#Convert voltage to numeric
pwr_subset$Voltage<-as.numeric(pwr_subset$Voltage)

#Convert reactive power to numeric
pwr_subset$Global_reactive_power<-as.numeric(pwr_subset$Global_reactive_power)

#Convert Submeter columns to numeric class
pwr_subset$Sub_metering_1<-as.numeric(pwr_subset$Sub_metering_1)
pwr_subset$Sub_metering_2<-as.numeric(pwr_subset$Sub_metering_2)
pwr_subset$Sub_metering_3<-as.numeric(pwr_subset$Sub_metering_3)


png("plot4.png", width = 480, height = 480)

## Make a 2x2 figure
par(mfrow = c(2,2))

## Graph 1
x_val<-pwr_subset$DateTime
y_val<-pwr_subset$Global_active_power
plot(x_val,y_val,type="l",ylab="Global Active Power (kilowatts)",xlab="")

## Graph 2
x_val2<-pwr_subset$DateTime
y_val2<-pwr_subset$Voltage
plot(x_val2,y_val2,type="l",ylab="Voltage",xlab="datetime")

## Graph 3
x<-pwr_subset$DateTime
y1<-pwr_subset$Sub_metering_1
y2<-pwr_subset$Sub_metering_2
y3<-pwr_subset$Sub_metering_3
plot(x,y1,type="l",ylab="Energy sub metering",xlab="")
lines(x,y2,col="Red")
lines(x,y3,col="Blue")
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black", "red","blue"),lty=c(1,1,1),cex=1,bty="n")

## Graph 4
x_val3<-pwr_subset$DateTime
y_val3<-pwr_subset$Global_reactive_power
plot(x_val3,y_val3,type="l",ylab="Global_reactive_power",xlab="datetime")

dev.off()
