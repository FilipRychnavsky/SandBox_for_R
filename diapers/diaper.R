#diaper weight

library(dplyr)
library(ggplot2)

dir()
path <- file.path(".", "SandBox_for_R/diapers", "diaper1.csv")
path
#diaperData <- read.csv(path, header = TRUE, tz="", format='%d/%m/%Y %H:%M')
diaperData <- read.csv(path, header = TRUE)
diaperData$defecationDateTime <- as.POSIXct(diaperData$defecationDatetimeText, format = "%m.%d.%Y %H:%M")
diaperData$defecationDate <- as.Date(diaperData$defecationDateTime)

str(diaperData)
head(diaperData)

#Datum - group by datum aus dem Defecation DateTime
# Urin - Sortierung muss nach group by sein
diaperData %>%
  group_by(diaperData$defecationDate) %>%
  filter(excreta == 'U') %>%
  summarize(totalWeightPerDay = sum(weight))
  



# test, wie ich auf DateTime einschränken kann
# diaperData %>%
#   filter(diaperData$defecationDateTime> "2019-10-11 12:00")
# diaperData %>%
#     arrange(desc(weight))