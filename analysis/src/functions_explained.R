# function
fahr_to_kelvin <- function(temp){
  kelvin <- ((temp - 32)*(5/9)) + 273.15
  return(kelvin)
}
  # output in environment: function (temp)
fahr_to_kelvin(32)
  # output: [1] 273.15
fahr_to_kelvin(212)  
  # output: [1] 373.15

#combining functions
kelvin_to_celcius <- function(temp){
  celcius <- temp - 273.15
  return(celcius)
}
  # output in envirnoment: function (temp)
kelvin_to_celcius(300)  
  # output: [1] 26.85
  
fahr_to_celcius <- function(temp){
  temp_k <- fahr_to_kelvin(temp)
  temp_c <- kelvin_to_celcius(temp_k)
  return(temp_c)
}
  # output in environment: function (temp)
fahr_to_celcius(32)
  # output: [1] 0
fahr_to_celcius(212)
  # output: [1] 100

fahr_to_kelvin("a")
  # gives error because a is not a number
fahr_to_kelvin("100")
  # gives an error because value is in quotes, which means it's a categorical variable

fahr_to_kelvin <- function(temp) {
  if(!is.numeric(temp)){ 
    stop("temp must be a numeric factor") # if the value is not numeric, it will stop the analysis
  }
  kelvin <- ((temp -32)*(5/9)) + 273.15
  return(kelvin)
}
fahr_to_kelvin("100")
  # gives an error because "100" isn't numeric - meant to demonstrate the if statement

print("hello")
  # output: [1] "hello"

fahr_to_kelvin <- function(temp){
  stopifnot(is.numeric(temp))
  kelvin <- ((temp-32)*(5/9))+273.15
  return(kelvin)
}
fahr_to_kelvin("100")
  # gives an error because "100" isn't numeric - meant to demonstrate the stopifnot statement

# complex functions
calcGDP <- function(dat){
  gdp <- dat$pop*dat$gdpPercap
  return(gdp)
}
head(gapminder)
calcGDP(head(gapminder))
  # output: [1]  6567086330  7585448670  8758855797  9648014150  9678553274 11697659231

# adding more arguments
calcGDP <- function(dat, year = NULL, country = NULL){
  if(!is.null(year)){
    dat <- dat[dat$year %in% year,]
  }
  if(!is.null(country)){
    dat <- dat[dat$country %in% country, ]
  }
  gdp <- dat$pop*dat$gdpPercap
  new <- cbind (dat, gdp=gdp)
  return(new)
}
head(calcGDP(gapminder, country = "Australia"))
  # output:      country year      pop continent lifeExp gdpPercap          gdp
          # 61 Australia 1952  8691212   Oceania   69.12  10039.60  87256254102
          # 62 Australia 1957  9712569   Oceania   70.33  10949.65 106349227169
          # 63 Australia 1962 10794968   Oceania   70.93  12217.23 131884573002
          # 64 Australia 1967 11872264   Oceania   71.10  14526.12 172457986742
          # 65 Australia 1972 13177000   Oceania   71.93  16788.63 221223770658
          # 66 Australia 1977 14074100   Oceania   73.49  18334.20 258037329175
head(calcGDP(gapminder, country = "Australia", year = 2007))
  # output:      country year      pop continent lifeExp gdpPercap          gdp
          # 72 Australia 2007 20434176   Oceania  81.235  34435.37 703658358894

# sum 5 numbers
sum_my_numbers <- function(x){
  y <- sum(x)
}
x <- c(1,2,3,5,4)
sum_my_numbers(x)
  # gives no output - we didn't ask it to return anything
# solution
sum_my_numbers <- function(x){
  y <- sum(x)
  return(y)
}
x <- c(1,2,3,5,4)
sum_my_numbers(x)
  # output: [1] 15

sum_my_numbers <- function(x){
  y <- sum(x)
  z <- mean(x)
  yz <- c(y,z)
  return(yz)
}
x <- c(1,2,3,5,4)
sum_my_numbers(x)
  # output: [1] 15  3
head(gapminder)
# output:       country year      pop continent lifeExp gdpPercap
          # 1 Afghanistan 1952  8425333      Asia  28.801  779.4453
          # 2 Afghanistan 1957  9240934      Asia  30.332  820.8530
          # 3 Afghanistan 1962 10267083      Asia  31.997  853.1007
          # 4 Afghanistan 1967 11537966      Asia  34.020  836.1971
          # 5 Afghanistan 1972 13079460      Asia  36.088  739.9811
          # 6 Afghanistan 1977 14880372      Asia  38.438  786.1134

unique(gapminder$country) # tells you every country in the dataset - there are too many to paste here
