# 20211101: Part 1 - trying [{ggeasy}](https://jonocarroll.github.io/ggeasy/)

    penguins_labs %>% 
      ggplot(aes(bill_length_mm, bill_depth_mm, color = island)) + 
      geom_point() + 
      easy_add_legend_title("Island", teach = T)

<img src="C:/Users/2513851/OneDrive - University of Arkansas for Medical Sciences/work/Daily R/exports/November/ggeasy-plot-1.png" width="100%" />

    penguins_labs %>% 
      ggplot(aes(bill_length_mm, bill_depth_mm, color = species)) + 
      geom_point() + 
      easy_labs()  # gets label from labelled data frame

<img src="C:/Users/2513851/OneDrive - University of Arkansas for Medical Sciences/work/Daily R/exports/November/ggeasy-plot-2.png" width="100%" />

# 20211101: Part 2 - Day 1 of [30 Day Map Challenge](https://github.com/tjukanovt/30DayMapChallenge)

**Day 1**: Points

The 30 day map challenge is a way to try different map styles and to get
more familiar with mapping in R.

<img src="C:/Users/2513851/OneDrive - University of Arkansas for Medical Sciences/work/Daily R/exports/November/day-1-map-1.png" width="100%" />

# 20211102: Day 2 of [30 Day Map Challenge](https://github.com/tjukanovt/30DayMapChallenge)

**Day 2**: Lines

<img src="C:/Users/2513851/OneDrive - University of Arkansas for Medical Sciences/work/Daily R/exports/November/day-2-map-1.png" width="100%" />

# 20211103: Day 3 of [30 Day Map Challenge](https://github.com/tjukanovt/30DayMapChallenge)

**Day 3**: Polygons

<img src="C:/Users/2513851/OneDrive - University of Arkansas for Medical Sciences/work/Daily R/exports/November/day-3-map-static-1.png" width="100%" />

I tried to animate this using `gganimate`, but I couldn’t get it to
work. I think I will have more opportunites to try this.

# 20211104: Day 4 of [30 Day Map Challenge](https://github.com/tjukanovt/30DayMapChallenge)

**Day 4**: Hexagons

<img src="C:/Users/2513851/OneDrive - University of Arkansas for Medical Sciences/work/Daily R/exports/November/day-4-plotb-1.png" width="100%" />

# Render

# Ideas

template, rprojroot, rgbif, geoviz, ggmap, rayvista, camcorder, {renv},
{rayvertex}, {hrbrthemes}, {firatheme}, {pwr}, voronoi, {reprex}, debug
= T for geom\_text, {lcmm}, {rolldown}, {muvr}, {pcalg},
{packagemetrics}, {steveproj}, {ungeviz}, {themis}, {biscale},
{prettydoc}, {annotate},

<https://github.com/richardvogg/30DayMapChallenge21>

<https://albert-rapp.de/post/2021-09-16-similar-data-and-list-like-columns/#helpful-concepts>

<https://www.swisstopo.admin.ch/>

<https://www.ign.es/web/ign/portal/cbg-area-cartografia>

<http://shadedrelief.com/SampleElevationModels/>

<https://www.neonscience.org/resources/learning-hub/tutorials>

<https://docs.ropensci.org/rgbif/articles/rgbif.html>

<https://ryo-n7.github.io/2020-05-14-webscrape-soccer-data-with-R/>

<https://github.com/gkaramanis/aRt/blob/master/split-bar/split-bar.R>

<https://github.com/thebioengineer/camcorder>

<https://gist.github.com/Worville/c4149ece45a75928a404d316151ba0fe>
