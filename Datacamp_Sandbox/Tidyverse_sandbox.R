# https://campus.datacamp.com/courses/introduction-to-the-tidyverse/data-wrangling-1?ex=2
#install.packages("gapminder")
# Load the gapminder package

library(gapminder)
 
# Load the dplyr package
library(dplyr)

# Look at the gapminder dataset
gapminder
# Filter for the year 1957, then arrange in descending order of population

gapminder %>% filter(year == 1957) %>% arrange(desc(pop))
head(gapminder)
