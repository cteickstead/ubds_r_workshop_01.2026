# creating a vector
x <- c(3,4,6,7,8)
x
  # output: [1] 3 4 6 7 8

#naming a vector
names(x) <- c("a","b","c","d","e")
x
  # output: a b c d e 
          # 3 4 6 7 8 

# accessing value by index
x[1]
  # output: a 
          # 3 
x[3:5]
  # output: c d e 
          # 6 7 8 
x[c(3,4,5)]
  # output: c d e 
          # 6 7 8 
x[7]
  # output: <NA> 
          # NA - we only have 5 indices, so it can't access the 7th index
x[0]
  # output: named numeric(0) - cannot have a 0th index
# negative indices
x[-2]
  # output: a c d e 
          # 3 6 7 8 
x[c(-1,-5)]
  # output: b c d 
          # 4 6 7 
x[-1:5]
  # gives error because there may be a 0 included
-1:5
  # output: [1] -1  0  1  2  3  4  5
c(-1,-5)
  # output: [1] -1 -5

# saving sliced vectors
x <- x[-4]
x
  # output: a b c e 
          # 3 4 6 8 
x <- c(1.1, 2.5, 6.4, 8.7)
names(x) <- c("a", "b","c","d")
x
  # output:   a   b   c   d 
          # 1.1 2.5 6.4 8.7 
# solution
x[1:2]
  # output:   a   b 
          # 1.1 2.5 
x[c(-3.-4)]
  # output:   a   b   c   d 
          # 1.1 2.5 6.4 8.7 
x[c(1,2)]
  #output:   a   b 
          # 1.1 2.5 

# access values from x
x[c("a","c")]
  # output:   a   c 
          # 1.1 6.4 

# access the values from x using logical value (TRUE/FALSE)
x[c("TRUE","FALSE","TRUE","FALSE")]
x
  # output: <NA> <NA> <NA> <NA> 
          # NA   NA   NA   NA 
# soulution
x[c(TRUE,FALSE,TRUE,FALSE)]
x
  # output:   a   b   c   d 
          # 1.1 2.5 6.4 8.7 

# subsetting using logical operators ( <, >, ==)
x > 5
  # output:     a     b     c     d 
          # FALSE FALSE  TRUE  TRUE - tells you which cases are greater than 5
x[x>5]
  # output:   c   d 
          # 6.4 8.7 - gives you the values that are biiger than 5
x[x<2]
  # output:   a 
          # 1.1 
x[x == 2]
  # output: named numeric(0) - no values are ==2
x[x == 2.5]
  # output:   b 
          # 2.5 
names(x) == "c"
  # output: [1] FALSE FALSE  TRUE FALSE - tells you which variable is named c
x[names(x) == "c"]
  # output:   c 
          # 6.4 - tells you the value of c

# more logical operators & and !
# using & (and) operator
x > 2 & x < 8
  # output:     a     b     c     d 
          # FALSE  TRUE  TRUE FALSE 
x[x>2 & x<8]
  # output:   b   c 
          # 2.5 6.4 
#using ! (not) operator
x > 2
  # output:     a     b     c     d 
           # FALSE  TRUE  TRUE  TRUE 
!x>2
  # output:     a     b     c     d 
           # TRUE FALSE FALSE FALSE 
x[x>2]
  # output:   b   c   d 
            # 2.5 6.4 8.7 
x[!x>2]
  # output:   a 
           # 1.1 
# all() and any()
all(x>2)
  # output: [1] FALSE
any(x>2)
  # output: [1] TRUE

# non-unique names
x <- 1:8
x
  # output: [1] 1 2 3 4 5 6 7 8
names(x) <- c("a","a","a","a","b","b","c","d")
x
  # output: a a a a b b c d 
          # 1 2 3 4 5 6 7 8 
x[names(x) == "a"]
  # output; a a a a 
          # 1 2 3 4 

# using - (negative) operator for names
x[-7]
  # output: a a a a b b d 
          # 1 2 3 4 5 6 8 - can we do this with names?
x[-names(x)]
  # this gives an error
x["a"]
  # output: a 
          # 1 
x[-"a"]
  # also gives an error
x[!names(x) == "a"]
  # output: b b c d 
          # 5 6 7 8 - this is the correct option
x[names(x) == c("a","d")]
  # output: a a d 
          # 1 3 8 - why do only 2 of the a's show up?
x[!names(x) == c("a","d")]
  # output: a a b b c 
          # 2 4 5 6 7 - why do 2 a's show up here? 
x[names(x) != c("a","d")]
  # output: a a b b c 
          # 2 4 5 6 7 - same here...2 a's show up??

# recycling variables
names(x) == c("a","d")
  # output; [1]  TRUE FALSE  TRUE FALSE FALSE FALSE FALSE  TRUE
length(names(x))
  # output: [1] 8
length(c("a","d"))
  # output; [1] 2
c("a","c","a","c","a","c","a","c")
names(x)
  # output: [1] "a" "a" "a" "a" "b" "b" "c" "d"
names(x) == c("a","c")
  # output: [1]  TRUE FALSE  TRUE FALSE FALSE FALSE FALSE FALSE

# %in% operator
names(x) %in% c("a","c")
  # output: [1]  TRUE  TRUE  TRUE  TRUE FALSE FALSE  TRUE FALSE
x[names(x) %in% c("a","c")]
  # output: a a a a c 
          # 1 2 3 4 7 

# data type: factors - so far we've been working with vectors
f <- factor(c("a","a","b","c","c","d"))
f
  # output: [1] a a b c c d
          # Levels: a b c d
f[f %in% c("b","c")]
  # output: [1] b c c
          # Levels: a b c d
f[-3]
  # output: [1] a a c c d
          # Levels: a b c d

# matrix
set.seed(1) # reproduce the same data when generating a matrix
m <- matrix(rnorm(6*4), ncol=4, nrow=6) # generates a random dataset, but it will be fixed with the code above
m
  # output:            [,1]       [,2]        [,3]        [,4]
          # [1,] -0.6264538  0.4874291 -0.62124058  0.82122120
          # [2,]  0.1836433  0.7383247 -2.21469989  0.59390132
          # [3,] -0.8356286  0.5757814  1.12493092  0.91897737
          # [4,]  1.5952808 -0.3053884 -0.04493361  0.78213630
          # [5,]  0.3295078  1.5117812 -0.01619026  0.07456498
          # [6,] -0.8204684  0.3898432  0.94383621 -1.98935170

m[3:4,c(1,2)]
  # output:            [,1]       [,2]
          # [1,] -0.8356286  0.5757814
          # [2,]  1.5952808 -0.3053884

m[3,]
  # output: [1] -0.8356286  0.5757814  1.1249309  0.9189774

m[4,]
  # output: [1]  1.59528080 -0.30538839 -0.04493361  0.78213630
m[3, ,drop = FALSE]
  # output:            [,1]      [,2]     [,3]      [,4]
          # [1,] -0.8356286 0.5757814 1.124931 0.9189774
m[6]
  # output: [1] -0.8204684
m2 <- matrix(1:24, ncol=4, nrow=6)
m2
  # output:      [,1] [,2] [,3] [,4]
[1,]    1    7   13   19
[2,]    2    8   14   20
[3,]    3    9   15   21
[4,]    4   10   16   22
[5,]    5   11   17   23
[6,]    6   12   18   24
m2[8]
  # output: [1] 8
m2 <- matrix(1:24, ncol=4, nrow=6, byrow = TRUE)
m2
  # output: [,1] [,2] [,3] [,4]
   # [1,]    1    2    3    4
   # [2,]    5    6    7    8
   # [3,]    9   10   11   12
   # [4,]   13   14   15   16
   # [5,]   17   18   19   20
   # [6,]   21   22   23   24
m2[8]
  # output: [1] 6

# list 
head(mtcars)
  # output:                    mpg cyl disp  hp drat    wt  qsec vs am gear carb
          # Mazda RX4         21.0   6  160 110 3.90 2.620 16.46  0  1    4    4
          # Mazda RX4 Wag     21.0   6  160 110 3.90 2.875 17.02  0  1    4    4
          # Datsun 710        22.8   4  108  93 3.85 2.320 18.61  1  1    4    1
          # Hornet 4 Drive    21.4   6  258 110 3.08 3.215 19.44  1  0    3    1
          # Hornet Sportabout 18.7   8  360 175 3.15 3.440 17.02  0  0    3    2
          # Valiant           18.1   6  225 105 2.76 3.460 20.22  1  0    3    1
xlist <- list(a="Software Carpentry", 
              b=1:10,
              data=head(mtcars)) #this dataset is preinstalled with R, you do not need to load it
xlist
  # output: $a
    #[1] "Software Carpentry"

    # $b
    # [1]  1  2  3  4  5  6  7  8  9 10

    # $data
    # mpg cyl disp  hp drat    wt  qsec vs am gear carb
    # Mazda RX4         21.0   6  160 110 3.90 2.620 16.46  0  1    4    4
    # Mazda RX4 Wag     21.0   6  160 110 3.90 2.875 17.02  0  1    4    4
    # Datsun 710        22.8   4  108  93 3.85 2.320 18.61  1  1    4    1
    # Hornet 4 Drive    21.4   6  258 110 3.08 3.215 19.44  1  0    3    1
    # Hornet Sportabout 18.7   8  360 175 3.15 3.440 17.02  0  0    3    2
    # Valiant           18.1   6  225 105 2.76 3.460 20.22  1  0    3    1
xlist[1:2]
  # output: $a
    # [1] "Software Carpentry"

    # $b
    # [1]  1  2  3  4  5  6  7  8  9 10
xlist[[1:2]]
  # gives an error
xlist[[2]]
  # output: [1]  1  2  3  4  5  6  7  8  9 10
xlist[[2]][1]
  # output: [1] 1
xlist[["a"]]
  # output: [1] "Software Carpentry"
xlist[["b"]]
  # output: [1]  1  2  3  4  5  6  7  8  9 10
xlist$data
  # output:                    mpg cyl disp  hp drat    wt  qsec vs am gear carb
          # Mazda RX4         21.0   6  160 110 3.90 2.620 16.46  0  1    4    4
          # Mazda RX4 Wag     21.0   6  160 110 3.90 2.875 17.02  0  1    4    4
          # Datsun 710        22.8   4  108  93 3.85 2.320 18.61  1  1    4    1
          # Hornet 4 Drive    21.4   6  258 110 3.08 3.215 19.44  1  0    3    1
          # Hornet Sportabout 18.7   8  360 175 3.15 3.440 17.02  0  0    3    2
          # Valiant           18.1   6  225 105 2.76 3.460 20.22  1  0    3    1

# subsetting a dataframe
head(gapminder)
  # output:       country year      pop continent lifeExp gdpPercap
          # 1 Afghanistan 1952  8425333      Asia  28.801  779.4453
          # 2 Afghanistan 1957  9240934      Asia  30.332  820.8530
          # 3 Afghanistan 1962 10267083      Asia  31.997  853.1007
          # 4 Afghanistan 1967 11537966      Asia  34.020  836.1971
          # 5 Afghanistan 1972 13079460      Asia  36.088  739.9811
          # 6 Afghanistan 1977 14880372      Asia  38.438  786.1134
head(gapminder[["pop"]])
  # output: [1]  8425333  9240934 10267083 11537966 13079460 14880372
head(gapminder[["pop"]], drop=FALSE)
  # output: [1]  8425333  9240934 10267083 11537966 13079460 14880372
gapminder[,1:3]
  # output will give you the first three columns of each participant (there's too much data for me to paste)
gapminder[gapminder$lifeExp > 80]
  # gives an error - you specified the columns, but you're not accounting for the rows
gapminder[gapminder$lifeExp > 80,]
  # output will list out the data for all participants who live past 80 (again, too much data to paste)
  # not putting anything after the comma essentially means it will do it for everyone 




