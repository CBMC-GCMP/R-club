
library(ggplot2)

head(mpg)

ggplot(mpg, aes(x = class, y = hwy, fill = class)) +
          geom_violin(col = "white", 
                      trim = F) +
          geom_boxplot(fill = "white", 
                       col = "black",
                       outlier.color = NA, 
                       outlier.fill = NA,
                       width = 0.2) +
          geom_jitter(col = "black", 
                      shape = 21, 
                      width = 0.2)


ggplot(mpg, aes(x = displ, y = hwy, col = class, fill = class)) + 
          geom_point(col = "black",
                     size = 2, 
                     alpha = 0.5, 
                     shape = 21) +
          geom_smooth(method = "lm", 
                      se = F) +
          geom_smooth(method = "lm", 
                      col = "black",
                      fill = "black")
