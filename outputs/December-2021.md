The [Advent of Code](https://adventofcode.com/) is a daily challenge
series that has two puzzles each day. You get a star for each puzzle
solved. Try to get all 50!

# Introduction

You’re minding your own business on a ship at sea when the overboard
alarm goes off! You rush to see if you can help. Apparently, one of the
Elves tripped and accidentally sent the sleigh keys flying into the
ocean!

Before you know it, you’re inside a submarine the Elves keep ready for
situations like this. It’s covered in Christmas lights (because of
course it is), and it even has an experimental antenna that should be
able to track the keys if you can boost its signal strength high enough;
there’s a little meter that indicates the antenna’s signal strength by
displaying 0-50 stars.

Your instincts tell you that in order to save Christmas, you’ll need to
get all fifty stars by December 25th.

Collect stars by solving puzzles. Two puzzles will be made available on
each day in the Advent calendar; the second puzzle is unlocked when you
complete the first. Each puzzle grants one star. Good luck!

As the submarine drops below the surface of the ocean, it automatically
performs a sonar sweep of the nearby sea floor. On a small screen, the
sonar sweep report (your puzzle input) appears: each line is a
measurement of the sea floor depth as the sweep looks further and
further away from the submarine.

# Day 1: Sonar Sweep

The first order of business is to figure out how quickly the depth
increases, just so you know what you’re dealing with - you never know if
the keys will get carried into deeper water by an ocean current or a
fish or something.

## Puzzle 1

To do this, count the number of times a depth measurement increases from
the previous measurement. (There is no measurement before the first
measurement.)

    depth2 <- depth %>% 
      mutate(prev_val = lag(depth),
             change = ifelse(prev_val < depth, "Increased", "Decreased"))

    sum_table <- depth2 %>% count(change)

    sum_table %>% flextable()

The answer to the first puzzle is **1446**. ⭐

## Puzzle 2

Consider sums of a three-measurement sliding window. How many sums are
larger than the previous sum?

    depth3 <- depth2 %>% 
      mutate(sum_val_3 = depth + lead(depth, n = 1) + lead(depth, n = 2),
             prev_sum = lag(sum_val_3),
             change_sum = ifelse(prev_sum < sum_val_3, "Increased", "Decreased"))

    sum_table2 <- depth3 %>% count(change_sum)

    sum_table2 %>% flextable()

The answer to the second puzzle is **1486**. ⭐

## David Robinson’s (\[@drob\](<https://twitter.com/drob>)) answers

    x <- as.vector(depth$depth)  # he probably just imported as a vector

    sum(x > lag(x), na.rm = TRUE)

    ## [1] 1446

    sum(x > lag(x, n = 3), na.rm = TRUE)

    ## [1] 1486

# Day 2: Dive!

Calculate the horizontal position and depth you would have after
following the planned course. What do you get if you multiply your final
horizontal position by your final depth?

## Puzzle 1

It seems like the submarine can take a series of commands like forward
1, down 2, or up 3:

-   forward X increases the horizontal position by X units.
-   down X increases the depth by X units.
-   up X decreases the depth by X units.

<!-- -->

    d2_dt <- d2 %>% as_tibble() %>% 
      separate(value, into = c("direction", "distance"), sep = " ") %>% 
      mutate(distance = as.numeric(distance))



    location <- d2_dt %>% 
      group_by(direction) %>% 
      summarize(across(distance, sum))

    location %>% flextable()

Answer #1: **1.692075^{6}** ⭐

## Puzzle 2

In addition to horizontal position and depth, you’ll also need to track
a third value, aim, which also starts at 0. The commands also mean
something entirely different than you first thought:

-   down X increases your aim by X units.

-   up X decreases your aim by X units.

-   forward X does two things:

    -   It increases your horizontal position by X units.
    -   It increases your depth by your aim multiplied by X.

<!-- -->

    sum_aim <- d2_dt %>% 
      mutate(x = case_when(direction == "forward" ~ 1,
                           TRUE ~ 0),
             y = case_when(direction == "up" ~ -1,
                           direction == "down" ~ 1,
                           TRUE ~ 0)) %>% 
      mutate(aim = cumsum(distance * y)) %>% 
      summarize(horizontal = sum(distance * x),
                depth = sum(distance * aim * x),
                product = depth * horizontal)

Answer #2: **1.7495247^{9}** ⭐

## DR answer

    directions <- tribble(
      ~ direction, ~ x, ~ y,
      "down", 0, 1,
      "up", 0, -1,
      "forward", 1, 0
    )

    joined <- d2_dt %>% 
      inner_join(directions, by = "direction")


    # Puzzle 1
    joined %>% 
      summarize(horizontal = sum(distance * x),
                depth = sum(distance * y),
                product = horizontal * depth)

    ## # A tibble: 1 x 3
    ##   horizontal depth product
    ##        <dbl> <dbl>   <dbl>
    ## 1       1925   879 1692075

    # Puzzle 2
    joined %>% 
      mutate(aim = cumsum(y * distance)) %>% 
      summarize(horizontal = sum(distance * x),
                depth = sum(aim * distance * x),
                product = horizontal * depth)

    ## # A tibble: 1 x 3
    ##   horizontal  depth    product
    ##        <dbl>  <dbl>      <dbl>
    ## 1       1925 908844 1749524700
