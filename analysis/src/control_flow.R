# if statements
x <- 8
x
  # output: [1] 8
if (x >= 10){
  print("x is greater than or equal to 10")
}
  # nothing is printed out...because 8 is not bigger than 10
# solution
if (x >= 10){
  print("x is greater than or equal to 10")
} else {
  print("x is less than 10")
}
  # output: [1] "x is less than 10"
# if you have two true statements, use the code below
if (x >= 10){
  print("x is greater than or equal to 10")
} else if (x > 5){
  print("x is less than 10, but greater than 5")
} else {
  print("x is lesser than or equal to 5")
}
  # output: [1] "x is less than 10, but greater than 5"

# use logical values directly
x <- 4==3
x
  # output: [1] FALSE
if(x) {
  print("4 equals 3")
} else {
  print("4 does not equal 3")
}
  # output: [1] "4 does not equal 3"

# ifelse function
y <- -3
y
  # output: [1] -3
ifelse(y < 0, "y is a negative number", "y is either zero or positive")
  # output: [1] "y is a negative number"

# multiple logicals - any and all functions
x <- c(TRUE, TRUE, FALSE)
x
  # output: [1]  TRUE  TRUE FALSE
if(x) {
  print("x is true")
}
  # gives you an error, looks at one single value at a time
# solution
if(any(x)) {
  print("at least one value of x is true")
}
  # output: [1] "at least one value of x is true"
if(all(x)) {
  print("all of the values of x is true")
}
  # does not give you an output because one value of x is false

# for loop - structured similarly to if statements
for (i in 1:10) {
  print(i)
}
  # output: [1] 1
          # [1] 2
          # [1] 3
          # [1] 4
          # [1] 5
          # [1] 6
          # [1] 7
          # [1] 8
          # [1] 9
          # 1] 10 - gives you a single line for each vector
for (i in 1:5) {
  for(j in c("a","b","c","d","e")) {
    print(paste(i,j))
  }
}
  # output: [1] 1
          # [1] 2
          # [1] 3
          # [1] 4
          # [1] 5
          # [1] 6
          # [1] 7
          # [1] 8
          # [1] 9
          # [1] 10
> for (i in 1:5) {
  +   for(j in c("a","b","c","d","e")) {
    +     print(paste(i,j))
    +   }
  + }
  # output: [1] "1 a"
          # [1] "1 b"
          # [1] "1 c"
          # [1] "1 d"
          # [1] "1 e"
          # [1] "2 a"
          # [1] "2 b"
          # [1] "2 c"
          # [1] "2 d"
          # [1] "2 e"
          # [1] "3 a"
          # [1] "3 b"
          # [1] "3 c"
          # [1] "3 d"
          # [1] "3 e"
          # [1] "4 a"
          # [1] "4 b"
          # [1] "4 c"
          # [1] "4 d"
          # [1] "4 e"
          # [1] "5 a"
          # [1] "5 b"
          # [1] "5 c"
          # [1] "5 d"
          # [1] "5 e"
output_vector <- c()
for (i in 1:5) {
  for(j in c("a","b","c","d","e")) {
    temp_output <- paste(i,j)
    output_vector <- c(output_vector, temp_output)
  }
}
output_vector
  # output:  [1] "1 a" "1 b" "1 c" "1 d" "1 e" "2 a" "2 b" "2 c" "2 d" "2 e" "3 a" "3 b" "3 c" "3 d" "3 e"
           # [16] "4 a" "4 b" "4 c" "4 d" "4 e" "5 a" "5 b" "5 c" "5 d" "5 e"

# predefining the output size saves computational resources
output_matrix <- matrix(nrow=5, ncol=5) # predefining size
j_vector <- c("a","b","c","d","e")
for (i in 1:5) {
  for(j in 1:5) {
    temp_j_value <- j_vector[j]
    temp_output <- paste(i, temp_j_value)
    output_matrix[i,j] <- temp_output
  }
}
output_matrix
  # output: [,1]  [,2]  [,3]  [,4]  [,5] 
    # [1,] "1 a" "1 b" "1 c" "1 d" "1 e"
    # [2,] "2 a" "2 b" "2 c" "2 d" "2 e"
    # [3,] "3 a" "3 b" "3 c" "3 d" "3 e"
    # [4,] "4 a" "4 b" "4 c" "4 d" "4 e"
    # [5,] "5 a" "5 b" "5 c" "5 d" "5 e"
output_vector2 <-as.vector(output_matrix)
output_vector2
  # output:  [1] "1 a" "2 a" "3 a" "4 a" "5 a" "1 b" "2 b" "3 b" "4 b" "5 b" "1 c" "2 c" "3 c" "4 c" "5 c"
          # [16] "1 d" "2 d" "3 d" "4 d" "5 d" "1 e" "2 e" "3 e" "4 e" "5 e"

# while loops - repeat a loop until something is no longer true
z <- 1
z
  # output: [1] 1
while(z > 0.1) {
  z <- runif(1)
  cat(z, "\n") # forces every value to be pasted on a different line
}
  # output: 0.7323137 
          # 0.6927316 
          # 0.4776196 
          # 0.8612095 
          # 0.4380971 
          # 0.2447973 
          # 0.07067905 - I got 7 values, but you may get something different. The instructor got 3 and said it would be different between people
