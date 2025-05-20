# weatherIMD <- read.csv(choose.files(), header=T)

weatherIMD

library(tidyverse)

# adding column using mutate 
nrow(weatherIMD)

y1 <- 1:nrow(weatherIMD)
y1

y2 <- 2:nrow(weatherIMD)
y2

# Mutate used to as year on year change coloumn.
weatherIMD <- mutate(weatherIMD, y2ychange = weatherIMD$ANNUAL[y2] - weatherIMD$ANNUAL[y1] )
weatherIMD

# To filter specific data
filter(weatherIMD, y2ygrowth > 0)

# Using select to selectively extract specific columns
weathery2yIMD <- select(weatherIMD, YEAR, y2ychange)
weathery2yIMD

# Filter is for rows while select is for coloumns 


# plot(weathery2yIMD, xlab('Years'), ylab('Change w.r.t previous year') , main = 'Year on year change', pch = '20', type = 'l')

# If rank(x) gives you the ranks of x from lowest to highest, rank(-x) gives you the ranks from highest to lowest.

rank(-weathery2yIMD$y2ychange)




# We need to rank the year 2 year change from the highest to lowest
indexhigh <- sort(weathery2yIMD$y2ychange)
indexhighinserted <- mutate(weathery2yIMD , rank(-weathery2yIMD$y2ychange))

max(weathery2yIMD$y2ychange)
match(max(weathery2yIMD$y2ychange), weathery2yIMD$y2ychange)
weathery2yIMD$YEAR[40]

# Pipe operator
# The pipe operator is used to pass multiple dyplr operations at once

# select, filter, sort and mutate
data(weatherIMD)
weatherjanfeb <- select(weatherIMD, YEAR, JAN.FEB) |> mutate(YEAR, JAN.FEB, y2ychangejanfeb = weatherIMD$JAN.FEB[y2] - weatherIMD$JAN.FEB[y1]) |> filter(y2ychangejanfeb < 1)
weatherjanfeb

# Commonly used to select and then filter data 
weatherjanfeb2000s <- select(weatherjanfeb, YEAR, JAN.FEB, y2ychangejanfeb) |> filter(weatherjanfeb$y2ychangejanfeb < 1 & weatherjanfeb$YEAR >= 2000)
weatherjanfeb2000s

plot(weatherjanfeb2000s$YEAR, weatherjanfeb2000s$y2ychangejanfeb, type = 'l', pch=20, xlab = 'Year', ylab = 'Change', main = 'Change y2y in 20th Century till 2021')











