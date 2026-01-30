library(dplyr)

gapminder <- read.csv("data/gapminder_data.csv")

# running the mean gdp for individual continents
mean(gapminder$gdpPercap[gapminder$continent == "Africa"]) # gets the gdp for certain continents (i.e., Africa)
  # output: [1] 2193.755
mean(gapminder$gdpPercap[gapminder$continent == "Americas"])
  # output: [1] 7136.11

# select a column
year_country_gdp <- dplyr::select(gapminder, year, country, gdpPercap)
head(year_country_gdp)
  # output:   year     country gdpPercap
          # 1 1952 Afghanistan  779.4453
          # 2 1957 Afghanistan  820.8530
          # 3 1962 Afghanistan  853.1007
          # 4 1967 Afghanistan  836.1971
          # 5 1972 Afghanistan  739.9811
          # 6 1977 Afghanistan  786.1134

# remove a column
smaller_gapminder_data <- select(gapminder, -continent)
head(smaller_gapminder_data)
  # output:       country year      pop lifeExp gdpPercap
          # 1 Afghanistan 1952  8425333  28.801  779.4453
          # 2 Afghanistan 1957  9240934  30.332  820.8530
          # 3 Afghanistan 1962 10267083  31.997  853.1007
          # 4 Afghanistan 1967 11537966  34.020  836.1971
          # 5 Afghanistan 1972 13079460  36.088  739.9811
          # 6 Afghanistan 1977 14880372  38.438  786.1134

year_country_gdp <- gapminder %>% select(year, country, gdpPercap)
head(year_country_gdp)
  # output:   year     country gdpPercap
          # 1 1952 Afghanistan  779.4453
          # 2 1957 Afghanistan  820.8530
          # 3 1962 Afghanistan  853.1007
          # 4 1967 Afghanistan  836.1971
          # 5 1972 Afghanistan  739.9811
          # 6 1977 Afghanistan  786.1134

# rename a column
tidy_gdp <- year_country_gdp %>% rename(gdp_per_capita = gdpPercap)
head(tidy_gdp)
  # output:   year     country gdp_per_capita
          # 1 1952 Afghanistan       779.4453
          # 2 1957 Afghanistan       820.8530
          # 3 1962 Afghanistan       853.1007
          # 4 1967 Afghanistan       836.1971
          # 5 1972 Afghanistan       739.9811
          # 6 1977 Afghanistan       786.1134

# filter
year_country_gdp_euro <- gapminder %>% 
  filter(continent == "Europe") %>%
  select(year, country, gdpPercap)
head(year_country_gdp_euro)
  # output:   year country gdpPercap
          # 1 1952 Albania  1601.056
          # 2 1957 Albania  1942.284
          # 3 1962 Albania  2312.889
          # 4 1967 Albania  2760.197
          # 5 1972 Albania  3313.422
          # 6 1977 Albania  3533.004

year_country_lifeExp_euro_2007 <- gapminder %>% 
  filter(continent == "Europe", year == 2007) %>%
  select(country, lifeExp)
head(year_country_lifeExp_euro_2007)
  # output:                  country lifeExp
          # 1                Albania  76.423
          # 2                Austria  79.829
          # 3                Belgium  79.441
          # 4 Bosnia and Herzegovina  74.852
          # 5               Bulgaria  73.005
          # 6                Croatia  75.748

# group_by() function
str(gapminder)
  # output: 'data.frame':	1704 obs. of  6 variables:
    # $ country  : chr  "Afghanistan" "Afghanistan" "Afghanistan" "Afghanistan" ...
    # $ year     : int  1952 1957 1962 1967 1972 1977 1982 1987 1992 1997 ...
    # $ pop      : num  8425333 9240934 10267083 11537966 13079460 ...
    # $ continent: chr  "Asia" "Asia" "Asia" "Asia" ...
    # $ lifeExp  : num  28.8 30.3 32 34 36.1 ...
    # $ gdpPercap: num  779 821 853 836 740 ...

str(gapminder %>% group_by(continent))
  # output: gropd_df [1,704 × 6] (S3: grouped_df/tbl_df/tbl/data.frame)
    # $ country  : chr [1:1704] "Afghanistan" "Afghanistan" "Afghanistan" "Afghanistan" ...
    # $ year     : int [1:1704] 1952 1957 1962 1967 1972 1977 1982 1987 1992 1997 ...
    # $ pop      : num [1:1704] 8425333 9240934 10267083 11537966 13079460 ...
    # $ continent: chr [1:1704] "Asia" "Asia" "Asia" "Asia" ...
    # $ lifeExp  : num [1:1704] 28.8 30.3 32 34 36.1 ...
    # $ gdpPercap: num [1:1704] 779 821 853 836 740 ...
    # - attr(*, "groups")= tibble [5 × 2] (S3: tbl_df/tbl/data.frame)
    # ..$ continent: chr [1:5] "Africa" "Americas" "Asia" "Europe" ...
    # ..$ .rows    : list<int> [1:5] 
    # .. ..$ : int [1:624] 25 26 27 28 29 30 31 32 33 34 ...
    # .. ..$ : int [1:300] 49 50 51 52 53 54 55 56 57 58 ...
    # .. ..$ : int [1:396] 1 2 3 4 5 6 7 8 9 10 ...
    # .. ..$ : int [1:360] 13 14 15 16 17 18 19 20 21 22 ...
    # .. ..$ : int [1:24] 61 62 63 64 65 66 67 68 69 70 ...
    # .. ..@ ptype: int(0) 
    # ..- attr(*, ".drop")= logi TRUE

gdp_by_continent <- gapminder %>%
  group_by(continent) %>%
  summarize(mean_gdpPercap = mean(gdpPercap))
gdp_by_continent
  # output:   continent mean_gdpPercap
         # <chr>              <dbl>
         #    1 Africa             2194.
         # 2 Americas           7136.
         # 3 Asia               7902.
         # 4 Europe            14469.
         # 5 Oceania           18622.

# group_by() multiple variables
gdp_by_continent_by_year <- gapminder %>%
  group_by(continent, year) %>%
  summarize(mean_gdpPercap = mean(gdpPercap))
gdp_by_continent_by_year
  # output:    continent  year mean_gdpPercap
      # <chr>     <int>          <dbl>
      # 1 Africa     1952          1253.
      # 2 Africa     1957          1385.
      # 3 Africa     1962          1598.
      # 4 Africa     1967          2050.
      # 5 Africa     1972          2340.
      # 6 Africa     1977          2586.
      # 7 Africa     1982          2482.
      # 8 Africa     1987          2283.
      # 9 Africa     1992          2282.
      # 10 Africa     1997          2379.

# calculate multiple summary statistics
gdp_pop_by_continent_by_year <- gapminder %>%
  group_by(continent, year) %>%
  summarize(mean_gdpPercap = mean(gdpPercap), 
            sd_gdpPercap = sd(gdpPercap),
            mean_pop = mean(pop),
            sd_pop = sd(pop))
gdp_pop_by_continent_by_year
  # output:    continent  year mean_gdpPercap sd_gdpPercap  mean_pop    sd_pop
            # <chr>     <int>          <dbl>        <dbl>     <dbl>     <dbl>
            # 1 Africa     1952          1253.         983.  4570010.  6317450.
            # 2 Africa     1957          1385.        1135.  5093033.  7076042.
            # 3 Africa     1962          1598.        1462.  5702247.  7957545.
            # 4 Africa     1967          2050.        2848.  6447875.  8985505.
            # 5 Africa     1972          2340.        3287.  7305376. 10130833.
            # 6 Africa     1977          2586.        4142.  8328097. 11585184.
            # 7 Africa     1982          2482.        3243.  9602857. 13456243.
            # 8 Africa     1987          2283.        2567. 11054502. 15277484.
            # 9 Africa     1992          2282.        2644. 12674645. 17562719.
            # 10 Africa     1997          2379.        2821. 14304480. 19873013.

# count() and n()
gapminder %>%
  filter(year == 2002) %>%
  count(continent, sort = TRUE)
  # output:   continent  n
          # 1    Africa 52
          # 2      Asia 33
          # 3    Europe 30
          # 4  Americas 25
          # 5   Oceania  2

gapminder %>%
  group_by(continent) %>%
  summarize(se_lifeExp = sd(lifeExp)/sqrt(n())) # calculate standard error for life expectancy across each continent
  # output:   continent se_lifeExp
          # <chr>          <dbl>
          # 1 Africa         0.366
          # 2 Americas       0.540
          # 3 Asia           0.596
          # 4 Europe         0.286
          # 5 Oceania        0.775

# mutate()
gdp_pop_by_continent_by_year <- gapminder %>%
  mutate(gdp_billion = gdpPercap*pop/10^9) %>%
  group_by(continent, year) %>%
  summarize(mean_gdpPercap = mean(gdpPercap),
            sd_gdpPercap = sd(gdpPercap),
            mean_pop = mean(pop),
            sd_pop = sd(pop),
            mean_gdpPerbillion = mean(gdp_billion),
            sd_gdpPerbillion = sd(gdp_billion))
head(gdp_pop_by_continent_by_year)
  # output:  continent  year mean_gdpPercap sd_gdpPercap mean_pop   sd_pop mean_gdpPerbillion sd_gdpPerbillion
            # <chr>     <int>          <dbl>        <dbl>    <dbl>    <dbl>              <dbl>            <dbl>
            # 1 Africa     1952          1253.         983. 4570010.   6.32e6               5.99             11.4
            # 2 Africa     1957          1385.        1135. 5093033.   7.08e6               7.36             14.5
            # 3 Africa     1962          1598.        1462. 5702247.   7.96e6               8.78             17.2
            # 4 Africa     1967          2050.        2848. 6447875.   8.99e6              11.4              23.2
            # 5 Africa     1972          2340.        3287. 7305376.   1.01e7              15.1              30.4
            # 6 Africa     1977          2586.        4142. 8328097.   1.16e7              18.7              38.1

# combining ifelse with mutate
gdp_pop_by_continent_by_year_leabove25 <- gapminder %>%
  mutate(gdp_billion = ifelse(lifeExp > 25, gdpPercap*pop/10^9, NA)) %>%
  group_by(continent, year) %>%
  summarize(mean_gdpPercap = mean(gdpPercap),
            sd_gdpPercap = sd(gdpPercap),
            mean_pop = mean(pop),
            sd_pop = sd(pop),
            mean_gdpPerbillion = mean(gdp_billion),
            sd_gdpPerbillion = sd(gdp_billion))
head(gdp_pop_by_continent_by_year_leabove25)
  # output:   continent  year mean_gdpPercap sd_gdpPercap mean_pop   sd_pop mean_gdpPerbillion sd_gdpPerbillion
            # <chr>     <int>          <dbl>        <dbl>    <dbl>    <dbl>              <dbl>            <dbl>
            # 1 Africa     1952          1253.         983. 4570010.   6.32e6               5.99             11.4
            # 2 Africa     1957          1385.        1135. 5093033.   7.08e6               7.36             14.5
            # 3 Africa     1962          1598.        1462. 5702247.   7.96e6               8.78             17.2
            # 4 Africa     1967          2050.        2848. 6447875.   8.99e6              11.4              23.2
            # 5 Africa     1972          2340.        3287. 7305376.   1.01e7              15.1              30.4
            # 6 Africa     1977          2586.        4142. 8328097.   1.16e7              18.7              38.1

# combining ggplot and dplyr
library(ggplot2)

gapminder %>% 
  filter(continent == "Americas") %>%
  ggplot(mapping = aes(x=year, y=lifeExp)) +
  geom_line() +
  facet_wrap( ~ country) +
  theme(axis.text.x = element_text(angle = 45))










