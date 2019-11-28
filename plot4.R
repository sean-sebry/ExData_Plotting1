energy_sub_metering_data <- data_clean %>%
  filter(date > ("2007-01-31")) %>%
  filter(date < ("2007-02-03")) %>% 
  mutate(date_time = paste(date, time)) %>% 
  mutate(date_time = ymd_hms(date_time))

glimpse(energy_sub_metering_data)


png("plot4.png")

par(mfrow = c(2, 2))

#plot 1
with(global_active_power_data, plot(x = date_time, y = global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)"))

#plot 2
with(global_active_power_data, plot(x = date_time, y = voltage, type = "l", xlab = "datetime", ylab = "Voltage"))

#plot 3
with(energy_sub_metering_data, plot(x = date_time,
                                    y = sub_metering_1,
                                    type = "l",
                                    ylab = "Energy sub metering",
                                    xlab = ""))
with(energy_sub_metering_data, lines(x = date_time,y = sub_metering_2,type = "l",col = "red"))
with(energy_sub_metering_data, lines(x = date_time,y = sub_metering_3,type = "l",col = "blue"))
legend("topright", c("sub_metering_1", "sub_metering_2", "sub_metering_3"), lty = c(1,1,1),col = c("black", "red", "blue"))

#plot 4
with(global_active_power_data, plot(x = date_time, y = global_reactive_power, type = "l", xlab = "datetime", ylab = "global_reactive_power"))

dev.off()
