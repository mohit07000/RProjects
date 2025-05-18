# Importing the weather data set to use it
# import and store the dataset in data1
# weatherimport <- read.csv(file.choose(), header=T)
# file.choose(): It opens a menu to choose a CSV file from the desktop.
# header: It is to indicate whether the first row of the dataset is a variable name or not. Apply T/True if the variable name is present else put F/False.

weatherimport

sort(weatherimport$ANNUAL)
order(weatherimport$ANNUAL)
weatherimport$YEAR[order(weatherimport$ANNUAL)]

weatherimport$YEAR[c(1:5)]

class(weatherimport)

annualvec <- c(weatherimport$ANNUAL)
class(annualvec)

tempindex <- sort(annualvec)

weatherindex <- c(weatherimport$year)

names(tempindex) <- weatherindex

print(tempindex)