###### dataframes ########
  # quite like pandas dataframe

names = c('ravi', 'Tanu', 'Rashi', 'Abhay', 'Zaid')
roll = c(12, 34, 21, 78, 49)
marks = c(92, 98, 93, 94, 95)
students = data.frame(roll, names, marks)
print(students)

# local variables names, roll, marks 
studs=data.frame(names = c('ravi', 'Tanu', 'Rashi', 'Abhay', 'Zaid'),
                 roll = c(12, 34, 21, 78, 49),
                 marks = c(92, 98, 93, 94, 95))

print(studs)
class(studs) # data.frame 


  # works akin to a relational database table

# index and access dataframeName([row, column])
print(studs[1]) # default: column 1 - name
print(studs[,1) # column 2 - roll number
print(studs[1,]) # prints the 1st row!

print( , studs[1]) # error, but sir says it should work

print(studs[1,3])

    # slicing
print(studs[1:3, ]) # first three rows
print(studs[, 1:2])  # first two columns 

# filtering rows
print(studs)
print(studs[studs$marks > 93,]) # comma is important or error

  # subset function - works on rows only
subset(studs, marks  >93)

# add a new row/column
  # 1. directly via $ and <-
studs$result<- ifelse(studs$marks>=85, "Pass", "Fail")

print(studs[studs$result == "Pass",])

  # 2. rbind
studs = rbind(studs, c('riya', 15, 94, 'Pass')) # in-place assignment
studs

  # 3. cbind 

# update row/column
studs$marks <- studs$marks -  1 # error bc marks column is stored as character somehow
class(studs$marks)
studs$marks = as.numeric(studs$marks) + 2
studs$marks

# Remove a column 
studs$result <- NULL
studs

# remove a row 
studs <- studs[-2,]
print(studs)

# explore the dataset
summary(studs) # descriptive stats for numeric columns
str(studs)

colnames(studs)
head(studs) # default - first 6 records
tail(studs) # last 6 records

head(studs, n = 2)

# sorting

 ## ORDER - numeric columns
studs[order(studs$marks), ]

studs$roll = as.numeric(studs$roll)
studs[order(-studs$roll),]

  # character columns
studs[order(studs$names), ]
studs[order(studs$names, decreasing = TRUE), ]

# Q. Try creating a dataframe with product name, cat, price, unit sold

product_sales = data.frame(p_name = c('pen', 'notebook', 'mop', 'cornflakes', 'tylenol'),
                           category = c('stationery', 'stationery', 'cleaning supplies', 'grocery', 'medicine'),
                           price = c(10, 60, 150, 300, 50),
                           qty = c(200, 100, 70, 45, 250) 
)

  ## 1. filter by category 
product_sales[product_sales$category == 'stationery',]  # comma imp

  ## 2. add a new col
product_sales$totalSales <- product_sales$price * product_sales$qty
  
  ## 3. sort by sales
product_sales[order(product_sales$totalSales, decreasing = TRUE),]

###### practice datasets: airQualityIndex, emptyCars?? ####

### packages, esp "writexl"
  # rStudio: tools tab -> install packages -> "writexl" -> install 
  # packages explorer on the right half window -> check desired package to load in script

  
library(writexl)   # or use require()

writexl::write_xlsx(studs, "studs_khushi.xls")
  # to find the file locate the current workspace
  # go to the right half window -> "files" tab

.libPaths()
# [1] "C:/Program Files/R/R-4.5.1/library"


# get & set current working directory
getwd()
setwd()
dir()

# how to safely save the workspace 
save.image("session4.RData") # .RData file in current workspace
  
  # clear workspace -> the global environment variables clear 

load('.RData')   # env variabbles resumed!

# CRAN - Comprehensive R Archive Network: most the packages are downloaded from here

detach('package:writexl')

# list all variables of the workspace 
ls()

# remove environment variable by name
rm(varname)

# removes all environment variables
rm(list = ls())
getwd()

  # load('.RData')

################### Pre-loaded datasets ################
# The mtcars dataset is a classic built-in dataset in R, widely used for learning 
# and demonstrating data analysis techniques. It was extracted from the 
# 1974 Motor Trend US magazine and contains data about fuel consumption 
# and various aspects of automobile design and performance for 32 car 
# models from 1973–74.


head(mtcars)
str(mtcars)   # 'data.frame':	32 obs. of  11 variables:
summary(mtcars)
colnames(mtcars)

# load mtcars in a temp variable/df
cars_df = mtcars

head(cars_df) # row name is a labelled index (car name here)


tail(cars_df)

# 1. show all cars built > 25
cars_df[cars_df$mpg > 25,]

#### install package 'dplyr' -- 
require(dplyr)
cars_df %>% filter(mpg>25)  # %>% akin to pipe operator in Linux

# 2. how many cars have 4 cylinders?
count(cars_df[cars_df$cyl == 4, ])

cars_df %>% filter(cyl == 4) %>% count()

cars_df %>% filter(cyl == 4) %>% summarise(count = n()) 
  # or ("Count", n())
  # or (n())

cars_df %>% filter(cyl == 4) %>% select(mpg, cyl) # project certain columns only

# 3. filter car(s) with maximum horsepower 
cars_df[cars_df$hp == max(cars_df$hp),]

cars_df %>% filter(hp == max(hp))

cars_df %>% filter(hp == max(hp)) 

  # just the car name via rownames
rownames(cars_df[cars_df$hp == max(cars_df$hp),])

  # how to save row labels in a column
    ## tibble package download and install -> system will restart
    ## modern re-imaginging of the dataframes 
    ## reload dplyr, cars_df

require(tibble)
as_tibble(cars_df)

cars_df %>% rownames_to_column(var = 'carName') %>%
  filter(hp == max(hp)) %>% select(carName)

# 4. select the cars by the mileage in descending order
cars_df[order(-cars_df$mpg), ]
    
  # arrange function - dplyr - sort order  by selected columns
  car1 = arrange(cars_df, desc(mpg))
  
  cars_df %>% arrange(cars_df, desc(mpg))

  car2 = arrange(cars_df, desc(cyl), mpg) # sorting by two columns

# save results
  require(writexl)
writexl::write_xlsx(car1, "mtcarsResult1.xls")
writexl::write_xlsx(car2, "mtcarResult2.xls")

# 5. create a column 'efficiency' = mpg/hp
cars_df$efficiency <- cars_df$mpg /cars_df$hp

    ## dplyr - tidyverse github - 5 functions
        ## mutate, select, arrange
cars_df %>% mutate(efficiency_mutate = mpg/hp) %>%
  arrange(desc(efficiency)) %>%
  head(5)

# 6. Group By - count no of cars in with cylinder type
table(cars_df$cyl)
    # 4  6  8 
    # 11  7 14 

cars_df %>% group_by(cyl) %>% summarise(n()) 
    # # A tibble: 3 × 2   -- return type of group_by is a tibble df
    # cyl `n()`
    # <dbl> <int>
    #   1     4    11
    #   2     6     7
    #   3     8    14


# most commonly used packages are developed and grouped in TIDYVERSE -> next sessions
    # install
iris
airquality # new york air quality measurements
ToothGrowth # the effect of vitamin C in guinea pigs
PlantGrowth

