# 20220201: #TidyTuesday and Dog Breeds

# 20220202 - 20220203: Custom `ggplot` Theme

Just for fun, I’m going to setup a custom plotting theme for ggplot. I
may incorporate this into `crsp` if it seems useful.

    mtcars %>% 
      ggplot(aes(hp, mpg, fill = as.factor(cyl))) + 
      geom_smooth(method = "lm", se = FALSE, color = "black") + 
      geom_point(shape = 21, size = 4) + 
      scale_fill_manual(values = hexes) +
      labs(title = "No Theme", subtitle = "test 2", x = "Horse Power", y = "MPG", fill = "Cylinders")

<img src="C:/Users/simsc/Desktop/DailyR/exports/February_2022/crsp-theme-2-1.png" width="672" />

    mtcars %>% 
      ggplot(aes(hp, mpg, fill = as.factor(cyl))) + 
      geom_smooth(method = "lm", se = FALSE, color = "black") + 
      geom_point(shape = 21, size = 4) + 
      scale_fill_manual(values = hexes) +
      labs(title = "theme_crsp", subtitle = "test 2", x = "Horse Power", y = "MPG", fill = "Cylinders") +
      theme_crsp()

<img src="C:/Users/simsc/Desktop/DailyR/exports/February_2022/crsp-theme-2-2.png" width="672" />

# 20220204: `{reactable}` and Harry Potter Kaggle Dataset

<img src="C:/Users/simsc/Desktop/DailyR/exports/February_2022/04-table-1.png" width="672" />

# Ideas

{template}, {rprojroot}, {rgbif}, {geoviz}, {ggmap}, {rayvista},
{camcorder}, {renv}, {rayvertex}, {hrbrthemes}, {firatheme}, {pwr},
voronoi, {reprex}, debug = T for geom\_text, {lcmm}, {rolldown}, {muvr},
{pcalg}, {packagemetrics}, {steveproj}, {ungeviz}, {themis}, {biscale},
{prettydoc}, {annotate}, {printy}, {roughsf}, {colorspace}

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

<https://www.tjmahr.com/lists-knitr-secret-weapon/>
