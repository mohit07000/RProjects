# weatherIMD <- read.csv(file.choose(), header=T)

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
filter(weatherIMD, y2ychange > 0)

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

# plot(weatherjanfeb2000s$YEAR, weatherjanfeb2000s$y2ychangejanfeb, type = 'l', pch=20, xlab = 'Year', ylab = 'Change', main = 'Change y2y in 20th Century till 2021')


data("murders")
murders
mystates <- murders |> mutate(murder_rate, murder_rank = rank(-murder_rate)) |> select(state, region, murder_rank) |> filter(region == 'West' | region == 'Northeast')

mystates

#|> select(state, murder_rate, murder_rank)

# Summarize data 
# group_by and Summarize 

library(tidyverse)

# Summarize 
summarise(weatherjanfeb, 
          minimum = min(weatherjanfeb$JAN.FEB),
          median = median(weatherjanfeb$JAN.FEB),
          maximum = max(weatherjanfeb$JAN.FEB)
          )

quantile(weatherjanfeb$JAN.FEB, c(0,0.25,0.5,0.75,0.90,1)) # Here the vector c() helps us to get specific quarters of the data. 

quatersum <- function(x){
  q <- quantile(x,c(0,0.5,1))
  data_frame(minmum = q[1],
             median = q[2],
             maximum = q[3]
             )
}

quatersum(weatherjanfeb$JAN.FEB)
# converting the output from data frame to a nuneric 
minmedmax <- function(x){
  q <- quantile(x,c(0,0.5,1))
  data_frame(minimum = q[1],
             median = q[2],
             maximum = q[3],
  )
}
help("summarise")
# Now the class is a numeric 
m <- minmedmax(weatherjanfeb$JAN.FEB)
m
class(m)
class(pull(m))
n <- pull(m)
# The data type change to numeric 

# the group by function is used to categorize data be specific factors. 
# Example, if we want to group by positive increase years and negative increase years we can use the group by - first lets filter the positive groups and negative groups
poschange <- weatherIMD |> filter(y2ychange > 0) |> mutate(Netrate = '+')
poschange

negchange <- weatherIMD |> filter(y2ychange < 0) |> mutate(Netrate = '-')
negchange

#dplyr sorting 
# help("head") # Head returns the first 4-5 rows only 

# The arrange sorting function allows us to sort a specific column the difference is that here we don't need to mention the parent data frame, this is similar to sort() or rank() but is used in |> operations. 
# This also allows nested sorting, that is arrange(sort by condition 1, then sort again by condition 2)
# arrange(desc()) allows sorting in the reverse direction. 

# The top_n(column,number) allows us to display the first x number of rows of the specific column - more granular control than the head() function. 


# Working with a new data set, 
# UKRailRide <- read.csv(file.choose(), header=T)
UKRailRide










