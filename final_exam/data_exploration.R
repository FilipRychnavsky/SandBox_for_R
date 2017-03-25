#https://courses.edx.org/courses/course-v1:Microsoft+DAT203.1x+1T2017/courseware/08a07252ef4a44ff9b121d8582d0df44/751cb83c350f49a583b33b41abcc6c67/
library("AzureML")
library(ggplot2)

#ws <- workspace(
  #id = "546ef1874ab74d73bb93ff30fb82315b",
  #auth = "43750ef807244655914318cd5dee53fc",
  #api_endpoint = "https://studioapi.azureml.net"
#)
#ds <- download.datasets(
  #dataset = ws,
  #name = "Flights Challenge Result dataset"
#)
#head(ds)

dat = read.csv("C:/Users/Filip/Documents/Data Mining Experiments/DAT203_1/Flights_cleaned.csv")
head(dat)
dat = dat[complete.cases(dat),]

describe = function(df, col) {
    tmp = df[, col]
    sumry = summary(tmp)
    nms = names(sumry)
    nms = c(nms, 'std')
    out = c(sumry, sd(tmp))
    names(out) = nms
    out
}
#install.packages('gridExtra')

plotstats = function(df, col, bins = 30) {
    require(ggplot2)
    require(gridExtra)
    dat = as.factor('')
    ## Compute bin width
    bin.width = (max(df[, col]) - min(df[, col])) / bins
    ## Plot a histogram
    p1 = ggplot(df, aes_string(col)) + geom_histogram(binwidth = bin.width)
    ## A simple boxplot
    p2 = ggplot(df, aes_string(dat, col)) + geom_boxplot() + coord_flip() + ylab('')
    ## Now stack the plots
    grid.arrange(p2, p1, nrow = 2)
}

plotstats(dat, 'ArrDelay')
