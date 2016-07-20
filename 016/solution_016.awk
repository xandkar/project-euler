#! /usr/bin/env gawk -f
# Only works with GNU Awk.

function sum_of_digits(n,        i, sum) {
    sum = 0;
    for (i = 1; i <= length(n); i++) {
        sum += substr(n, i, 1)
    };
    return sum
}


function project_euler_016(n) {
    solution = sum_of_digits(n);
    print solution
}


BEGIN { n = 2 ** 1000
      ; printf "%d\n", n
      ; project_euler_016(n)
      }
