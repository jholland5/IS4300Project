# Cricketer

c <- read.csv("cricketer.csv")
head(c)
x <- c$AOD[c$hand == "right"]
y <- c$AOD[c$hand == "left"]
t.test(x,y)

library(ggplot2)
library(dplyr)
g <- c %>% ggplot()
g + geom_density(aes(AOD,fill=hand),alpha = .5)
# There is a little bump among lefties in the 20-40 range.