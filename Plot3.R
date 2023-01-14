## Read in data set
pwr<-read.table("household_power_consumption.txt", header=TRUE, sep=";")

## Convert the Date column to date format
pwr$Date<-as.Date(pwr$Date,format="%d/%m/%Y")

## Create subset for appropriate date range
pwr_subset<-pwr[pwr$Date>="2007-02-01" & pwr$Date<="2007-02-02",]

#Convert Submeter columns to numeric class
pwr_subset$Sub_metering_1<-as.numeric(pwr_subset$Sub_metering_1)
pwr_subset$Sub_metering_2<-as.numeric(pwr_subset$Sub_metering_2)
pwr_subset$Sub_metering_3<-as.numeric(pwr_subset$Sub_metering_3)

#Create new column DateTime for both date and time
pwr_subset$DateTime<-as.POSIXct(paste(pwr_subset$Date, pwr_subset$Time), format="%Y-%m-%d %H:%M:%S")

## Plot 3 Data Setup
x<-pwr_subset$DateTime
y1<-pwr_subset$Sub_metering_1
y2<-pwr_subset$Sub_metering_2
y3<-pwr_subset$Sub_metering_3

## Create plot with all three lines
png("plot3.png", width = 480, height = 480)
plot(x,y1,type="l",ylab="Energy sub metering",xlab="")
lines(x,y2,col="Red")
lines(x,y3,col="Blue")
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black", "red","blue"),lty=c(1,1,1),cex=1)
dev.off()

