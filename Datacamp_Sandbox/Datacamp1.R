myVector <- c(1, 2, 3)
print(myVector)
install.packages("ggvis")
library("ggvis")
search()

# The emails vector has already been defined for you
emails <- c("john.doe@ivyleague.edu", "education@world.gov", "dalai.lama@peace.org",
						"invalid.edu", "quant@bigdatacollege.edu", "cookie.monster@sesame.tv")

# Use grepl() to match for "edu"
print(grepl(pattern = "edu", emails))

# Use grep() to match for "edu", save result to hits
hits <- grep(pattern = "edu", emails)

# Subset emails using hits
#which(hits)

Sys.Date()
Sys.time()
my_date <- as.Date("1971-14-05", format = "%Y-%d-%m")
print(my_date)
print(my_date + 1)
# Get the current date: today
today <- Sys.Date()
# See what today looks like under the hood
unclass(today)
# Get the current time: now
now <- Sys.time()
# See what now looks like under the hood
unclass(now)

# Definition of character strings representing dates
str1 <- "May 23, '96"
str2 <- "2012-03-15"
str3 <- "30/January/2006"

# Convert the strings to dates: date1, date2, date3
date1 <- as.Date(str1, format = "%b %d, '%y")
date2 <- as.Date(str2, format = "%Y-%m-%d")
date3 <- as.Date(str3, format = "%d/%B/%Y")



# Convert dates to formatted strings
format(date1, "%A")
format(date2, "%d")
format(date3, "%b %Y")

# Definition of character strings representing times
str1 <- "May 23, '96 hours:23 minutes:01 seconds:45"
str2 <- "2012-3-12 14:23:08"

# Convert the strings to POSIXct objects: time1, time2
time1 <- as.POSIXct(str1, format = "%B %d, '%y hours:%H minutes:%M seconds:%S")
time2 <- as.POSIXct(str2, format = "%Y-%m-%d %H:%M:%S")


# Convert times to formatted strings
format(time1, "%M")
format(time2, "%I:%M %p")

# login and logout are already defined in the workspace
# Calculate the difference between login and logout: time_online

#time_online <- logout - login

## Inspect the variable time_online
#print(time_online)

## Calculate the total time online
#print(sum(time_online))

## Calculate the average time online
#print(mean(time_online))
