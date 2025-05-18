# Importing the weather data set to use it
# import and store the dataset in data1
# weatherimport <- read.csv(file.choose(), header=T)
# file.choose(): It opens a menu to choose a CSV file from the desktop.
# header: It is to indicate whether the first row of the dataset is a variable name or not. Apply T/True if the variable name is present else put F/False.

weatherimport

sort(weatherimport$ANNUAL)
order(weatherimport$ANNUAL)
weatherimport$YEAR[order(weatherimport$ANNUAL)]

# Alternative Sort - retrieving the years column and the annual weather data and then putting them into 2 seperate vectors. 

class(weatherimport)

annualvec <- c(weatherimport$ANNUAL)
class(annualvec)
print(annualvec)
tempindex <- sort(annualvec)

years <- weatherimport$YEAR[c(1:length(weatherimport$YEAR))]
print(years)



names(years) <- annualvec
print(years)

sortedannualvec <- order(annualvec)
print(sortedannualvec)

years[sortedannualvec]