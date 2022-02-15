library(tidyverse)
library(readxl)
library(tidyr)


# Load wide data from CSVs
data <- read_csv("newly_confirmed_cases_daily.csv")

glimpse(data)

# Encode the date vector as a factor
data$Date <- factor(data$Date)

# Convert to long format
data_long <- gather(data, prefecture, new_cases, ALL:Okinawa, factor_key=TRUE)

# Confirm everything looks good
head(data_long)

# Export new CSV in long format
write.csv(data_long,"newly_confirmed_cases_daily_long.csv")
