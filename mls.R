#MLS

library(httr)
library(XML)


url <- "https://en.wikipedia.org/wiki/List_of_Major_League_Soccer_stadiums"

r <- GET(url)

doc <- readHTMLTable(
  doc=content(r, "text"))

test <- doc[[2]]
