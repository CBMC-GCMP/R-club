
# Loading packages --------------------------------------------------------

library(tidyverse)
library(sf)
library(rnaturalearth)
library(ggthemes)


# Loading data ------------------------------------------------------------

countries <- st_transform(st_as_sf(ne_countries(scale = 'large', country = 'mexico')), crs = 4326)


seagrasses <- read.csv("seagrasses/data/GC_Seagrasses2021.csv", na.strings = c("","NA")) %>% 
        janitor::clean_names()


seagr_sf <- st_as_sf(seagrasses, coords = c("longitude", "latitude"), crs = 4326)


# Data wrangling ----------------------------------------------------------


seagrasses <- seagrasses %>% 
        mutate(validation = str_replace(validation, "dd", "DD")) %>%
        mutate(validation = str_replace(validation, "No", "NO")) %>%
        mutate(validation = str_replace(validation, "NO ", "NO")) %>%
        mutate(validation = str_replace(validation, "Yes", "YES")) %>%
        mutate(validation = replace_na(validation, "DD")) %>%
        mutate(validation = as.factor(validation)) 
        




# Plotting ----------------------------------------------------------------

seagr_sf %>% 
        mutate(validation = fct_recode(validation, Absent = "NO", Present = "YES")) %>% 
        ggplot() +
        geom_sf(data = countries, 
                col = "gray90",
                fill = "gray90") +         
        geom_sf(aes(col = validation),
                size = 2,
                alpha = .4) +
        coord_sf(xlim = c(-117, -105), 
                 ylim = c(22, 32.5), 
                 expand = FALSE) +
        labs(title = "Maps of Seagrasses in the Gulf of California", 
             col = " ") +
        scale_color_manual(values = c("black", "red", "darkgreen")) +
        facet_grid(validation~specie) +
        scale_y_continuous(breaks = c(24, 26, 28, 30)) +
        theme_map() +
        theme(axis.text.x = element_text(size = 7, angle = 90),
              axis.text.y = element_text(size = 7, angle = 0, hjust = .5),
              axis.title = element_text(),
              axis.ticks = element_line(),
              legend.position = "bottom", 
              legend.text = element_text(size = 12),
              strip.text.x = element_text(face = "italic"),
              strip.background = element_rect(fill = NA, color = NA))


ggsave("seagrasses/figs/validation_map.png", dpi = 300, height = 6, width = 6)





