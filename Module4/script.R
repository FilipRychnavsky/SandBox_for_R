# Dataframes, vizualizing
#library(dplyr)
#loading dataframe from github
usa_airports <- read.csv("https://raw.githubusercontent.com/jflam/VSBlogPost/master/usa_airports.dat", stringsAsFactors = TRUE)
head(usa_airports)
#library(DT)
library(dplyr)
san_diego_airports <- subset(usa_airports, city == "San Diego")
datatable(san_diego_airports[, c("name", "city", "country", "IATA_FAA", "lat", "lon", "altitude")])
head(san_diego_airports)
library(leaflet)
map <-
    san_diego_airports %>%
    leaflet() %>%
    addTiles() %>%
    addCircles( ~ lon, ~ lat, popup = ~name, radius = 200, color = "blue", opacity = 0.8)
map
