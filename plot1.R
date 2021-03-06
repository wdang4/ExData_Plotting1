library("data.table")

power_df <- data.table::fread(input = "household_power_consumption.txt",
                              na.strings="?")

power_df[, Global_active_power := lapply(.SD, as.numeric), .SDcols = c("Global_active_power")]

power_df[, Date := lapply(.SD, as.Date, "%d/%m/%Y"), .SDcols = c("Date")]

power_df <- power_df[(Date >= "2007-02-01") & (Date <= "2007-02-02")]

png("plot1.png", width=480, height=480)

hist(power_df[, Global_active_power], main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

dev.off()