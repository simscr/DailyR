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

# Day 9: Smoke Basin

## Puzzle #1

    input <- advent_input(9)


    x <- input %>% 
      mutate(row = row_number()) %>% 
      mutate(value = str_split(x, "")) %>% 
      unnest(value) %>% 
      mutate(value = as.numeric(value)) %>% 
      group_by(row) %>% 
      mutate(col = row_number()) %>% 
      ungroup()

    adj <- tibble(xd = c(-1, 1, 0, 0),
                  yd = c(0, 0, -1, 1))

    adjacent <- function(d, d2) {
      d %>% 
        crossing(adj) %>% 
        mutate(row2 = row + xd,
               col2 = col + yd) %>% 
        inner_join(d2, by = c(row2 = "row", col2 = "col"), suffix = c("", "2")) %>% 
        filter(row != row2 | col != col2)
    }

    low_points <- x %>% 
      adjacent(x) %>% 
      group_by(row, col) %>% 
      summarize(low = all(value < value2)) %>% 
      filter(low) %>% 
      inner_join(x, by = c("row", "col")) %>% 
      ungroup()

    low_points %>% 
      summarize(sum(1 + value))

    ## # A tibble: 1 x 1
    ##   `sum(1 + value)`
    ##              <dbl>
    ## 1              494

Answer #1: **494** ⭐

## Puzzle #2

    frontier <- low_points %>% 
      mutate(basin = paste(row, col)) %>% 
      select(basin, row, col, value)

    basins <- frontier

    while (nrow(frontier) > 0) {
      frontier <- frontier %>% 
        adjacent(x) %>% 
        filter(value2 > value, value2 < 9) %>% 
        select(basin, row = row2, col = col2, value = value2) %>% 
        distinct(basin, row, col, .keep_all = TRUE) %>% 
        anti_join(basins, by = c("row", "col"))
      
      basins <- bind_rows(basins, frontier)
    }

    basins %>% 
      count(basin, sort = TRUE) %>% 
      head(3) %>% 
      summarize(prod(n))

    ## # A tibble: 1 x 1
    ##   `prod(n)`
    ##       <dbl>
    ## 1   1048128

Answer #2: **1048128** ⭐

# Day 10: Syntax Scoring

## Puzzle #1

    # browseURL("https://pbs.twimg.com/media/FGRdRyWXIAUx3vw?format=jpg&name=large")

    input <- advent_input(10)

    d10 <- read_lines(here("data", "aoc", "d10.txt"))

    corruption_values <- c(")" = 3, "]" = 57, "}" = 1197, ">" = 25137)

    opening <- c("(", "[", "{", "<")
    closing <- c(")", "]", "}", ">")

    opening_matches <- opening
    names(opening_matches) <- closing

    is_match <- function(x, current) {
      if (length(x) == 0) return(FALSE)
      current %in% closing && tail(x, 1) == opening_matches[current]
    }

    is_corrupt <- function(x, current) {
      if (length(x) == 0) return(FALSE)
      current %in% closing && opening_matches[current] != tail(x, 1)
    }

    test <- input %>% slice(54)

    nchar(test)

    ##  x 
    ## 94

    corruption_value <- function(line) {
      chars <- line %>% str_split("") %>% .[[1]]
      
      x <- c()
      next_char_idx <- 1
      
      while (next_char_idx <= length(chars) && !is_corrupt(x, chars[next_char_idx])) {
        if (is_match(x, chars[next_char_idx])) {
          x <- head(x, length(x) - 1)
        } else {
          x <- c(x, chars[next_char_idx])
        }
        
        next_char_idx <- next_char_idx + 1
      }
      
      if (!next_char_idx > length(chars)) {
        value <- corruption_values[chars[next_char_idx]]
      } else {
        value <- 0
      }
      
      return(value)
    }

Answer #1: **341823** ⭐

## Puzzle #2

    completion_values <- c("(" = 1, "[" = 2, "{" = 3, "<" = 4)

    incomplete_lines <- keep(d10, .p = ~{corruption_value(.x) == 0})

    completion_value <- function(line) {
      chars <- line %>% str_split("") %>% .[[1]]
      
      x <- c()
      next_char_idx <- 1
      
      while (next_char_idx <= length(chars)) {
        if (is_match(x, chars[next_char_idx])) {
          x <- head(x, length(x) - 1)
        } else {
          x <- c(x, chars[next_char_idx])
        }
        
        next_char_idx <- next_char_idx + 1
      }
      
      reduce(rev(x), function(prev, current) {
        return(prev * 5 + completion_values[current])
      }, .init = 0)
    }

Answer #2: **2801302861** ⭐

# Day 11: Dumbo Octopus

## Puzzle #1

    input <- advent_input(11)

    x <- input %>% grid_tidy(x)

    part1 <- 0

    adjacent_join <- function(x, y = x, diagonal = FALSE, suffix = c("", "2")) {
      adj <- tibble(row_delta = c(-1, 1, 0, 0),
                    col_delta = c(0, 0, -1, 1))

      if (diagonal) {
        adj <- bind_rows(adj,
                         tibble(row_delta = c(-1, -1, 1, 1),
                                col_delta = c(-1, 1, -1, 1)))
      }

      x %>%
        tidyr::crossing(adj) %>%
        mutate(row2 = row + row_delta,
               col2 = col + col_delta) %>%
        inner_join(y, by = c(row2 = "row", col2 = "col"), suffix = suffix) %>%
        filter(row != row2 | col != col2) %>%
        select(-row_delta, -col_delta)
    }

    # x <- tibble::tribble(
    #                  ~x,
    #           5483143223,
    #           2745854711,
    #           5264556173,
    #           6141336146,
    #           6357385478,
    #           4167524645,
    #           2176841721,
    #           6882881134,
    #           4846848554,
    #           5283751526
    #           ) %>% grid_tidy(x)



    for (i in 1:100) {  # change 10 i in 1:1000 get answer for Puzzle #2
      x <- x %>% 
        mutate(value = value + 1,
               flash = value > 9,
               has_flashed = flash)
      
      while (any(x$flash)) {
        part1 <- part1 + sum(x$flash)
        x <- x %>% 
          adjacent_join(diagonal = TRUE) %>% 
          group_by(row, col, value, flash, has_flashed) %>% 
          summarize(value = first(value) + sum(flash2),
                    .groups = "drop") %>% 
          mutate(flash = value > 9 & !has_flashed) %>% 
          mutate(has_flashed = flash | has_flashed)
        
        #Part 2
        if (all(x$has_flashed | x$flash)) {
          stop(paste0("All have flashed as of step ", i))
        }
      }
      x <- x %>% 
        mutate(value = ifelse(has_flashed, 0, value))
    }

Answer #1: **1652** ⭐

## Puzzle #2

Answer #2: **220** ⭐

# Day 12: Passage Pathing

    p_load(tidygraph, ggraph)

    input <- advent_input(12)

    once <- c("start", "end", "ko", "kw", "lj", "qm", "vn", "xy", "kh")
    multi <- c("DD", "KG", "MV", "VH")

    x <- input %>% 
      separate(x, into = c("from", "to"), sep = "-") %>% 
      mutate(dist = 1)


    graph_routes <- as_tbl_graph(x)

    graph_routes %>% 
      ggraph(layout = "kk") + 
      geom_edge_link() +
      geom_node_label(aes(label = name, 
                          fill = ifelse(name %in% once, "blue", "orange")), 
                      size = 4, show.legend = FALSE) + 
      scale_fill_manual(values = c("#DEC000FF", "#677E8EFF"))

<img src="C:/Users/2513851/OneDrive - University of Arkansas for Medical Sciences/work/Daily R/exports/November/d12-p1-1.png" width="100%" />

## Puzzle #1

    connections <- x %>% 
      select(from = to, to = from) %>% 
      bind_rows(x %>% select(-dist)) %>% 
      group_by(from) %>% 
      summarize(connections = list(to)) %>% 
      deframe()

    bfs <- function(node, visited_small = NULL, part1 = FALSE) {
      # Base case
      if (node == "end") {
        return(list(node))
      }
      # start can't be revisited
      if (node == "start" && "start" %in% visited_small) {
        return(NULL)
      }
      
      if (str_to_upper(node) != node) {
        visited_small <- c(visited_small, node)
      }
      
      possible_next <- connections[[node]]
      
      # part 1 = no revisiting, part 2 = 1 revisit
      if (part1 || any(duplicated(visited_small))) {
        possible_next <- setdiff(possible_next, visited_small)
      }
      
      map(possible_next, bfs, visited_small = visited_small, part = part1) %>% 
        do.call(c, .) %>% 
        map(~ c(node, .))
    }

Answer #1: **3292** ⭐

## Puzzle #2

Answer #1: **89592** ⭐

# Day 13: Transparent Origami

## Puzzle #1

    input <- advent_input(13)

    folds <- input %>% 
      slice(985:996) %>% 
      mutate(x = str_extract(x, '(x|y)=[0-9]*$')) %>% 
      separate(x, c("direction", "fold"), "=") %>% 
      mutate(fold = parse_number(fold))

    points <- input %>% 
      slice(1:983) %>% 
      separate(x, c("x", "y"), convert = TRUE) %>% 
      mutate(y = y * -1)

    points %>% 
      ggplot(aes(x, y)) + 
      geom_point() + 
      geom_vline(xintercept = folds$fold[1], color = "red") + 
      coord_fixed()

<img src="C:/Users/2513851/OneDrive - University of Arkansas for Medical Sciences/work/Daily R/exports/November/d13-p1-1.png" width="100%" />

    points2 <- points %>% 
      mutate(f1_x = case_when(x > folds$fold[1] ~ folds$fold[1] - (x - folds$fold[1]),
                            x < folds$fold[1] ~ as.numeric(x)))

    points2 %>% 
      ggplot(aes(f1_x, y)) + 
      geom_point()

<img src="C:/Users/2513851/OneDrive - University of Arkansas for Medical Sciences/work/Daily R/exports/November/d13-p1-2.png" width="100%" />

    part1 <- points2 %>% 
      distinct(f1_x, y) %>% 
      count()

Answer #1: **810** ⭐

## Puzzle #2

    points2 <- points %>% 
      mutate(x = case_when(x > folds$fold[1] ~ folds$fold[1] - (x - folds$fold[1]),
                            x < folds$fold[1] ~ as.numeric(x)),
             y = case_when(y < -folds$fold[2] ~ -folds$fold[2] + (-folds$fold[2] - y),
                            y > -folds$fold[2] ~ y),
             x = case_when(x > folds$fold[3] ~ folds$fold[3] - (x - folds$fold[3]),
                            x < folds$fold[3] ~ x),
             y = case_when(y < -folds$fold[4] ~ -folds$fold[4] + (-folds$fold[4] - y),
                            y > -folds$fold[4] ~ y),
             x = case_when(x > folds$fold[5] ~ folds$fold[5] - (x - folds$fold[5]),
                            x < folds$fold[5] ~ x),
             y = case_when(y < -folds$fold[6] ~ -folds$fold[6] + (-folds$fold[6] - y),
                            y > -folds$fold[6] ~ y),
             x = case_when(x > folds$fold[7] ~ folds$fold[7] - (x - folds$fold[7]),
                            x < folds$fold[7] ~ x),
             y = case_when(y < -folds$fold[8] ~ -folds$fold[8] + (-folds$fold[8] - y),
                            y > -folds$fold[8] ~ y),
             x = case_when(x > folds$fold[9] ~ folds$fold[9] - (x - folds$fold[9]),
                            x < folds$fold[9] ~ x),
             y = case_when(y < -folds$fold[10] ~ -folds$fold[10] + (-folds$fold[10] - y),
                            y > -folds$fold[10] ~ y),
             y = case_when(y < -folds$fold[11] ~ -folds$fold[11] + (-folds$fold[11] - y),
                            y > -folds$fold[11] ~ y),
             y = case_when(y < -folds$fold[12] ~ -folds$fold[12] + (-folds$fold[12] - y),
                            y > -folds$fold[12] ~ y))


    points2 %>% 
      ggplot(aes(x, y)) + 
      geom_tile()

<img src="C:/Users/2513851/OneDrive - University of Arkansas for Medical Sciences/work/Daily R/exports/November/d13-p2-1.png" width="100%" />

Answer #2: **HLBUBGFR** ⭐
