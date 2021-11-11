
library(ggplot2)

head(mpg)


ggplot(mpg, aes(x = class, y = hwy)) +
          geom_violin(trim = F) +
          geom_boxplot(width = 0.2) +
          geom_jitter(width = 0.2)

ggplot(mpg, aes(x = displ, y = hwy)) + 
          geom_point(size = 4, 
                     alpha = 0.5, 
                     shape = 16) +
          geom_smooth(method = "lm", 
                      col = "red", 
                      fill = "red",
                      se = T)
