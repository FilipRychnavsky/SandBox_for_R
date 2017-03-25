
library("AzureML")
ws <- workspace()
dat <- download.intermediate.dataset(
  ws,
  experiment = "546ef1874ab74d73bb93ff30fb82315b.f-id.b5d091662c724124b94205867566776c",
  node_id = "17b5bd32-22d5-42db-9228-8b29fc80b841-1475",
  port_name = "Results dataset",
  data_type_id = "GenericCSV"
)

head(dat)

summary(dat)

describe = function(df, col){
  tmp = df[, col]
  sumry = summary(tmp)
  nms = names(sumry)
  nms = c(nms, 'std')
  out = c(sumry, sd(tmp))
  names(out) = nms
  out
}


describe(dat, 'ArrDelay')

sd(dat[, 'ArrDelay'])

sd(dat[, 'ArrDelay'], na.rm=TRUE)

sd(dat[, 'ArrDelay'], na.rm=FALSE)

install.packages('ggplot2')
install.packages('gridExtra')

require(ggplot2)
require(gridExtra)

## Compute bin width
df <- dat
bins = 30
bin.width = (max(df[, 'ArrDelay']) - min(df[, 'ArrDelay']))/ bins

col = 'ArrDelay'

## Plot a histogram
p1 = ggplot(df, aes_string(col)) + geom_histogram(binwidth = bin.width)

grid.arrange(p1, nrow = 2)

## A simple boxplot
dat2 = as.factor('')
p2 = ggplot(df, aes_string(dat2, col)) + geom_boxplot() + coord_flip() + ylab('')

## Now stack the plots
grid.arrange(p2, nrow = 1)

grid.arrange(p2, p1, nrow = 2)

plotstats <- function(df, col, bins = 30){
   require(ggplot2)
   require(gridExtra)
   dat = as.factor('')
   
   ## Compute bin width
   bin.width = (max(df[, col]) - min(df[, col]))/ bins

   ## Plot a histogram
   p1 = ggplot(df, aes_string(col)) +
     geom_histogram(binwidth = bin.width)
   
   ## A simple boxplot
   p2 = ggplot(df, aes_string(dat, col)) +
     geom_boxplot() + coord_flip() + ylab('')
   
   ## Now stack the plots
   grid.arrange(p2, p1, nrow = 2)
}

plotstats(dat, 'ArrDelay')

## Function to plot conditioned histograms
install.packages('gridExtra')
options(repr.plot.width=6, repr.plot.height=3)
Plotting_Delays = function(x) {
  library(ggplot2)
  library(gridExtra)
  ## Compute the bin width
  rg = range(dat[,x])
  bw = (rg[2] - rg[1])/30
  ## Define the title
  title <- paste("Histogram of", x, "conditioned on type of ArrDel15 ")
  ##ArrDel15 column, which is a binary column indicating whether a flight arrived 15 or more minutes late.
  ## Create the histogram
  ggplot(dat, aes_string(x)) +
    geom_histogram(aes(y = ..count..), binwidth = bw) +
    facet_grid(. ~ ArrDel15 ) +
    ggtitle(title) 
}

## Create histograms for specified features.
plot.cols2 = c("DepDelay",
               "CRSArrTime",
               "CRSDepTime",
               "DayofMonth",
               "DayOfWeek",
              "Month")
lapply(plot.cols2, Plotting_Delays)

install.packages('gridExtra')
 install.packages('ggplot2')

## Scatter plot using color to differentiate points
Scatter_Flights_conditioned = function(x) {
    require(ggplot2)
    library(gridExtra)
    title = paste("ArrDelay vs.", x, 'with color by ontime vs late (ArrDel15)')
    ggplot(dat, aes_string(x, 'ArrDelay')) +
        geom_point(aes(color=factor(ArrDel15))) +
        ggtitle(title)
}

options(repr.plot.width=8, repr.plot.height=6)

## Define columns for making scatter plots
plot.cols3 = c("DepDelay",
               "CRSArrTime",
               "CRSDepTime",
               "DayofMonth",
               "DayOfWeek",
              "Month")

lapply(plot.cols3, Scatter_Flights_conditioned)    


