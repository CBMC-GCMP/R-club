
library(ggplot2)

head(mpg)


ggplot(mpg, aes(x = displ, y = hwy)) + 
          geom_point() + 
          geom_smooth()

