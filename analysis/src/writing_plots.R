library(ggplot2)

ggplot(gapminder,
       aes(x = year, y = lifeExp, color = country)) +
    geom_line() +
    theme(legend.position = "none")

# save most recent ggplot
ggsave("most_recent_gapminder+plot.pdf")

# then follow gui instructions

# save as pdf
pdf("plot_from_function_pdf_gapminder.pdf",
    width = 12, height = 4) # creates blank pdf file
ggplot(gapminder,
       aes(x = year, y = lifeExp, color = country)) +
  geom_line() +
  theme(legend.position = "none") # creates plot
dev.off() # saves plot to pdf file

pdf("plot_from_func_pdf_gapminder_2.pdf",
    width = 12,
    height = 4,
    pointsize = 12, 
    family = "sans")
ggplot(gapminder,
       aes(x = year, y = lifeExp, color = country)) +
  geom_line() +
  theme(legend.position = "none") 
dev.off() 

# creating multiple plots in one pdf
pdf("multipage.pdf", width = 10, height = 6)
plot (x = 1:10, y = 1:10)
plot (x = 1:10, y = (1:10)^2)
plot (x = 1:10, y = sqrt(1:10))
dev.off()

svg()
jpeg()
png()

