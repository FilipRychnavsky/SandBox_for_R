##library("AzureML")
##ws = workspace()
library(ggplot2)
#auto.price = download.datasets(ws, "Automobile price data (Raw)")
setwd("C:/Users/Filip/Source/Repos/rproject1/Module4")
auto.price = read.csv("Automobile price data _Raw_.csv")
#auto.price = auto.hist
## Coerce some character columns to numeric
cols <- c('price', 'bore', 'stroke', 'horsepower', 'peak.rpm')
auto.price[, cols] = lapply(auto.price[, cols], function(x) ifelse(x == '?', NA, x))
auto.price[, cols] = lapply(auto.price[, cols], as.numeric)

## remove rows with NAs 
auto.price = auto.price[complete.cases(auto.price),]

## Add a log transformed column for price
auto.price$lnprice = log(auto.price$price)

## Consolidate the number of cylinders
auto.price$num.cylinders =
    ifelse(auto.price$num.of.cylinders %in% c("four", "three"), "three-four",
        ifelse(auto.price$num.of.cylinders %in% c("five", "six"), "five-six", "eight-twelve"))

head(auto.price)

library(ggplot2)
library(repr)
options(repr.plot.width = 8, repr.plot.height = 8)

num.cols = c("wheel.base",
              "width",
              "height",
              "curb.weight",
              "engine.size",
              "bore",
              "compression.ratio",
              "city.mpg",
              "price",
              "lnprice")

pairs( ~ ., data = auto.price[, num.cols])

## Function to plot conditioned histograms
install.packages('gridExtra')
options(repr.plot.width = 6, repr.plot.height = 3)
auto.hist = function(x) {
    library(ggplot2)
    library(gridExtra)
    ## Compute the bin width
    rg = range(auto.price[, x])
    bw = (rg[2] - rg[1]) / 30
    ## Define the title
    title <- paste("Histogram of", x, "conditioned on type of drive wheels")
    ## Create the histogram
    ggplot(auto.price, aes_string(x)) +
    geom_histogram(aes(y = ..count..), binwidth = bw) +
    facet_grid(. ~ drive.wheels) +
    ggtitle(title)
}

## Create histograms for specified features.
plot.cols2 = c("length",
               "curb.weight",
               "engine.size",
               "city.mpg",
               "price")
#lapply(plot.cols2, auto.hist)


#FR
auto.hist_cylinders = function(x) {
    library(ggplot2)
    library(gridExtra)
    ## Compute the bin width
    rg = range(auto.price[, x])
    bw = (rg[2] - rg[1]) / 30
    ## Define the title
    title <- paste("Histogram of", x, "conditioned on type of cylinders")
    ## Create the histogram
    ggplot(auto.price, aes_string(x)) +
    geom_histogram(aes(y = ..count..), binwidth = bw) +
    facet_grid(. ~ num.of.cylinders) +
    ggtitle(title)
}

lapply(plot.cols2, auto.hist_cylinders)
