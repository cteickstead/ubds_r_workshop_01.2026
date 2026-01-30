# identifying R version
R.version
  # output: RStudio version 4.5.1 (2025-06-13)

# hashtags will create notes!
# example: this is a comment
100 + 101
# highlight the code and press control + enter to bring this line to the terminal and run it
# if you want to run the whole script at once, do not highlight anything - just press control + enter
  # output: 201

# if you start a calculation and do not want to finish it, press control + c
123 + 
  #press control + C

# R automatically uses the order of operations (PEMDAS)
3 + 5 * 10
  # output: 53 
# no difference from before
3 + (5 * 10)
  # output: 53
# you have to force the equation if you want the 3 and 5 added first
(3 + 5) * 10
  # output: 80
# you have to use the asterisk if you want it to multiply - the version below gets an error
(3 + 5)10
  # gives error


# exponents
3^2
  # output: 9

# are these equal? - ONLY USE THIS TEST WITH INTEGERS because computers aren't great with decimals
10 == 10
  # Tells me "True"
9 == 10
# Tells me "False"
10.01 == 10.01
# Tells me "True"
10.01 == 10.0000000000001
# Tells me "False"
10.0 == 10.00000000000000001
# Tells me "True," but we know there is a small difference

# working with fractions
2/1000
  # output: 0.002
2/10000
  # output: 2e-14
500000000/2
  # output: 2.5e+08 - R likes scientific notation


# R HAS FUNCTIONS
# tells you what directory you're in
getwd()
  # output: "/Users/cameryneickstead/workshops/analysis"
# do trigonometry
# list all variables
ls()
  # output: [1] "q" "x" "z"
sin(1)
  # output: 0.841471 - not sure if it is in degrees or radians
    ?sin # to get more information, write this code, and it will give you a help-sheet on the side
      # info from the help sheet: angles are in radians, not degrees

# adding variables
# use an arrow to set the variable equal to an equation
x <- 1/40
  # R will track the variable "x" on your environment
  # output: 0.025
# can also use an equal sign, but it's more common to use an arrow
q = 1/100
  # output: 0.01
?"<-" # get more information as to why R uses arrows

# using vectors
# create a vector
1:5
  # output: [1] 1 2 3 4 5
# set variable as vector 
z <- 3:10
  # output shows up in environment: int [1:8] 3 4 5 6 7 8 9 10
# vectors in computations
2^(z)
  # output: [1]    8   16   32   64  128  256  512 1024

#deleting variables
rm(x)

# installing packages - I did not do this, because I already have these packages installed
install.packages("tidyverse")
install.packages("dplyr")

# loading packages
library(tidyverse)
library(dplyr)




