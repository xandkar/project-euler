#! /usr/local/bin/gawk -f

BEGIN { sum  = 0 }

      { sum += $1 }

END   { solution = substr(sum, 0, 10)
        print solution
      }
