#diaper weight
dir()
path <- file.path(".", "SandBox_for_R/diapers", "diaper1.csv")
path
#diaperData <- read.csv(path, header = TRUE, tz="", format='%d/%m/%Y %H:%M')
diaperData <- read.csv(path, header = TRUE)
diaperData$dateTime <- as.POSIXct(diaperData$datetimeText, format = "%m.%d.%Y %H:%M")

str(diaperData)
head(diaperData)
