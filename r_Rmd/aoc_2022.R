
# Advent of Code 2022 -----------------------------------------------------

pacman::p_load(tidyverse, rio, here, janitor, ggpubr, rstatix)

conflicted::conflict_prefer("select", "dplyr")
conflicted::conflict_prefer("filter", "dplyr")
conflicted::conflict_prefer("clean_names", "janitor")
conflicted::conflict_prefer("lag", "dplyr")

theme_set(theme_bw(base_size = 15) + 
            theme(legend.position = "bottom", 
                  legend.direction = "horizontal"))

#

# Day 1 -------------------------------------------------------------------

d1 <- import(here("data", "aoc", "2022", "d1.txt"), setclass = "tibble") %>% 
  clean_names()

d1 %>% 
  mutate(id = cumsum(is.na(d1$v1))) %>% 
  group_by(id) %>% 
  summarize(total = sum(v1, na.rm = TRUE)) %>% 
  slice_max(total)

# d1.1 = 74711

d1 %>% 
  mutate(id = cumsum(is.na(d1$v1))) %>% 
  group_by(id) %>% 
  summarize(total = sum(v1, na.rm = TRUE)) %>% 
  slice_max(total, n = 3) %>% 
  summarize(total_top_3 = sum(total, na.rm = TRUE))

# d1.2 = 209481


# Day 2 -------------------------------------------------------------------

key.1 <- tribble(
  ~opp, ~me, ~name, ~score,
  "A", "X", "Rock", 1,
  "B", "Y", "Paper", 2, 
  "C", "Z", "Scissors", 3
)

scoring <- tibble(
  result = c("win", "draw", "loss"),
  points = c(6, 3, 0)
)

d2.1 <- read_delim(here("data", "aoc", "2022", "d2.txt"), delim = " ", col_names = FALSE) %>% 
  rename(opp_play = X1, self_play = X2) %>% 
  left_join(key.1 %>% select(opp, name), by = c("opp_play" = "opp")) %>% 
  left_join(key.1 %>% select(me, name, score), by = c("self_play" = "me")) %>% 
  rename(opp_name = name.x, self_name = name.y) %>% 
  mutate(result = case_when(opp_name == self_name ~ "draw",
                            opp_name == "Rock" & self_name == "Scissors" ~ "loss",
                            opp_name == "Paper" & self_name == "Rock" ~ "loss",
                            opp_name == "Scissors" & self_name == "Paper" ~ "loss",
                            TRUE ~ "win")) %>% 
  left_join(scoring) %>% 
  mutate(final_score = score + points)

sum(d2.1$final_score)

# d2.1 = 12772


key.2 <- tribble(
  ~opp, ~result_code, ~opp_name, ~score, ~result,
  "A", "X", "Rock", 1, "loss",
  "B", "Y", "Paper", 2, "draw", 
  "C", "Z", "Scissors", 3, "win"
) 

d2.2 <- read_delim(here("data", "aoc", "2022", "d2.txt"), delim = " ", col_names = FALSE) %>% 
  rename(opp_play = X1, result_code = X2) %>% 
  left_join(key.2 %>% select(opp, opp_name), by = c("opp_play" = "opp")) %>% 
  left_join(key.2 %>% select(result_code, result)) %>% 
  left_join(scoring) %>% 
  mutate(self_play = case_when(result == "draw" ~ opp_name, 
                               result == "win" & opp_name == "Rock" ~ "Paper",
                               result == "win" & opp_name == "Paper" ~ "Scissors",
                               result == "win" & opp_name == "Scissors" ~ "Rock",
                               result == "loss" & opp_name == "Rock" ~ "Scissors",
                               result == "loss" & opp_name == "Paper" ~ "Rock",
                               result == "loss" & opp_name == "Scissors" ~ "Paper")) %>% 
  left_join(key.2 %>% select(self_play = opp_name, score)) %>% 
  mutate(final_score = points + score)

sum(d2.2$final_score)

# d2.2 = 11618


# Day 3 -------------------------------------------------------------------

key.3 <- tibble(
  letter = c(letters, LETTERS),
  value = 1:52
)

# d3.1 <- read_delim(here("data", "aoc", "2022", "d3.txt"), delim = " ", col_names = FALSE) %>% 
#   rename(packing = X1) %>% 
#   mutate(length = nchar(packing)) %>% 
#   mutate(c1 = str_sub(packing, start = 1, end = length / 2),
#          c2 = str_sub(packing, start = length / 2 + 1, end = length)) %>% 
#   rowwise() %>% 
#   mutate(matching = list(intersect(as.list(c1), as.list(c2))))
# 
# test %>% strsplit(split = "") %>% 
#   as_tibble(.name_repair = "minimal") %>% 
#   rename("letter" = 1) %>% 
#   left_join(key.3)


# from Emil Hvitfeldt
d3.1 <- readLines(here("data", "aoc", "2022", "d3.txt")) %>% 
  strsplit(split = "")

score <- c(letters, LETTERS)

common_split <- function(x) {
  half <- length(x) / 2
  intersect(
    head(x, half), tail(x, half)
  )
}


map_chr(d3.1, common_split) %>% 
  match(score) %>% 
  sum()

 # d3.1 = 8088



d3.2 <- readLines(here("data", "aoc", "2022", "d3.txt")) %>% 
  strsplit(split = "")

input_group <- split(d3.2, rep(seq_len(length(d3.2) / 3), each = 3))

common_group <- function(x) {
  x[[1]] |>
    intersect(x[[2]]) |>
    intersect(x[[3]])
}

common_group(d3.2)

map_chr(input_group, common_group) |>
  match(score) |>
  sum()

# d3.2 = 2522



# Day 4 -------------------------------------------------------------------

# d4.1 <- readLines(here("data", "aoc", "2022", "d4.txt")) %>% 
#   as_tibble() %>% 
#   separate(value, into = c("e1", "e2"), sep = ",") %>% 
#   separate(e1, into = c("e1.1", "e1.2"), sep = "-") %>% 
#   separate(e2, into = c("e2.1", "e2.2"), sep = "-") %>% 
#   mutate(pair = row_number(), 
#          # elf_id = rep(c("a", "b"), 500),
#          .before = 1) %>% 
#   rowwise() %>% 
#   mutate(overlap = case_when(e2.1 >= e1.1 & e2.2 <= e1.2 ~ TRUE,
#                              e1.1 >= e2.1 & e1.2 <= e2.2 ~ TRUE,
#                              TRUE ~ FALSE))
# 
# d4.1 %>% 
#   pivot_longer(cols = e1.1:e2.2) %>% 
#   mutate(elf_id = rep(c("a", "b"), each = 2, len = 4000))

# from Emil Hvifeldt

d4.1 <- readLines(here("data", "aoc", "2022", "d4.txt")) |>
  strsplit("[-,]") |>
  map(as.integer)

contain <- function(x) {
  seq1 <- seq(x[1], x[2])
  seq2 <- seq(x[3], x[4])
  
  length(setdiff(seq1, seq2)) == 0 ||
    length(setdiff(seq2, seq1)) == 0
}

map_lgl(d4.1, contain) |> sum()

#d4.1 = 536

# modified from EH code above.

overlap <- function(x) {
  seq1 <- seq(x[1], x[2])
  seq2 <- seq(x[3], x[4])
  
  length(intersect(seq1, seq2)) > 0
}

map_lgl(d4.1, overlap) |> sum()


# d4.2 = 845



# Day 5 -------------------------------------------------------------------

d5.1 <- readLines(here("data", "aoc", "2022", "d5.txt"))
delim <- which(d5.1 == "")

cargo <- d5.1[seq(1, delim - 2)]
insts <- d5.1[seq(delim + 1, length(d5.1))] |>
  str_extract_all("[0-9]+") |>
  map(as.integer)

box_loc <- seq(1, (max(nchar(cargo)) + 1) / 4) * 4 - 2

stacks <- map(box_loc, ~ str_sub(cargo, .x, .x)) |>
  map(setdiff, c("", " ")) |>
  map(rev)

for (inst in insts) {
  from <- inst[2]
  to <- inst[3]
  amount <- inst[1]
  stacks[[to]] <- c(stacks[[to]], rev(tail(stacks[[from]], amount)))
  stacks[[from]] <- head(stacks[[from]], -amount)
}

purrr::map_chr(stacks, tail, 1) |> paste(collapse = "")

# d5.1 = VCTFTJQCG

d5.1 <- readLines(here("data", "aoc", "2022", "d5.txt"))
delim <- which(d5.1 == "")

cargo <- d5.1[seq(1, delim - 2)]
insts <- d5.1[seq(delim + 1, length(d5.1))] |>
  str_extract_all("[0-9]+") |>
  map(as.integer)

box_loc <- seq(1, (max(nchar(cargo)) + 1) / 4) * 4 - 2

stacks <- map(box_loc, ~ str_sub(cargo, .x, .x)) |>
  map(setdiff, c("", " ")) |>
  map(rev)

for (inst in insts) {
  from <- inst[2]
  to <- inst[3]
  amount <- inst[1]
  stacks[[to]] <- c(stacks[[to]], tail(stacks[[from]], amount))
  stacks[[from]] <- head(stacks[[from]], -amount)
}

purrr::map_chr(stacks, tail, 1) |> paste(collapse = "")

# d5.2 = GCFGLDNJZ


# Day 6 -------------------------------------------------------------------

tictoc::tic()
d6.1 <- readLines(here("data", "aoc", "2022", "d6.txt")) %>% 
  strsplit(split = "") %>% 
  unlist()

d6.1 %>% 
  as_tibble() %>% 
  mutate(row_number = row_number(),
         letter_set = paste0(lag(value, 3), ", ", lag(value, 2), ", ", lag(value, 1), ", ", value)) %>% 
  rowwise() %>% 
  mutate(dupe_total = sum(duplicated(unlist(strsplit(letter_set, split = ", "))))) %>% 
  filter(dupe_total == 0) # row_number is answer

# tictoc::toc()

# d6.1 = 1855

# for (n_letter in seq_along(d6.1)) {
#   l1 <- ifelse(n_letter - 3 <= 0, NA_character_, d6.1[n_letter - 3])
#   l2 <- ifelse(n_letter - 2 <= 0, NA_character_, d6.1[n_letter - 2])
#   l3 <- ifelse(n_letter - 1 <= 0, NA_character_, d6.1[n_letter - 1])
#   l4 <- ifelse(n_letter <= 0, NA_character_, d6.1[n_letter])
# 
#   lets <- paste0(c(l1, l2, l3, l4), collapse = ", ")
# 
#   value <- sum(duplicated(lets))
#   
#   # print(paste0(value, ":", lets))
#   
#   # print(list(value, lets))
#   
#   # print(tibble(
#   #   letter_set = lets, 
#   #   rep_value = value
#   # ))
# 
# }


# There's probably a better way to do this, but this worked :)
d6.1 %>% 
  as_tibble() %>% 
  mutate(row_number = row_number(),
         letter_set = paste0(lag(value, 13), ", ", lag(value, 12), ", ", lag(value, 11), ", ",
                             lag(value, 10), ", ", lag(value, 9), ", ", lag(value, 8), ", ",
                             lag(value, 7), ", ", lag(value, 6), ", ", lag(value, 5), ", ",
                             lag(value, 4), ", ", lag(value, 3), ", ", lag(value, 2), ", ",
                             lag(value, 1), ", ", value)) %>% 
  rowwise() %>% 
  mutate(dupe_total = sum(duplicated(unlist(strsplit(letter_set, split = ", "))))) %>% 
  filter(dupe_total == 0) # row_number is answer

tictoc::toc()
# d6.2 = 3256


# Day 7 -------------------------------------------------------------------

d7 <- readLines(here("data", "aoc", "2022", "d7.txt"))

d7_work <- d7 %>% as_tibble() %>% 
  mutate(id = row_number(), 
         size = parse_number(value), 
         level_0 = case_when(value == "$ cd /" ~ "root", 
                             TRUE ~ NA_character_),
         level_1 = case_when(str_detect(value, "cd [:lower:]") ~ value,
                             TRUE ~ NA_character_), 
         move_in = case_when(str_detect(value, "cd [:lower:]") & !is.na(level_1) ~ TRUE,
                             TRUE ~ FALSE))



sum(d7_work$size, na.rm = TRUE)

input <- d7

# EH
disk <- list()
i <- 2
path <- c(NULL)

while (i <= length(input)) {
  if (input[i] == "$ ls") {
    repeat {
      i <- i + 1
      if (i > length(input)) break
      if (str_detect(input[i], "^\\$")) break
      if (str_detect(input[i], "^dir")) {
        dir_name <- str_remove(input[i], "dir ")
        disk[[c(path, dir_name)]] <- list()
      } else {
        file_name <- str_remove(input[i], "\\d+ ")
        file_value <- str_extract(input[i], "\\d+") |> as.numeric()
        disk[[c(path, file_name)]] <- file_value
      }
    }
  } else if (str_detect(input[i], "^\\$ cd \\.\\.")) {
    path <- path[-length(path)]
    i <- i + 1
  } else if (str_detect(input[i], "^\\$ cd")) {
    next_dir <- str_remove(input[i], "^\\$ cd ")
    path <- c(path, next_dir)
    i <- i + 1
  }
}

dir_sums <- list()

lists <- map_lgl(disk, is.list)
unused_folders <- as.list(names(disk)[lists])

repeat {
  if (length(unused_folders) == 0) break
  path <- unused_folders[[1]]
  lists <- map_lgl(disk[[path]], is.list)
  if (any(lists)) {
    new_lists <- names(lists)[lists]
    for (new_list in new_lists) {
      unused_folders <- c(list(c(path, new_list)), unused_folders)
    }
  } else {
    dir_sum <- sum(unlist(disk[[path]]))
    dir_sums[paste(path, collapse = "_")] <- dir_sum
    disk[[path]] <- dir_sum
    unused_folders[[1]] <- NULL
  }
}

dir_sums$total <- sum(unlist(disk))
dir_sums <- unlist(dir_sums)

dir_sums[dir_sums < 100000] |>
  sum()


# d7.1 = 1118405

input <- d7

disk <- list()
i <- 2
path <- c(NULL)

while (i <= length(input)) {
  if (input[i] == "$ ls") {
    repeat {
      i <- i + 1
      if (i > length(input)) break
      if (str_detect(input[i], "^\\$")) break
      if (str_detect(input[i], "^dir")) {
        dir_name <- str_remove(input[i], "dir ")
        disk[[c(path, dir_name)]] <- list()
      } else {
        file_name <- str_remove(input[i], "\\d+ ")
        file_value <- str_extract(input[i], "\\d+") |> as.numeric()
        disk[[c(path, file_name)]] <- file_value
      }
    }
  } else if (str_detect(input[i], "^\\$ cd \\.\\.")) {
    path <- path[-length(path)]
    i <- i + 1
  } else if (str_detect(input[i], "^\\$ cd")) {
    next_dir <- str_remove(input[i], "^\\$ cd ")
    path <- c(path, next_dir)
    i <- i + 1
  }
}

dir_sums <- list()

lists <- map_lgl(disk, is.list)
unused_folders <- as.list(names(disk)[lists])

repeat {
  if (length(unused_folders) == 0) break
  path <- unused_folders[[1]]
  lists <- map_lgl(disk[[path]], is.list)
  if (any(lists)) {
    new_lists <- names(lists)[lists]
    for (new_list in new_lists) {
      unused_folders <- c(list(c(path, new_list)), unused_folders)
    }
  } else {
    dir_sum <- sum(unlist(disk[[path]]))
    dir_sums[paste(path, collapse = "_")] <- dir_sum
    disk[[path]] <- dir_sum
    unused_folders[[1]] <- NULL
  }
}

dir_sums$total <- sum(unlist(disk))
dir_sums <- unlist(dir_sums)

dir_sums[dir_sums >= (30000000 - (70000000 - dir_sums["total"]))] |>
  sort() |>
  head(1)

# d7.2 = 12545514 


# Day 8 -------------------------------------------------------------------


# Functions from David Robinson
parse_txt <- function(s, ...) {
  readr::parse_guess(s, locale = readr::locale("en", grouping_mark = ""))
}

grid_tidy <- function(d, var, sep = "", parse = TRUE) {
  ret <- d %>%
    mutate(row = row_number()) %>%
    mutate(value = stringr::str_split({{ var }}, sep)) %>%
    select(-{{ var }}) %>%
    tidyr::unnest(value) %>%
    group_by(row) %>%
    mutate(col = row_number()) %>%
    ungroup()
  
  if (parse) {
    ret <- ret %>%
      mutate(value = parse_txt(value))
  }
  
  ret
}

d8 <- read_tsv(here("data", "aoc", "2022", "d8.txt"), col_names = FALSE)

d8 %>% 
  grid_tidy(X1, parse = TRUE)
  
