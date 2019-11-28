global_active_power_data <- data_clean %>%
  filter(date > ("2007-01-31")) %>%
  filter(date < ("2007-02-03")) %>% 
  mutate(date_time = paste(date, time)) %>% 
  mutate(date_time = ymd_hms(date_time))

glimpse(global_active_power_data)


png("plot2.png")
with(global_active_power_data, plot(x = date_time, y = global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)"))
dev.off()
