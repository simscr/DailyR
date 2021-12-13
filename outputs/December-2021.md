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

Answer #1: **1692075** ⭐

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

Answer #2: **1749524700** ⭐

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

# Day 3: Binary Diagnostic

The submarine has been making some odd creaking noises, so you ask it to
produce a diagnostic report just in case.

The diagnostic report (your puzzle input) consists of a list of binary
numbers which, when decoded properly, can tell you many useful things
about the conditions of the submarine. The first parameter to check is
the power consumption.

## Puzzle 1

You need to use the binary numbers in the diagnostic report to generate
two new binary numbers (called the gamma rate and the epsilon rate). The
power consumption can then be found by multiplying the gamma rate by the
epsilon rate.

Use the binary numbers in your diagnostic report to calculate the gamma
rate and epsilon rate, then multiply them together. What is the power
consumption of the submarine? (Be sure to represent your answer in
decimal, not binary.)

Answer #1: **4147524** ⭐

## Puzzle 2

    ox_bi <- d3_mat %>% 
      as.data.frame() %>% 
      filter(V1 == most_common[1]) %>% 
      filter(V2 == round(mean(.$V2) + 1e-6)) %>% 
      filter(V3 == round(mean(.$V3) + 1e-6)) %>% 
      filter(V4 == round(mean(.$V4) + 1e-6)) %>% 
      filter(V5 == round(mean(.$V5) + 1e-6)) %>% 
      filter(V6 == round(mean(.$V6) + 1e-6)) %>% 
      filter(V7 == round(mean(.$V7) + 1e-6)) %>% 
      filter(V8 == round(mean(.$V8) + 1e-6)) %>% 
      filter(V9 == round(mean(.$V9) + 1e-6)) %>% 
      filter(V10 == round(mean(.$V10) + 1e-6)) %>% 
      filter(V11 == round(mean(.$V11) + 1e-6)) %>% 
      filter(V12 == 1)

    co2_bi <- d3_mat %>% 
      as.data.frame() %>% 
      filter(V1 == least_common[1]) %>% 
      filter(V2 != round(mean(.$V2) + 1e-6)) %>% 
      filter(V3 != round(mean(.$V3) + 1e-6)) %>% 
      filter(V4 != round(mean(.$V4) + 1e-6)) %>% 
      filter(V5 != round(mean(.$V5) + 1e-6)) %>% 
      filter(V6 != round(mean(.$V6) + 1e-6)) %>% 
      filter(V7 != round(mean(.$V7) + 1e-6)) %>% 
      filter(V8 != round(mean(.$V8) + 1e-6)) %>% 
      filter(V9 != 1)

    oxygen <- strtoi(paste0(ox_bi, collapse = ""), base = 2)

    co2 <- paste0(co2_bi, collapse = "") %>% strtoi(base = 2)

    oxygen * co2

    ## [1] 3570354

Answer #2: **3570354** ⭐

## DR answer

    to_decimal <- function(x) {
      strtoi(paste0(x, collapse = ""), base = 2)
    }

    mat <- str_split(d3_df$V1, "") %>% 
      map(as.integer) %>% 
      do.call(rbind, .)

    most_common <- round(colMeans(mat))

    to_decimal(most_common) * to_decimal(1 - most_common)

    ## [1] 4147524

    filter_matrix <- function(m, index, most_common = TRUE) {
      target <- round(mean(m[, index]) + 1e-6)  # to round up
      
      if (!most_common) {
        target <- 1 - target
      }
      
      ret <- m[m[, index] == target, ]
      
      # Extracting one row from a matrix makes it a vector
      if (!is.matrix(ret)) {
        done(ret)
      } else {
        ret
      }
    }

    oxygen <- reduce(1:12, filter_matrix, .init = mat)

    co2 <- reduce(1:12, filter_matrix, .init = mat, most_common = FALSE)

    to_decimal(oxygen) * to_decimal(co2)

    ## [1] 3570354

# Day 4: Giant Squid

I couldn’t figure this one out on my own so I used @drob’s answer

    # browseURL("https://twitter.com/drob/status/1467157923512127488/photo/1")

    d4_nos <- as.integer(d4_nos)

    boards <- d4 %>% 
      group_by(card_id) %>% 
      mutate(row = row_number()) %>% 
      separate_rows(cards, sep = " +", convert = TRUE) %>% 
      group_by(card_id, row) %>% 
      mutate(col = row_number()) %>% 
      ungroup() %>% 
      mutate(turn = match(cards, d4_nos))
      

    board_turn_win <- boards %>% 
      gather(coordinate, cards, row, col) %>% 
      group_by(card_id, coordinate, cards) %>% 
      summarize(complete_on_turn = max(turn)) %>% 
      group_by(card_id) %>% 
      summarize(win_on_turn = min(complete_on_turn))

    board_scores <- board_turn_win %>% 
      inner_join(boards, by = "card_id") %>% 
      group_by(card_id, win_on_turn) %>% 
      summarize(total_undrawn = sum(cards[turn > win_on_turn]), 
                .groups = "drop") %>% 
      mutate(answer = d4_nos[win_on_turn] * total_undrawn)

    board_scores %>% 
      slice_min(win_on_turn)

    ## # A tibble: 1 x 4
    ##   card_id win_on_turn total_undrawn answer
    ##     <int>       <int>         <int>  <int>
    ## 1      41          21           829  14093

Answer #1: **14093** ⭐

## Puzzle #2

    board_scores %>% 
      slice_max(win_on_turn)

    ## # A tibble: 1 x 4
    ##   card_id win_on_turn total_undrawn answer
    ##     <int>       <int>         <int>  <int>
    ## 1      63          84           483  17388

Answer #2: **17388** ⭐

# Day 5: Hydrothermal Venture

## Puzzle #1

    d5 <- import(here("data", "aoc", "d5.xlsx"))

    d5 %>% 
      filter(x1 == x2 | y1 == y2) %>% 
      mutate(x = map2(x1, x2, seq)) %>% 
      mutate(y = map2(y1, y2, seq)) %>%
      unnest(c(x,y)) %>% 
      count(x, y) %>% 
      summarize(sum(n > 1))

    ## # A tibble: 1 x 1
    ##   `sum(n > 1)`
    ##          <int>
    ## 1         4745

Answer #1: **4745** ⭐

## Puzzle #2

    d5 %>% 
    #  filter(x1 == x2 | y1 == y2) %>% 
      mutate(x = map2(x1, x2, seq)) %>% 
      mutate(y = map2(y1, y2, seq)) %>%
      unnest(c(x,y)) %>% 
      count(x, y) %>% 
      summarize(sum(n > 1))

    ## # A tibble: 1 x 1
    ##   `sum(n > 1)`
    ##          <int>
    ## 1        18442

Answer #1: **18442** ⭐

# Day 6: Lanternfish

## Puzzle #1

    # browseURL("https://selbydavid.com/2021/12/01/advent-2021/")

    d6 <- import(here("data", "aoc", "d6.xlsx"))

    fish_0 <- as.vector(d6$timer)

    fish_count <- function(x, days = 80) {
      fish <- as.double(table(factor(x, levels = 0:8)))
      
      for (i in 1:days)
        fish <-  c(fish[2:7], fish[8] + fish[1], fish[9], fish[1])
      sum(fish)
    }

    fish_count(fish_0, days = 80)

    ## [1] 374994

Answer #1: **374994** ⭐

## Puzzle #2

    options(scipen = 999)

    fish_count(fish_0, days = 256)

    ## [1] 1686252324092

Answer #2: **1686252324092** ⭐

# Day 7: The Treachery of Whales

## Puzzle #1

    d7 <- import(here("data", "aoc", "d7.xlsx"))

    mean_loc <- floor(mean(d7$position)) # tried floor() and ceiling()
    median_loc <- round(median(d7$position))

    crabs <- d7 %>% 
      mutate(fuel_median = case_when(position < median_loc ~ median_loc - position,
                              position >= median_loc ~ position - median_loc),
             fuel_median_2 = abs(median_loc - position))  # shorter

    sum(crabs$fuel_median)

    ## [1] 349769

Answer #1:

**349769** ⭐

## Puzzle #2

    crabs <- crabs %>% 
      mutate(fuel_mean = abs(mean_loc - position),
             fuel_cost = fuel_mean / 2 * (1 + fuel_mean))

    sum(crabs$fuel_cost)

    ## [1] 99540554

Answer #2:

**99540554** ⭐

# Day 8: Seven Segment Search

## Puzzle #1

    d8 <- import(here("data", "aoc", "d8.xlsx")) %>% 
      mutate(entry = row_number(), .before = 1)

    sum_table <- d8 %>% 
      summarize(across(o1:o4, ~ nchar(.))) %>% 
      pivot_longer(everything()) %>% 
      count(value)

    sum(sum_table$n[c(1, 2, 3, 6)])

    ## [1] 514

Answer #1: **514** ⭐

## Puzzle #2
