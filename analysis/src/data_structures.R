# data structures and types

# there are 5 data types in R

# type 1: a double
double_var <- 3.14
# verify the type
typeof(double_var)
  # output: [1] "double"

double_var_2 <-1
typeof(double_var_2)
  # output: [1] "double"

#type 2: an integer
int_var <- 4L # L forces the variable to be a whole number
typeof(int_var)
  # output: [1] "integer"

# type 3: complex
complex_var <- 1 + 1i
typeof(complex_var)
  # output: [1] "complex"

# type 4: logical - True or False
logical_var <- TRUE
typeof(logical_var)
  # output: [1] "logical"

# type 5: character
char_var <- "This is a Character"
typeof(char_var)
  # output: [1] "character"

# calculations using these data
45 * TRUE
  # output: 45
45 + "word"
  # gives an error because the data are non-numeric
5 * a 
  # gives an error because the variable doesn't exist

# Collections and Vectors
# create a vector
my_vector <- vector(length = 3)
  # output in environment: logi [1:3] FALSE FALSE FALSE
another_vector <- vector(mode='character', length=3)
  # output in environment: chr [1:3] "" "" ""
str(another_vector)
  # output: chr [1:3] "" "" ""
#list the first value
another_vector[1]
  # output: [1] ""
# combine values into vector
double_vector <- c(5, 7, 9)
  # output in environment: num [1:3] 5 7 9
double_vector[3]
  # output: [1] 9
# change values in a vector by index
double_vector[1] <- 13
  # output in environment: num [1:3] 13 7 9
# define vectors with multiple data types
multi_vector <- c(2, 6, '3')
  # output in environment: chr [1:3] "2" "6" "3"
    # forces all values to be the same type of data
coercion_vector <- c('a', TRUE)
  # output in environment: chr [1:2] "a" "TRUE"
    # coerces all data to be the same type
      # type coersion flow: Logical > Integer > Double > Complex > Character - cannot go backwards
another_coersion_vector <- c(4, TRUE)
  # output in environment: num [1:2] 4 1 - TRUE=1 and FALSE=0
# going against the coersion flow
character_vector <- c('0', '2', '4')
  # output in environment: chr [1:3] "0" "2" "4"
converted_vector <- as.double(character_vector)
  # output in environment: num [1:3] 0 2 4

#Lists
list_example <- list(1, "a", TRUE, 1+4i)
# accessing the lists - example of wrong way to do it
list_example
  # output: [[1]]
  # [1] 1
  # [[2]]
  # [1] "a"
  # [[3]]
  #[1] TRUE
  #[[4]]
  #[1] 1+4i
# lists are accessed a little differently - the correct way to do it
list_example[[2]]
  # output: [1] "a"
# add metadata to lists
another_list <- list(
  title = "Numbers",
  numbers = 1:10,
  data = TRUE
)
another_list
  # output: $title
  # [1] "Numbers"
  # $numbers
  # [1]  1  2  3  4  5  6  7  8  9 10
  # $data
  # [1] TRUE

another_list$title
  # output: [1] "Numbers"
another_list$numbers
  # output:  [1]  1  2  3  4  5  6  7  8  9 10
str(another_list$numbers)
  # output:  int [1:10] 1 2 3 4 5 6 7 8 9 10

#Matrix
matrix_example <- matrix(0, nrow=6, ncol=3)
matrix_example
  # output:      [,1] [,2] [,3]
  # [1,]    0    0    0
  # [2,]    0    0    0
  # [3,]    0    0    0
  # [4,]    0    0    0
  # [5,]    0    0    0
  # [6,]    0    0    0

dim(matrix_example)
  # output: [1] 6 3
typeof(matrix_example)
  # output: [1] "double"

nrow(matrix_example)
  # output: [1] 6
ncol(matrix_example)
  # output: [1] 3
matrix_example[1,1]
  # output: [1] 0
matrix_example + 2
  # output: [,1] [,2] [,3]
  # [1,]    2    2    2
  # [2,]    2    2    2
  # [3,]    2    2    2
  # [4,]    2    2    2
  # [5,]    2    2    2
  # [6,]    2    2    2

matrix_example_2 <- matrix_example + 2 
matrix_example_2
  # output: [,1] [,2] [,3]
  # [1,]    2    2    2
  # [2,]    2    2    2
  # [3,]    2    2    2
  # [4,]    2    2    2
  # [5,]    2    2    2
  # [6,]    2    2    2
matrix_example_2 * matrix_example_2
  # output: [,1] [,2] [,3]
  # [1,]    4    4    4
  # [2,]    4    4    4
  # [3,]    4    4    4
  # [4,]    4    4    4
  # [5,]    4    4    4
  # [6,]    4    4    4

# Dataframes
"red"
cats <- data.frame(
  coat = c("calico", "black", "tabby"),
  weight = c(2.1, 5.0, 3.2),
  likes_catnip = c(1, 0, 1)
)
cats
  # output     coat weight likes_catnip
  # 1 calico    2.1            1
  # 2  black    5.0            0
  # 3  tabby    3.2            1

typeof(cats)
  # output: [1] "list"
str(cats)
  # output: 'data.frame':	3 obs. of  3 variables:
  # $ coat        : chr  "calico" "black" "tabby"
  # $ weight      : num  2.1 5 3.2
  # $ likes_catnip: num  1 0 1
class(cats)
  # output: [1] "data.frame"

# accessing columns by name
cats$weight
  # output: [1] 2.1 5.0 3.2
cats$coat
  # output: [1] "calico" "black"  "tabby" 


# performing operations
cats$weight + cats$likes_catnip
  # output: [1] 3.1 5.0 4.2
cats$weight + 2
  # output: [1] 4.1 7.0 5.2
cats$weight + "word"
  # gives error - "word" is not numeric
paste("My cat is", cats$coat)
  # output: [1] "My cat is calico" "My cat is black"  "My cat is tabby"
typeof(cats$weight)
  # output: [1] "double"

# adding a new row to data frame
additional_cat <- data.frame(
  coat = "tabby",
  weight = "2.3 or 2.4",
  likes_catnip = 1
)
additional_cat
  # output    coat     weight likes_catnip
  # 1 tabby 2.3 or 2.4            1

combined_cats <- rbind(cats, additional_cat)
combined_cats
  # output:     coat     weight likes_catnip
  # 1 calico        2.1            1
  # 2  black          5            0
  # 3  tabby        3.2            1
  # 4  tabby 2.3 or 2.4            1

typeof(cats$weight)
  # output: [1] "double"
typeof(combined_cats$weight)
  # output: [1] "character" - the additional cat had 2.3 or 2.4 as a value, which is a character

# accessing a data frame
cats[1,1]
  # output: [1] "calico"
cats[,1] # gives first column
  # output: [1] "calico" "black"  "tabby" 
cats[1,] # gives first row
  # output:     coat weight likes_catnip
  # 1 calico    2.1            1













