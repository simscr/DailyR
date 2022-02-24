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

# 20220204: **[`{reactable}`](https://glin.github.io/reactable/index.html)** and Harry Potter Kaggle Dataset

<img src="C:/Users/simsc/Desktop/DailyR/exports/February_2022/04-table-1.png" width="672" />

# 20220207: **[`{reactable}`](https://glin.github.io/reactable/index.html)** and Harry Potter Kaggle Dataset - Number 2

<img src="C:/Users/simsc/Desktop/DailyR/exports/February_2022/05-table-1.png" width="672" />

Also see,
**[`reactablefmtr`](https://github.com/kcuilla/reactablefmtr)**

# 20220208 and 20220209: #TidyTuesday and the Tuskegee Airmen

# 20220210 and 20220211: **[`ggvoronoi`](https://cran.r-project.org/web/packages/ggvoronoi/vignettes/ggvoronoi.html)**

<img src="C:/Users/simsc/Desktop/DailyR/exports/February_2022/ggvoronoi-plots-1.png" width="672" /><img src="C:/Users/simsc/Desktop/DailyR/exports/February_2022/ggvoronoi-plots-2.png" width="672" />

# 20220214: **[`ggvoronoi`](https://cran.r-project.org/web/packages/ggvoronoi/vignettes/ggvoronoi.html)** in a heart

# 20220215 and 20220216: #TidyTuesday and #DuBoisChallenge2022

I’m going to try Day 6.

<img src="C:/Users/simsc/Desktop/DailyR/exports/February_2022/webd-d6-1.png" width="672" />

It’ll do for the amount of time I have.

# 20220217: **[{engsoccerdata}](https://github.com/jalapic/engsoccerdata)**

<img src="C:/Users/simsc/Desktop/DailyR/exports/February_2022/esd-tests-1.png" width="672" />

# 20220218: More Soccer Data

    ##                      team position year
    ## 1        Tampa Bay Mutiny        1 1996
    ## 2               LA Galaxy        2 1996
    ## 3               FC Dallas        3 1996
    ## 4    Sporting Kansas City        4 1996
    ## 5               DC United        5 1996
    ## 6           Columbus Crew        6 1996
    ## 7      New York Red Bulls        7 1996
    ## 8    San Jose Earthquakes        8 1996
    ## 9  New England Revolution        9 1996
    ## 10        Colorado Rapids       10 1996
