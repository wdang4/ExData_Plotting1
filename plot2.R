library("data.table")

power_df <- data.table::fread(input = "household_power_consumption.txt",
                              na.strings="?")

power_df[, Global_active_power := lapply(.SD, as.numeric), .SDcols = c("Global_active_power")]

power_df[, dateTime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]

power_df <- power_df[(dateTime >= "2007-02-01") & (dateTime < "2007-02-03")]

png("plot2.png", width=480, height=480)

plot(x = power_df[, dateTime]
     , y = power_df[, Global_active_power]
     , type="l", xlab="", ylab="Global Active Power (kilowatts)")

dev.off()