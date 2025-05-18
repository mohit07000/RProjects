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
help("log")

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
# We use c() function to create a vector
apple <- c("red", "figi", "hymalian", "tropical")
print(apple)
# the table command an be used to find how many times a certain object inside a vector repeats

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
help("matrix")
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