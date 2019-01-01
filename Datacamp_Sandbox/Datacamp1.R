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