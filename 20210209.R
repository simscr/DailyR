# February 2021

library(tidyverse)

#~~~~~~~~~~~~~~~~~~~~~ 20210209 ~~~~~~~~~~~~~~~~~~~~~~~~#

library(corrplot)
library(RColorBrewer)

df <- datasets::Harman23.cor$cov 

str(df)
head(df)


corrplot(df, is.corr = T, type = "lower")

corrplot(df, is.corr = T, type = "lower", diag = F)

corrplot(df, is.corr = T, type = "lower", diag = F, method = "number")

corrplot(df, is.corr = T, type = "upper", diag = F, method = "ellipse", col = brewer.pal(n = 8, name = "Set1"))



#~~~~~~~~~~~~~~~~~~~~~ 20210210 ~~~~~~~~~~~~~~~~~~~~~~~~#

library(pacman) # not sure how much time this saves me

p_load(tidyverse, rio, ggpubr, corrplot, RColorBrewer, janitor, broom)

### MLS

p_load(httr, XML, sf, rnaturalearth, rnaturalearthdata, rgeos, maps, mapdata, ggmap, ggrepel, plotly)

# Get coordinates
url <- "https://en.wikipedia.org/wiki/List_of_Major_League_Soccer_stadiums"

r <- GET(url)

doc <- readHTMLTable(
  doc=content(r, "text"))

stadia <- doc[[2]] %>% 
  row_to_names(1) %>% 
  separate(Coordinates, sep = "/", into = c("A", "B", "C")) %>% 
  mutate(B = str_trim(B, "both")) %>% 
  separate(B, sep = " ", into = c("B2", "B3"), remove = F) %>% 
  mutate(lat = as.numeric(gsub("[^0-9.]", "", B2)),
         lon = -1*as.numeric(gsub("[^0-9.]", "", B3)))


us <- map_data("state")

mls_map <- ggplot() + 
  geom_polygon(data = us, aes(x=long, y = lat, group = group), fill = NA, color = "gray") + 
  coord_fixed(1.3) + 
  geom_point(data = stadia, aes(x = lon, y = lat), color = "red", size = 3, shape = 1) + 
  geom_text_repel(data = stadia, aes(x = lon, y = lat, label = Franchise), min.segment.length = 0) + 
  theme_void()
mls_map


mls_map2 <- ggplot() + 
  geom_polygon(data = us, aes(x=long, y = lat, group = group), fill = NA, color = "gray") + 
  coord_fixed(1.3) + 
  geom_point(data = stadia, aes(x = lon, y = lat), color = "red", size = 3, shape = 1) + 
  geom_text(data = stadia, aes(x = lon, y = lat, label = Franchise), check_overlap = T) + 
  theme_void()

ggplotly(mls_map2)

#~~~~~~~~~~~~~~~~~~~~~ 20210211 ~~~~~~~~~~~~~~~~~~~~~~~~#




