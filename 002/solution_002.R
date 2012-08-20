#! /usr/bin/env Rscript


FibsUpTo <- function(fib.max) {
  fib.seq <- c(1, 2)
  i <- 2

  while (fib.seq[i] < fib.max) {
    i <- i + 1
    fib.seq[i] <- fib.seq[i-1] + fib.seq[i-2]
  }

  return (fib.seq[-i])
}


ProjectEuler002 <- function(n) {
  fibs      <- FibsUpTo(n)
  fibs.even <- fibs[fibs %% 2 == 0]
  solution  <- sum(fibs.even)

  cat(solution, "\n")
}


ProjectEuler002(4000000)
