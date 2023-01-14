## Read in data set and convert the Date column to date format
pwr<-read.table("household_power_consumption.txt", header=TRUE, sep=";")
pwr$Date<-as.Date(pwr$Date,format="%d/%m/%Y")
pwr_subset<-pwr[pwr$Date>="2007-02-01" & pwr$Date<="2007-02-02",]
pwr_subset$Global_active_power<-as.numeric(pwr_subset$Global_active_power)
pwr_subset$DateTime<-as.POSIXct(paste(pwr_subset$Date, pwr_subset$Time), format="%Y-%m-%d %H:%M:%S")

## Plot 2
png("plot2.png", width = 480, height = 480)
x_val<-pwr_subset$DateTime
y_val<-pwr_subset$Global_active_power
plot(x_val,y_val,type="l",ylab="Global Active Power (kilowatts)",xlab="")
dev.off()

