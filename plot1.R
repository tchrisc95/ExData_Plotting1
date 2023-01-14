## Read in data set and convert the Date column to date format
pwr<-read.table("household_power_consumption.txt", header=TRUE, sep=";")
pwr$Date<-as.Date(pwr$Date,format="%d/%m/%Y")
pwr_subset<-pwr[pwr$Date>="2007-02-01" & pwr$Date<="2007-02-02",]
pwr_subset$Global_active_power<-as.numeric(pwr_subset$Global_active_power)

## Plot 1
png("plot1.png", width = 480, height = 480)
hist(pwr_subset$Global_active_power,main="Global Active Power",xlab="Global Active Power (kilowatts)", ylab="Frequency",col='red')
dev.off()


