library(ggplot2)

gapminder <- read.csv("data/gapminder_data.csv")
ggplot(data = gapminder)
  # plots will open on the righthand side
  # nothing shows up with this code because we haven't added any elements
ggplot(data = gapminder, mapping = aes(x=gdpPercap, y=lifeExp)) # aes=aesthetics
  # creates the x and y axes, but no data will show up yet - need to tell it how to show the data
ggplot(data = gapminder, mapping = aes(x=gdpPercap, y=lifeExp)) + geom_point() # shows the data as well

# changing x
ggplot(data = gapminder, mapping = aes(x=year, y=lifeExp)) + 
    geom_point() 
    # gives weird plot...data collected in one year
ggplot(data = gapminder, mapping = aes(x=year, y=lifeExp, 
    color = continent)) + 
    geom_line() # plotting line graphs, grouping colors by continent
ggplot(data = gapminder, mapping = aes(x=year, y=lifeExp, 
    group = country, color = continent)) + 
    geom_line() # grouping by country 
ggplot(data = gapminder, mapping = aes(x=year, y=lifeExp, 
    group = country, color = continent)) + 
    geom_line() + geom_point() # line and point graph
ggplot(data = gapminder, mapping = aes(x=year, y=lifeExp, 
    group = country)) + 
    geom_line(mapping = aes(color = continent)) + 
    geom_point() #  puts color only on lines, not points - lines are behind points
ggplot(data = gapminder, mapping = aes(x=year, y=lifeExp, 
    group = country)) + 
    geom_point() +
    geom_line(mapping = aes(color = continent)) # puts lines on top of points, not behind the points

# original plot - using this graph for next exercises
ggplot(data = gapminder, mapping = aes(x=gdpPercap, y=lifeExp)) + geom_point()

# scaling and alpha
ggplot(data = gapminder, mapping = aes(x=gdpPercap, y=lifeExp)) + 
    geom_point(alpha = 0.5) + # setting alpha level to transform data
    scale_x_log10() # transforming the x data using log10
?geom_smooth # tells you the different ways to visualize the data

# using lm method with geom_smooth
ggplot(data = gapminder, mapping = aes(x=gdpPercap, y=lifeExp)) + 
  geom_point(alpha = 0.5) +
  scale_x_log10() +
  geom_smooth(method="lm") # gives you the line of best fit
# changing the width of the line of best fit
ggplot(data = gapminder, mapping = aes(x=gdpPercap, y=lifeExp)) + 
  geom_point(alpha = 0.5) +
  scale_x_log10() +
  geom_smooth(method="lm", linewidth=1.5) 

# creating a multipanel plot
# first need to subset the data
americas <- gapminder[gapminder$continent == "Americas",]
ggplot(data = americas, mapping = aes(x=year, y=lifeExp)) + 
  geom_line() +
  facet_wrap( ~ country) + # gives you a different plot for each country in the Americas
  theme(axis.text.x = element_text(angle = 45)) # changes the angle of the x-axis tick labels by 45 degrees

# adding labels
americas <- gapminder[gapminder$continent == "Americas",]
ggplot(data = americas, mapping = aes(x=year, y=lifeExp)) + 
  geom_line() +
  facet_wrap( ~ country) +
  theme(axis.text.x = element_text(angle = 45)) +
  labs(x = "Year", y = "Life Expectancy", title = "Figure 1")

# adding color
americas <- gapminder[gapminder$continent == "Americas",]
ggplot(data = americas, mapping = aes(x=year, y=lifeExp, color = continent)) + 
  geom_line() +
  facet_wrap( ~ country) +
  theme(axis.text.x = element_text(angle = 45)) +
  labs(x = "Year", y = "Life Expectancy", title = "Figure 1")

americas <- gapminder[gapminder$continent == "Americas",]
ggplot(data = americas, mapping = aes(x=year, y=lifeExp, color = continent)) + 
  geom_line() +
  facet_wrap( ~ country) +
  theme(axis.text.x = element_text(angle = 45)) +
  labs(x = "Year", y = "Life Expectancy", title = "Figure 1", color = "Continent")
  theme_minimal()

# exporting the plot
americas <- gapminder[gapminder$continent == "Americas",]
life_expect_plot <- ggplot(data = americas, mapping = aes(x=year, y=lifeExp, color = continent)) + 
    geom_line() +
    facet_wrap( ~ country) +
    theme(axis.text.x = element_text(angle = 45)) +
    labs(x = "Year", y = "Life Expectancy", title = "Figure 1")
ggsave(filename = "results/life_exp.png", 
       plot = life_expect_plot, 
       width = 12, 
       height = 10, 
       dpi = 300, # sets resolution of graphic - typically want to do 450-600, but that takes time
       units = "cm")
  # output: filepath: workshops/analysis/results

# changing theme
life_expect_plot + theme_dark() # dark mode
# there are other themes - look them up and apply them similarly










