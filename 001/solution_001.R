#! /usr/bin/env Rscript


ProjectEuler001 <- function(n) {
  numbers   <- 1:(n-1)
  multiples <- numbers[numbers %% 3 == 0 | numbers %% 5 == 0]
  solution  <- sum(multiples)

  cat(solution, "\n")
}


ProjectEuler001(1000)
