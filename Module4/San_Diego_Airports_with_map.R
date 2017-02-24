# Dataframes, visualizing with leaflet library
usa_airports <- read.csv("https://raw.githubusercontent.com/jflam/VSBlogPost/master/usa_airports.dat", stringsAsFactors = TRUE)
library(dplyr)
san_diego_airports <- usa_airports %>% filter(grepl('America', usa_airports$Region, TRUE), grepl('San Diego', usa_airports$city, TRUE))
head(san_diego_airports)
library(leaflet)
map <-
    san_diego_airports %>%
    leaflet() %>%
    addTiles() %>%
    addCircles( ~ lon, ~ lat, popup = ~name, radius = 200, color = "blue", opacity = 0.8)
map