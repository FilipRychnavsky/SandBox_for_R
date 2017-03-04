# To install missing packages
# install.packages("AzureML")
#install.packages("repr")
library("AzureML")
library("repr")
#ws <- workspace(
  #id = "546ef1874ab74d73bb93ff30fb82315b",
  #auth = "43750ef807244655914318cd5dee53fc",
  #api_endpoint = "https://studioapi.azureml.net"
#)
#ds <- download.datasets(
  #dataset = ws,
  #name = "Adult Census Income Binary Classification dataset"
#)
#head(ds)

#library("AzureML")
#ws = workspace()
#Income = download.datasets(ws, "Adult Census Income Binary Classification dataset")
#str(Income)

if (file.exists("~/.azureml/settings.json")) {
    ws <- workspace()
} else {
    ws <- workspace(
    id = "546ef1874ab74d73bb93ff30fb82315b",
    auth = "43750ef807244655914318cd5dee53fc",
    api_endpoint = "https://studioapi.azureml.net"
    )
}
ds <- download.datasets(
dataset = ws,
name = "Adult Census Income Binary Classification dataset"
)

library("AzureML")
#ws = workspace()
Income = download.datasets(ws, "Adult Census Income Binary Classification dataset")
str(Income)

## Bar plot of categorical features
bar.income = function(x){
  library(ggplot2)
  if(!is.numeric(Income[,x])) {
    capture.output(
      plot( ggplot(Income, aes_string(x)) +
               geom_bar() + 
               facet_grid(. ~ income) + 
               theme(axis.text.x=element_text(angle=90,hjust=1,vjust=0.5)) +
               ggtitle(paste("Counts of income level by",x))))
      }
    }

## Set up plot area
library(repr)
options(repr.plot.width=8, repr.plot.height=4)

## Features to plot
name.list = function(x) {
  names = names(x)
  len = length(names)
  names[-len]
}

feature.names = name.list(Income)
lapply(feature.names, bar.income)

## Create Box plot of numeric features 
box.income = function(x){
  library(ggplot2)
  if(is.numeric(Income[,x])) {
    capture.output(
      plot( ggplot(Income, aes_string('income', x)) +
              geom_boxplot() +
              ggtitle(paste("Counts of income level by",x))))
  }}

lapply(feature.names, box.income)
