########################
###Relational Operator##
########################

#Equality and Inequality
#Write R code to see if TRUE equals FALSE.
TRUE == FALSE
#Check if -6 * 14 is not equal to 17 - 101.
-6*14 != 17-101
#Ask R whether the strings "useR" and "user" are equal.
'useR' == 'user'
#Compare logicals to numerics: are TRUE and 1 equal?
TRUE == 1 

#Greater and less than
#-6 * 5 + 2 is greater than or equal to -10 + 1.

#"raining" is less than or equal to "raining dogs".

#TRUE is greater than FALSE.


#Compare Vector
#Using relational operators, find a logical answer, i.e. TRUE or FALSE
#The data is number of visit from Monday to Sunday
linkedin <- c(16, 9, 13, 5, 2, 17, 14)
facebook <- c(17, 7, 5, 16, 8, 13, 14)

#On which days did the number of LinkedIn profile views exceed 15?
linkedin > 15
#When was your LinkedIn profile viewed only 5 times or fewer?
linkedin <= 5
#When was your LinkedIn profile visited more often than your Facebook profile?
linkedin > facebook

#Compare matrices
#Use the views matrix to return a logical matrix.
linkedin <- c(16, 9, 13, 5, 2, 17, 14)
facebook <- c(17, 7, 5, 16, 8, 13, 14)
views <- matrix(c(linkedin, facebook), nrow = 2, 
                byrow = TRUE,
                dimnames = list(c('linkedin','facebook')
                ))
colnames(views) <-  c('monday','tuesday','wednesday','thrusday','friday',
                  'saturday','sunday')

# When were the views exactly equal to 13? 
views == 13
# For which days were the number of views less than or equal to 14?
views <= 14

########################
####Logical Operator####
########################

# & and |
# The linkedin and last variable are already defined for you
linkedin <- c(16, 9, 13, 5, 2, 17, 14)
facebook <- c(17, 7, 5, 16, 8, 13, 14)
last <- tail(linkedin, 1)
views <- matrix(c(linkedin, facebook), nrow = 2, 
                byrow = TRUE,
                dimnames = list(c('linkedin','facebook')
                ))
colnames(views) <-  c('monday','tuesday','wednesday','thrusday','friday',
                      'saturday','sunday')

# Is last under 5 or above 10?
last < 5 | last > 10

# Is last between 15 and 20, excluding 15 but including 20?
last > 15 & last <= 20

# When did LinkedIn views exceed 10 and did Facebook views fail to reach 10 for a particular day? Use the linkedin and facebook vectors.
linkedin > 10 & facebook < 10

# When were one or both of your LinkedIn and Facebook profiles visited at least 12 times?
linkedin >=12 | facebook >= 12

# When is the views matrix equal to a number between 11 and 14, excluding 11 and including 14?
views > 11 & views <= 14


########################
######IF and ELSE#######
########################

medium <- "LinkedIn"
num_views <- 14

# Create IF ELSE statement to print "Showing LinkedIn information"
# if medium is equal to "LinkedIn"
# print "Showing Facebook information" if medium is equal to "Facebook"
# else print "Unknown medium"
if (medium == "LinkedIn") {
  print("Showing LinkedIn information")
  } else if (medium == "Facebook") {
  print("Showing Facebook information")
  } else {
  print("Unknown medium")
  }

# Print "You're popular!" if num_views is greater than 15
# "Your number of views is average" is printed if num_views is between 15 (inclusive) and 10 (exclusive). 
# else print "Try to be more visible!"
if (num_views > 15) {
  print("You're popular!")
  } else if (num_views <= 15 & num_views > 10) {
  print("Your number of views is average")
  } else {
  print("Try to be more visible!")
  }

# If both li and fb are 15 or higher, set sms equal to double the sum of li and fb.
# If both li and fb are strictly below 10, set sms equal to half the sum of li and fb.
# In all other cases, set sms equal to li + fb.
li <- 15
fb <- 9

if (li >=15 & fb >=15) {
  sms <- 2 * (li + fb)
  } else if (li <10 & fb <10) {
  sms <- 0.5 * (li + fb)
  } else {
  sms <- li+fb
  }

sms


######################
######FOR loop#######
####################

linkedin <- c(16, 9, 13, 5, 2, 17, 14)

# Code the for loop with conditionals
for (li in linkedin) {
  if (li > 10 ) {
    print("You're popular!")
  } else {
    print("Be more visible!")
  }
  print(li)
}

#Break the loop
for (li in linkedin) {
  if (li > 10 ) {
    print("You're popular!")
  } else {
    print("Be more visible!")
  }
  if (li > 16) {
    print("This is ridiculous, I'm outta here!")
    break
  }
}

#Next the loop
for (li in linkedin) {
  if (li > 10 ) {
    print("You're popular!")
  } else {
    print("Be more visible!")
  }
  if (li > 16) {
    print("This is ridiculous, I'm outta here!")
    break
  }
  if (li < 5) {
    print("This is too embarrassing!")
    next
  }  
  print(li)
}

#Looping Practice
# Pre-defined variables
rquote <- "r's internals are irrefutably intriguing"
chars <- strsplit(rquote, split = "")[[1]]

print(chars)

# Initialize rcount
rcount <- 0

# Finish the for loop
for (char in chars) {
  if (char == "r"){
    rcount<-rcount + 1
  }
  if (char == "u"){
    break 
  }
}

# Print out rcount
rcount


######################
######Function#######
####################

linkedin <- c(16, 9, 13, 5, 2, 17, 14)
facebook <- c(17, 7, 5, 16, 8, 13, 14)

# Calculate average number of views
avg_li <- mean(linkedin)
avg_fb 

# Calculate standard deviation of views using sd() function

# Writing Your Own Function
# Create a function pow_two(): it takes one argument and returns that number squared (that number times itself).
pow_two<-function(x){
  a<-x*x
  return(a)
}

# Call this newly defined function with 12 as input.
pow_two(12)

# Next, create a function sum_abs(), that takes two arguments and returns the sum of the absolute values of both arguments.
sum_abs<-function(a,b){
  x<-abs(a)+abs(b)
  return(x)
}

# Finally, call the function sum_abs() with arguments -2 and 3 afterwards.
sum_abs(-2,3)

# lapply()
# The vector pioneers has already been created for you
pioneers <- c("GAUSS:1777", "BAYES:1702", "PASCAL:1623", "PEARSON:1857")

# Split names from birth year
split_math <- strsplit(pioneers, split = ":")

# Convert to lowercase strings: split_low
split_low<-lapply(split_math,tolower)

# Flatten it to a single vector
unlist(split_low)

# Take a look at the structure of split_low
str(split_low)

# Write function select_first() where it selects the first element
select_first <- function(x) {
  x[1]
}

# Apply select_first() over split_low and flatten it: names
names<-lapply(split_low,select_first)
unlist(names)

# Transform: use anonymous function inside lapply
names<-lapply(split_low,function(x){x[1]})
unlist(names)

# Use lapply with additional arguments
multiply <- function(x, factor) {
            x * factor
}

# Let factor be equal to 2
unlist(lapply(list(1,2,3), function(x, factor) {x * factor}, factor=2))

# Practice
pioneers <- c("GAUSS:1777", "BAYES:1702", "PASCAL:1623", "PEARSON:1857")
split_math <- strsplit(pioneers, split = ":")
split_low<-lapply(split_math,tolower)
# Write a function where if the number of characters of name is 
# greater than 5 then return NULL for the name. 
# Else, return the birth year. 
# Put the function anonymously in lapply. 

lapply(split_low, function(x) {
  if (nchar(x[1]) > 5) {
    return(NULL)
  } else {
    return(x[2])
  }
})

######################
######Utilities######
####################

# Data Utilities
# seq()
seq(1, 10, by = 3)

# Create a sequential from 100 to 200 with increment of 10
seq(100, 200, by = 10)

# replicate()
rep(c(8, 6, 4, 2), times = 2)

# replicate ACT, Jaya, Selalu by 2 times
rep(c('ACT','Jaya','Selalu'), times=2)

# The linkedin and facebook lists have already been created for you
linkedin <- list(16, 9, 13, 5, 2, 17, 14)
facebook <- list(17, 7, 5, 16, 8, 13, 14)

# Convert both linkedin and facebook lists to a vector, and store them as li_vec and fb_vec respectively.
li_vec<-unlist(linkedin)
fb_vec<-unlist(facebook)

# Next, append fb_vec to the li_vec (Facebook data comes last). Save the result as social_vec.
social_vec<-append(li_vec,fb_vec)

# Finally, sort social_vec from high to low. Print the resulting vector.
sort(social_vec, decreasing=T)

# use sub() and gsub () on animals:
animals <- c("cat", "moose", "impala", "ant", "kiwi")
sub(pattern = "a", replacement = "o", x = animals)
gsub(pattern = "a", replacement = "o", x = animals)

# Practice
awards <- c("Won 1 Oscar.",
            "Won 1 Oscar. Another 9 wins & 24 nominations.",
            "1 win and 2 nominations.",
            "2 wins & 3 nominations.",
            "Nominated for 2 Golden Globes. 1 more win & 2 nominations.",
            "4 wins & 1 nomination.")

sub(".*\\s([0-9]+)\\snomination.*$", "\\1", awards)

# .*: It can be read as "any character that is matched zero or more times".
# \\s: Match a space. The "s" is normally a character, escaping it (\\) makes it a metacharacter.
# [0-9]+: Match the numbers 0 to 9, at least once (+).
# ([0-9]+): The parentheses are used to make parts of the matching string available to define the replacement. 
# The \\1 in the replacement argument of sub() gets set to the string that is captured by the regular expression [0-9]+

##########################
######Date and Time######
########################

# Check the date and time today
Sys.Date()
Sys.time()

# Date Format
# %Y: 4-digit year
# %y: 2-digit year 
# %m: 2-digit month 
# %d: 2-digit day of the month 
# %A: weekday 
# %a: abbreviated weekday 
# %B: month 
# %b: abbreviated month 

# Practice
str1 <- "May 23, '96"
str2 <- "2012-03-15"
str3 <- "30/January/2006"

# Convert the strings to dates: date1, date2, date3
date1 <- as.Date(str1, format = "%b %d, '%y")
date2 <- as.Date(str2, format = "%Y-%m-%d")
date3 <- as.Date(str3, format = "%d/%B/%Y")

# Convert dates to formatted strings
# From the first date, select the weekday. 
format(date1, "%A")
# From the second date, select the day of the month. 
format(date2, "%d")
# From the third date, you should select the abbreviated month and the 4-digit year, separated by a space.
format(date3, "%b %Y")

# Time Format
# %H: hours as a decimal number
# %I: hours as a decimal number
# %M: minutes as a decimal number
# %S: seconds as a decimal number
# %T: shorthand notation for the typical format %H:%M:%S
# %p: AM/PM indicator

# Practice
str1 <- "May 23, '96 hours:23 minutes:01 seconds:45"
str2 <- "2012-3-12 14:23:08"

# Convert two strings that represent timestamps, str1 and str2, to POSIXct objects called time1 and time2.
time1 <- as.POSIXct(str1, format = "%B %d, '%y hours:%H minutes:%M seconds:%S")
time2<- as.POSIXct(str2, format = "%Y-%m-%d %H:%M:%S")

# Using format(), create a string from time1 containing only the minutes.
format(time1, "%M")
format(time2, "%I:%M %p")

# Date Calculation
# Creating the example date
day = as.Date(c("2019-01-03","2019-01-06","2019-01-13",
                "2019-01-14","2019-01-16"), format = "%Y-%m-%d") 
names(day) <- c('day1','day2','day3','day4','day5')
day

# Difference between last and first day
day[5]-day[1]

# Create differences between consecutive days: day_diff
# Use diff() function
day_diff<-diff(day)
day_diff

# Average period between two consecutive days
mean(day_diff)

#######################
######R Packages#######
######################

# ggplot package
# Load the ggplot2 package
library(ggplot2)

# Check the mtcars description
?mtacrs

# Check the mtcars data using head()
head(mtcars)

# Use the qplot() function on mtcars$wt and mtcars$hp
qplot(mtcars$wt, mtcars$hp)

