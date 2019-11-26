#diaper weight
dir()
path <- file.path(".", "SandBox_for_R/diapers", "diaper1.csv")
path
diaperData <- read.csv(path)
str(diaperData)