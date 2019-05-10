#########################
###Explore Data Frame###
#######################

library(ggplot2)
library(dplyr)

## Exploring Categorical Data ##
# Reading Data From .CSV
comics <- read.csv('comics.csv')

# Print the first rows of the data
comics[1,]

# print the first 5 rows of the data using head()
head(comics, 5)

# Check the structure of the data
str(comics)

# Check levels of align
levels(comics$align)

# Check levels of gender
levels(comics$gender)

# Create a 2-way contingency table: tab
tab <- table(comics$align,comics$gender )

# Bar Chart
ggplot(comics, aes(x = gender, fill = align)) +
  geom_bar()

# Filter the data that has the fewest total of 'Align' entries
comics_filtered <- comics %>%
  filter(align != 'Reformed Criminals') %>%
  droplevels()

# Create side-by-side barchart of alignment by gender
ggplot(comics, aes(x = align, fill = gender)) + 
  geom_bar(position = 'dodge') +
  theme(axis.text.x = element_text(angle = 90))

# From counts to proportions
prop.table(tab,1) # condition on row
prop.table(tab,2) # condition on column

# Approximately what proportion of all female characters are good?
prop.table(tab,2)[2,1]

# Stack Bar Chart
ggplot(comics, aes(x = gender, fill = align)) +
  geom_bar(position = "fill")

ggplot(comics, aes(x = align, fill = gender)) +
  geom_bar(position = "fill")

# Checking distribution
# comics$align <- factor(comics$align, 
#                        levels = c('Bad', 'Neutral', 'Good'))

ggplot(comics, aes(x = align)) + 
  geom_text(stat = "count",
            aes(label = ..count..), vjust = -1) +
  geom_bar()

# Plot of alignment broken down by gender
ggplot(comics, aes(x = align)) + 
  geom_bar() +
  facet_wrap(~ gender)

## Exploring Numerical Data ##
cars <- read.csv('cars04.csv')

# Learn data structure
str(cars)

# Plot a histogram of city_mpg faceted by suv, 
# a logical variable indicating whether the car is an SUV or not.
ggplot(cars, aes(x = city_mpg)) +
  geom_histogram() + 
  facet_wrap(~ suv)

# A quick look at unique(cars$ncyl) shows that there are more 
# possible levels of ncyl than you might think. 
# Here, restrict your attention to the most common levels.

# Filter cars with 4, 6, 8 cylinders
common_cyl <- filter(cars, ncyl %in% c(4, 6, 8))

# Create box plots of city mpg by ncyl
ggplot(common_cyl, aes(x = as.factor(ncyl), y = city_mpg)) +
  geom_boxplot()

# Create overlaid density plots for same data
ggplot(common_cyl, aes(x = city_mpg, fill = as.factor(ncyl))) +
  geom_density(alpha = .3)

# Which of the following interpretations of the plot is not valid?
# a. The typical 4 cylinder car gets better mileage than # the typical 6 cylinder car
# b. The variability in mileage of 8 cylinder cars is similar to the variability in mileage of 4 cylinder cars.

# Create a histogram of the distribution of horsepwr across all cars 
# and add an appropriate title. Start by piping in the raw dataset.
cars %>%
  ggplot(aes(horsepwr)) +
  geom_histogram() +
  ggtitle('horsepwr')

# Create a second histogram of the distribution of horsepower, 
# but only for those cars that have an msrp less than $25,000. 
# Keep the limits of the x-axis so that they're similar to that of the first plot, 
# Experiment with the bin 
# and add a descriptive title.
cars %>% 
  filter(msrp<25000) %>%
  ggplot(aes(horsepwr)) +
  geom_histogram(bins=50) +
  xlim(c(90, 550)) +
  ggtitle('hrspwr')

# Construct box plot of msrp
cars %>%
  ggplot(aes(x = 1, y = msrp)) +
  geom_boxplot()

# Exclude outliers from data
cars_no_out <- cars %>%
  filter(msrp<100000)

# Construct box plot of msrp using the reduced dataset
cars_no_out %>%
  ggplot(aes(x = 1, y = msrp)) +
  geom_boxplot()

## Summarize Numerical Data ##
gapminder <- read.csv('gapminder.csv')

# Create a dataset called gap2007 that contains only data from the year 2007.
gap2007 <- filter(gapminder, year==2007)

# Using gap2007, calculate the mean and median life expectancy for 
# each country. Don't worry about naming the new columns produced by summarize().
gap2007 %>%
  group_by(cont) %>%
  summarize(mean(life_exp),
            median(life_exp),
            var(life_exp),
            sd(life_exp))

# Confirm the trends that you see in the medians by 
# generating side-by-side box plots of life expectancy for each continent.
gap2007 %>%
  ggplot(aes(x = cont, y = life_exp, fill=cont)) +
  geom_boxplot()

# Checking distribution
gap2007 %>%
  ggplot(aes(x = life_exp, fill=cont)) +
  geom_density(alpha=.3)

# Filtering data
# Filter for Asia, add column indicating outliers
gap_asia <- gap2007 %>%
  filter(cont == "Asia") %>%
  mutate(is_outlier = life_exp < 50)

# Remove outliers, create box plot of lifeExp
gap_asia %>% 
  filter(!is_outlier) %>%
  ggplot(aes(x = 1, y = life_exp)) +
  geom_boxplot()