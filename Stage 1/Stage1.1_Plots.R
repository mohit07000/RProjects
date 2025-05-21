# Basic Pots

# IMDData <- read.csv(file.choose(),header = T)


IMDData

# Extracting and plotting data 

# Creating a yearly annual data recods 

IMDweatherannual <- data.frame(
  Year = IMDData$YEAR,
  Temp = IMDData$ANNUAL
)

IMDweatherannual
#plot(IMDweatherannual$Year,IMDweatherannual$Temp, main = "Annual Weather data", xlab = 'Year', ylab = 'Temperature', pch=20, type = 'l')
#plot(IMDweatherannual$Year,IMDweatherannual$Temp, main = "Annual Weather data", xlab = 'Year', ylab = 'Temperature', pch=20, type = 'h')


# Comparing the quarterly weather data 

# Extracting and implementing it direclty into the boxpot 

label = c('Jan-Feb', 'Mar-May', 'Jun-Sep', 'Oct-Dec')
#boxplot(IMDData$JAN.FEB,
#        IMDData$MAR.MAY,
#        IMDData$JUN.SEP,
#        IMDData$OCT.DEC,
#        names = label
#)


# install.packages('dplyr')
library(dplyr)
#help(dplyr)
# browseVignettes(package = "dplyr")

# using dplyr 

# Filtering 

gtr24deg <- filter(IMDData, IMDData$ANNUAL > 25) |>  select(YEAR, JAN.FEB)
gtr24degJanFeb <- filter(IMDData, IMDData$JAN.FEB < 19) |>  select(YEAR, JAN.FEB)

gtr24deg
gtr24degJanFeb

# See more in Data Wrangling later 




