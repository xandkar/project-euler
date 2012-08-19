#! /usr/bin/env Rscript

project.euler.001 <- function(n) {
  nums <- 1:(n-1)
  mults <- nums[nums %% 3 == 0 | nums %% 5 == 0]
  solution <- sum(mults)

  cat(solution, "\n")
}


project.euler.001(1000)
