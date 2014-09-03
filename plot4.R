#plot4.R
load_plotdata <-function(fname) {
    cols <- c('character', 'character', rep('numeric', 7))
    lo <- as.Date("2007-02-01", "%Y-%m-%d")
    hi <- as.Date("2007-02-02", "%Y-%m-%d")
    hpc <- read.table(fname, header=TRUE, colClasses=cols, sep=";", na="?")
    hpc <- subset(hpc, as.Date(as.character(hpc$Date), "%d/%m/%Y")==lo | as.Date(as.character(hpc$Date), "%d/%m/%Y")==hi)
    hpc$Time <- strptime(paste(hpc$Date, hpc$Time), "%d/%m/%Y %H:%M:%S")
    hpc$Date <- as.Date(hpc$Date, "%d/%m/%Y")
    hpc$Global_active_power <-as.numeric(as.character(hpc$Global_active_power))
    return(hpc)
}

fname <- 'household_power_consumption.txt'
hpc <- load_plotdata(fname)

dev.copy(png, "ExData_Plotting1/plot4.png", width=480, height=480)
par(mfrow=c(2,2))

plot(hpc$Time, hpc$Global_active_power, type="l", xlab="", ylab="Global Active Power")

plot(hpc$Time, hpc$Voltage, type="l", xlab="datetime", ylab="Voltage")

plot(hpc$Time, hpc$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(hpc$Time,hpc$Sub_metering_2, type="l", col="red")
lines(hpc$Time, hpc$Sub_metering_3, type="l", col="blue")

plot(hpc$Time, hpc$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")



dev.off()