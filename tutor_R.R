## Arithmetic in R
# Calculate 3 + 4
3+4
# Calculate 6 + 12
6+12
# Calculate 5 + 5
5+5
# calculate 5 - 5
5-5
# calculate 3 * 5
3*5
# calculate (5 + 5) / 2 
(5+5)/2
## Variable Assignment
# Assign the value 42 to x
x <- 42

# Print out the value of the variable x
x

# Assign the value ACT_Jaya to y. Don't forget to use ''
y <- 'ACT_Jaya'

# Print out the value of the variable y
y

## Data Types
# Declare variables of different types
my_numeric <- 42
my_character <- "universe"
my_logical <- FALSE 

# Check class of my_numeric
class(my_numeric)

# Check class of my_character
class(my_character)
# Assign a value to the variables 5 to my_oranges and 6 to my_apples. 
# Add those two variables and assign it to my_fruit
# Check class of my_fruit
my_oranges <- 5
my_apples <- 6
my_fruits <- my_oranges + my_apples

## Create a vector
# Profit from Monday to Friday
# Monday: 140
# Tuesday: -50
# Wednesday: 20
# Thursday: -120
# Friday: 240
profit <- c(140,-50,20,-120,240)
profit 

# Giving name to vector
names(profit) <- c("Monday", "Tuesday", "Wednesday", "Thursday", "Friday")
profit

# Or
day <- c("Monday", "Tuesday", "Wednesday", "Thursday", "Friday")
names(profit) <- day
profit

# Company A and B profits from Monday to Friday:
profit_A <- c(140, -50, 20, -120, 240)
profit_B <- c(-24, -50, 100, -350, 10)
days_vector <- c("Monday", "Tuesday", "Wednesday", "Thursday", "Friday")

# Give name to the vector profit_A and profit_B
names(profit_A) <- days_vector
names(profit_B) <- days_vector

# Assign to total_daily how much profit on each day
total_daily <- profit_A + profit_B

# Calculate total gains and average for Company A and B (use sum() and mean())
mean(sum(profit_A,profit_B))

# Vector selection for company A
profit_A[1]
profit_A[2:3]
profit_A[-1]
profit_A[c('Wednesday','Friday')]
profit_A['Monday']

# Find the loss value of company B
profit_B[profit_B < 0]

## Matrix
# Construct a matrix with 3 rows containing the numbers 1 up to 9, 
# filled row-wise
matrix(1:9, byrow = TRUE, nrow = 3)

# Box office Star Wars (in millions!)
new_hope <- c(460.998, 314.4)
empire_strikes <- c(290.475, 247.900)
return_jedi <- c(309.306, 165.8)

# Create box_office
box_office <- c(new_hope, empire_strikes, return_jedi)
box_office

# Construct star_wars_matrix
star_wars_matrix <- matrix(box_office, byrow=T, nrow=3)
star_wars_matrix

# Vectors region and titles, used for naming
region <- c("US", "non-US")
titles <- c("A New Hope", "The Empire Strikes Back", "Return of the Jedi")

# Name the columns with region
colnames(star_wars_matrix)<-region

# Name the rows with titles
rownames(star_wars_matrix)<-titles

# Print out star_wars_matrix
star_wars_matrix

# Calculate Worldwide Star wars box office figures
worldwide_vector <- rowSums(star_wars_matrix)
worldwide_vector

# Add worldwide_vector as new column to star war matrix, assign it to
# all_wars_matrix
all_wars_matrix <- cbind(star_wars_matrix,worldwide_vector)

# Change the name of worldwide_vector
colnames(all_wars_matrix)[colnames(all_wars_matrix) == "worldwide_vector"] <- "Worldwide"

# Print all_wars_matrix
all_wars_matrix

# Box office II Star Wars (in millions!)
phantom_manace <- c(474.5, 552.5)
attack_of_the_clone <- c(310.7, 338.7)
revenge_of_the_sith <- c(380.3, 468.5)

# Create box_office_II
box_office_II <- c(phantom_manace, attack_of_the_clone, revenge_of_the_sith)
box_office_II

# Construct star_wars_matrix_II
star_wars_matrix_II <- matrix(box_office, byrow=T, nrow=3)
star_wars_matrix_II

# Vectors region and titles, used for naming
region <- c("US", "non-US")
titles <- c("Phantom Manace", 
            "Attack of the Clone", 
            "Revenge of the Sith")

# Name the columns with region
colnames(star_wars_matrix_II)<-region

# Name the rows with titles
rownames(star_wars_matrix_II)<-titles

# Print out star_wars_matrix_II
star_wars_matrix_II

# Calculate Worldwide Star wars box office figures
worldwide <- rowSums(star_wars_matrix_II)
worldwide

# Add worldwide as new column to star war matrix, assign it to
# all_wars_matrix_II
all_wars_matrix_II <- cbind(star_wars_matrix_II,worldwide)

# Add star_wars_matrix_II as new row to star war matrix, assign it to
# all_wars_matrix_new
all_wars_matrix_new <- rbind(all_wars_matrix,all_wars_matrix_II)
all_wars_matrix_new

##DataFrame
# Definition of vectors
name <- c("Mercury", "Venus", "Earth", "Mars", "Jupiter", "Saturn", "Uranus", "Neptune")
type <- c("Terrestrial planet", "Terrestrial planet", "Terrestrial planet", 
          "Terrestrial planet", "Gas giant", "Gas giant", "Gas giant", "Gas giant")
diameter <- c(0.382, 0.949, 1, 0.532, 11.209, 9.449, 4.007, 3.883)
rotation <- c(58.64, -243.02, 1, 1.03, 0.41, 0.43, -0.72, 0.67)
rings <- c(FALSE, FALSE, FALSE, FALSE, TRUE, TRUE, TRUE, TRUE)

# Create a data frame from the vectors, assign it to planets_df
planets_df <- data.frame(name,type,diameter,rotation,rings)
planets_df

# Check the structure of planets_df
str(planets_df)

# Print out diameter of Mercury (row 1, column 3)
planets_df[1,3]

# Print out data for Mars (entire fourth row)
planets_df[4,]

# Select first 5 values of diameter column
planets_df[1:5,3]

# Use the $ sign to select all element in a certain column
planets_df$diameter

# Select planets with diameter < 1
subset(planets_df, subset = diameter<1)

## List
# Vector with numerics from 1 up to 10
my_vector <- 1:10 

# Matrix with numerics from 1 up to 9
my_matrix <- matrix(1:9, ncol = 3)

# First 10 elements of the built-in data frame mtcars
my_df <- mtcars[1:10,]

# Construct list with these different elements: my_list
my_list <- list(my_vector,my_matrix,my_df)



