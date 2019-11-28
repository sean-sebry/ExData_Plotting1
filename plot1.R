global_active_power_data <- data_clean %>%
  filter(date > ("2007-01-31")) %>%
  filter(date < ("2007-02-03"))

head(global_active_power_data)
tail(global_active_power_data)
dim(global_active_power_data)

#ensure it works
plot1 <- with(global_active_power_data, hist(global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)"))


#device capture
png("plot1.png")
with(global_active_power_data, hist(global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)"))
dev.off(which = dev.cur())

