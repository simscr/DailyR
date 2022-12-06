
# Advent of Code 2022 -----------------------------------------------------

pacman::p_load(tidyverse, rio, here, janitor, ggpubr, rstatix)

conflicted::conflict_prefer("select", "dplyr")
conflicted::conflict_prefer("filter", "dplyr")
conflicted::conflict_prefer("clean_names", "janitor")

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

