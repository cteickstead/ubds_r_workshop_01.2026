# Write data to a csv file
write.csv(cats, "data/feline-data.csv")

# read data frame to a variable
cats <- read.csv("data/feline-data.csv")
cats
  # output:   X   coat weight likes_catnip
  # 1 1 calico    2.1            1
  # 2 2  black    5.0            0
  # 3 3  tabby    3.2            1

# add new column
age <- c(2,3,5)
cbind(cats, age)
  # output:   X   coat weight likes_catnip age
  # 1 1 calico    2.1            1   2
  # 2 2  black    5.0            0   3
  # 3 3  tabby    3.2            1   5
nrow(cats)
  # output: [1] 3
length(age)
  # output: [1] 3

# add new row
newRow <- list("tortoiseshell", 3.3, TRUE, 9)
newRow
  # output: [[1]]
[1] "tortoiseshell"

[[2]]
[1] 3.3

[[3]]
[1] TRUE

[[4]]
[1] 9

cats <- rbind(cats, newRow)
cats[-4,] # remove 4th row
  # output: X   coat weight likes_catnip
  # 1 1 calico    2.1            1
  # 2 2  black    5.0            0
  # 3 3  tabby    3.2            1

cats[,-4] # remove 4th column
  # output: X   coat weight
  # 1             1 calico    2.1
  # 2             2  black    5.0
  # 3             3  tabby    3.2
  # 4 tortoiseshell    3.3    1.0

names(cats)
  # output: [1] "X"            "coat"         "weight"       "likes_catnip"
drop <- names(cats) %in% c("age")
drop
  # output: [1] FALSE FALSE FALSE FALSE - something went wrong, look into it with code below
cats[, !drop]
  # output:               X   coat weight likes_catnip
  # 1             1 calico    2.1            1
  # 2             2  black    5.0            0
  # 3             3  tabby    3.2            1
  # 4 tortoiseshell    3.3    1.0            9
!drop
  # output: [1] TRUE TRUE TRUE TRUE

# append two data frames
cats <- rbind(cats, cats)
cats
  # output:               X   coat weight likes_catnip
  # 1             1 calico    2.1            1
  # 2             2  black    5.0            0
  # 3             3  tabby    3.2            1
  # 4 tortoiseshell    3.3    1.0            9
  # 5             1 calico    2.1            1
  # 6             2  black    5.0            0
  # 7             3  tabby    3.2            1
  # 8 tortoiseshell    3.3    1.0            9

df <- data.frame(
  first_name = c("Cameryn", "John"),
  last_name = c("Eickstead", "Doe"),
  lucky_number = c(8, 13)
)
df
  # output:   first_name last_name lucky_number
  # 1    Cameryn Eickstead            8
  # 2       John       Doe           13

# download a data set
download.file("https://raw.githubusercontent.com/swcarpentry/r-novice-gapminder/main/episodes/data/gapminder_data.csv", destfile = "data/gapminder_data.csv")
gapminder <- read.csv("data/gapminder_data.csv")
str(gapminder)
  # output: 'data.frame':	1704 obs. of  6 variables:
$ country  : chr  "Afghanistan" "Afghanistan" "Afghanistan" "Afghanistan" ...
$ year     : int  1952 1957 1962 1967 1972 1977 1982 1987 1992 1997 ...
$ pop      : num  8425333 9240934 10267083 11537966 13079460 ...
$ continent: chr  "Asia" "Asia" "Asia" "Asia" ...
$ lifeExp  : num  28.8 30.3 32 34 36.1 ...
$ gdpPercap: num  779 821 853 836 740 ...
summary(gapminder)
  # output:    country               year           pop             continent            lifeExp     
Length:1704        Min.   :1952   Min.   :6.001e+04   Length:1704        Min.   :23.60  
Class :character   1st Qu.:1966   1st Qu.:2.794e+06   Class :character   1st Qu.:48.20  
Mode  :character   Median :1980   Median :7.024e+06   Mode  :character   Median :60.71  
Mean   :1980   Mean   :2.960e+07                      Mean   :59.47  
3rd Qu.:1993   3rd Qu.:1.959e+07                      3rd Qu.:70.85  
Max.   :2007   Max.   :1.319e+09                      Max.   :82.60  
gdpPercap       
Min.   :   241.2  
1st Qu.:  1202.1  
Median :  3531.8  
Mean   :  7215.3  
3rd Qu.:  9325.5  
Max.   :113523.1  
typeof(gapminder$country)
  # output: [1] "character"
typeof(gapminder$year)
# output: [1] "integer"
str(gapminder$year)
  # output: int [1:1704] 1952 1957 1962 1967 1972 1977 1982 1987 1992 1997 ...
str(gapminder$continent)
  # output: chr [1:1704] "Asia" "Asia" "Asia" "Asia" "Asia" "Asia" "Asia" "Asia" "Asia" "Asia" "Asia" ...
nrow(gapminder)
  # output: [1] 1704
ncol(gapminder)
  # output: [1] 6
dim(gapminder)
  # output: [1] 1704    6
names(gapminder)
  # output: [1] "country"   "year"      "pop"       "continent" "lifeExp"   "gdpPercap"
colnames(gapminder)
  # output: [1] "country"   "year"      "pop"       "continent" "lifeExp"   "gdpPercap"
length(gapminder)
  # output: [1] 6
head(gapminder)
  # output:       country year      pop continent lifeExp gdpPercap
  # 1 Afghanistan 1952  8425333      Asia  28.801  779.4453
  # 2 Afghanistan 1957  9240934      Asia  30.332  820.8530
  # 3 Afghanistan 1962 10267083      Asia  31.997  853.1007
  # 4 Afghanistan 1967 11537966      Asia  34.020  836.1971
  # 5 Afghanistan 1972 13079460      Asia  36.088  739.9811
  # 6 Afghanistan 1977 14880372      Asia  38.438  786.1134
head(gapminder, n = 10)
  # output:        country year      pop continent lifeExp gdpPercap
  # 1  Afghanistan 1952  8425333      Asia  28.801  779.4453
  # 2  Afghanistan 1957  9240934      Asia  30.332  820.8530
  # 3  Afghanistan 1962 10267083      Asia  31.997  853.1007
  # 4  Afghanistan 1967 11537966      Asia  34.020  836.1971
  # 5  Afghanistan 1972 13079460      Asia  36.088  739.9811
  # 6  Afghanistan 1977 14880372      Asia  38.438  786.1134
  # 7  Afghanistan 1982 12881816      Asia  39.854  978.0114
  # 8  Afghanistan 1987 13867957      Asia  40.822  852.3959
  # 9  Afghanistan 1992 16317921      Asia  41.674  649.3414
  # 10 Afghanistan 1997 22227415      Asia  41.763  635.3414
tail(gapminder)
  # output:       country year      pop continent lifeExp gdpPercap
  # 1699 Zimbabwe 1982  7636524    Africa  60.363  788.8550
  # 1700 Zimbabwe 1987  9216418    Africa  62.351  706.1573
  # 1701 Zimbabwe 1992 10704340    Africa  60.377  693.4208
  # 1702 Zimbabwe 1997 11404948    Africa  46.809  792.4500
  # 1703 Zimbabwe 2002 11926563    Africa  39.989  672.0386
  # 1704 Zimbabwe 2007 12311143    Africa  43.487  469.7093
