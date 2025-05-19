# Getting started 
0.15*20
# Assignment of variables
a <- 1 
b = 3
print(a)
b
# press cmd+shift+enter

# Functions
ls()
log(8)
# Use () to push arguments in functions. 

log(exp(1)) # Functions evaluated from inside to out


args(log) # Gives the arguments passed 
log(8,2) # x = 8 base = 2

# Data types
class(a)

# Data frames - tables 
library(dslabs)
data("murders")
class(murders)
str(murders) # Structure of the table 
head(murders) # First 6 lines of data

# Accessing data 
murders$population #$ is used to access columns 
names(murders) # column names
pop <- murders$population #Here pop is a numeric vector 
length(pop)

# Use "" to distinguish between character vectors
e <- 1
f<- "l" # we use "" to asign characters 

# Factor data set 
class(murders$region) # Storing data catageroically 
# the catogories are 
levels(murders$region) 

state <- murders$state
class(state)

state_2 <- murders[["population"]] #this is same as state_2 <- murders$population
class(state_2)
identical(state,state_2)

table(murders$region) # murders$region gives the different factors of the data set adn then table finds the number of instances / same or different in eact factor
c<-c("a", "a", "b", "b", "b", "c", "c")
print(c)
table(c)


print(murders$region)

#===========================================================================================================================================================================================================================================

# Data types 
# 1. Vector Objects: logical, numeric, character, Complex, Integer (declared as y<- 7L *L* is used to declare integer) and Raw (Raw data types represents the sequence of bytes - how are raw bytes stored, example: v<-charToRaw("Hello"))
v<-charToRaw("Hello")
class(v)

# VECTORS 
# We use c() function to create a vector this stands for concatenate 
# Vector is the basis for everything
apple <- c("red", "figi", "hymalian", "tropical")
print(apple)
# the table command an be used to find how many times a certain object inside a vector repeats
seq(1,10) # Writes the sequence 
seq(1,10,2) # Writes skipping 2 numbers
# Use [] to access elements in vectors 
apple[2]
# OR
apple["Figi"] #This works when we have the word figi equated to something. 
apple2 <- c('figi' = 190, 'hym' = 476, 'green' = 34) #Assigning names to the elements of the vetor
# Alternate way
numbers <- c(177,444,347)
namesapple <- c('red', 'yellow', 'pink')
names(numbers) <- namesapple

print (numbers)
# now pulling based on name
numbers['pink']
# OR
apple[c("red", "figi")]

x<-1:5
as.character(x) #Converts the data type to be character forcefully - this doesn't mean that a character can be converted to a numeric value, but a number can be a character




# Lists 
list_1 <- list(c("red", "figi", "hymalian", "tropical")) # Lists can contain vectors functions and other lists
print(list_1)

list2 <- list(c(2,5,3),21.3,sin)
print(list2) # here list2 contains vectors, numeric data, functions

# matrices 
M = matrix( c('a','a','b','c','b','a'), nrow = 2, ncol = 3, byrow = TRUE) #Filled row wise
M2 = matrix( c('a','a','b','c','b','a'), nrow = 3, ncol = 2, byrow = TRUE) #Filled row wise but different dimension
print(M)
print(M2)
M3 = matrix( c('a','a','b','c','b','a'), nrow = 2, ncol = 3, byrow = FALSE)
print(M3)

# Arrays 
# Create an array.
a <- array(c('green','yellow','pink'),dim = c(3,3,3))
print(a)
# The difference between array and matrices is that arrays are 3d while matrices are 2d. 

# Factors - categorical storage of data 
# Create a vector.
apple_colors <- c('green','green','yellow','red','red','red','green', 'pink', 'pink', 'pink', 'blue', 'blue' , 'grey', 'black')

# Create a factor object.
factor_apple <- factor(apple_colors)
table(factor_apple) # TABLE CAN ONLY TAKE THE FACTORS AS ARG AND RETURN THE NUMBER OF OBJECTS UNDER EACH FACTOR ARG.
# Print the factor.
print(factor_apple)
print(nlevels(factor_apple)) #n levels prints number of levels while levels prints the levels
print(levels(factor_apple))

# Data Frame 
Colors <-data.frame(
  gender = c('Male' , 'Female', 'Male'),
  height = c(152, 171, 165),
  Color = c('black', 'brown', 'white')
)
print(Colors)

#=======================================================================================
# Importing the weather data set to use it 
# import and store the dataset in data1
# data1 <- read.csv(file.choose(), header=T)
# file.choose(): It opens a menu to choose a CSV file from the desktop.
# header: It is to indicate whether the first row of the dataset is a variable name or not. Apply T/True if the variable name is present else put F/False.

# display the data
data1

max(data1$ANNUAL)
which.max(data1$ANNUAL)
data1$YEAR[116]
rank(data1$ANNUAL)
data1$YEAR[rank(data1$ANNUAL)]

r <- rank(murders$population)
print(r)
my_df2 <- data.frame("State_Name" = murders$state,r)

my_df2


r <- rank(murders$population)
print(r)

my_df3 <- data.frame(
  murders$state, 
  r
)
my_df3
murders$state[order(my_df3$r)]

my_df4 <- data.frame(
  murders$state[order(my_df3$r)],
  sort(r)
)

my_df4

na_example

ind <- is.na(na_example)

# The name of the state with the maximum population is found by doing the following
murders$state[which.max(murders$population)]

# how to obtain the murder rate
murder_rate <- murders$total / murders$population * 100000

# ordering the states by murder rate, in decreasing order
murders$state[order(murder_rate, decreasing=TRUE)] # Passing logical arguments for functions. 


# the ! operator 
na_example
i <- is.na(na_example)
print(i)

mean(na_example[!i]) # here i represents TRUE so !i represents all the FASLE values i.e. numbers. 

# Indexing 
murder_rate
index <- murder_rate < 0.5
index

murders$state[index]

index2 <- murder_rate <= 1 & murders$region == 'West'

murders$state[index2]

# Indexing functions 

# Which gives the enters of logical vectors that are true. which(condition eg: data == 'Test')
# Match look in the entries and gives the index, match (c(a,d,c),data) finds the indexes of a,b,c in data. 
# %in% weather or not a vector in in another vector above it searches if a,b,c exits in data.

murders$state[which(murder_rate < 1 & murders$region == 'Northeast')]
mean(murder_rate)
length(which(murder_rate < mean(murder_rate)))

m <- (c('MA' , 'MO' , 'ME' , 'MO', 'MU') %in% murders$abb)
!m
notabb <- c('MA' , 'MO' , 'ME' , 'MO', 'MU')
notabb[which(!m == 'TRUE')]


library(dslabs)
data(movielens)
movielens
class(movielens$title)
class(movielens$genres)

nlevels(movielens$genres)


data(olive)
olive
which(olive$region == 'Southern Italy')
olive$palmitic[which(olive$region == 'Southern Italy')]


which(olive$region == 'Sardiina')
olive$palmitic[which(olive$region == 'Sardinia')]


which(olive$region == 'Northern Italy')
olive$palmitic[which(olive$region == 'Northern Italy')]
label <- c('Southern Italy' , 'Sardinia' , 'Northern Italy')
boxplot(olive$palmitic[which(olive$region == 'Southern Italy')], olive$palmitic[which(olive$region == 'Sardinia')], olive$palmitic[which(olive$region == 'Northern Italy')], name = label)


