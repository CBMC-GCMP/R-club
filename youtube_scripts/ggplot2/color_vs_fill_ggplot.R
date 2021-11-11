
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
                      width = 0.2) +
          scale_fill_viridis_d() +
          labs(x = "Class", y = "H.W.Y.", title = "A nice plot", 
               subtitle = "A very nice plot", caption = "Made with ggplot2") +
          coord_flip() +
          theme_classic() +
          theme(plot.background = element_rect(fill = "black", 
                                               color = "black"), 
                panel.background = element_rect(fill = "black", 
                                                color = "black"),
                panel.border = element_rect(color = "white", 
                                            fill = NA),
                legend.position = "", 
                text = element_text(color = "white"), 
                axis.text = element_text(color = "gray70"), 
                axis.ticks = element_line(color = "gray70"), 
                axis.line = element_line(color = "gray70"), 
                axis.text.x = element_text(angle = 0),
                axis.text.y = element_text(angle = 0),
                plot.title = element_text(face = "bold", size = 22))



ggplot(mpg, aes(x = displ, y = hwy, col = class, fill = class)) + 
          geom_point(col = "black",
                     size = 2, 
                     alpha = 0.5, 
                     shape = 21) +
          geom_smooth(method = "lm", 
                      se = F) +
          geom_smooth(method = "lm", 
                      col = "black",
                      fill = "black") +
          labs(x = "Displacement", y = "H.W.Y.", title = "A nice plot",
                subtitle = "A very nice scatterplot", caption = "Made with ggplot2") +
          theme_classic() +
          theme(plot.background = element_rect(fill = "black", 
                                               color = "black"), 
                panel.background = element_rect(fill = "gray90", 
                                                color = "black"),
                panel.border = element_rect(color = "white", 
                                            fill = NA),
                legend.position = "", 
                text = element_text(color = "white"), 
                axis.text = element_text(color = "gray70"), 
                axis.ticks = element_line(color = "gray70"), 
                axis.line = element_line(color = "gray70"), 
                axis.text.x = element_text(angle = 0),
                axis.text.y = element_text(angle = 0),
                plot.title = element_text(face = "bold", size = 22))
