#! /usr/bin/env awk -f


function fill_fibs_upto(n, fibs,  i) {
  fibs[1] = 1;
  fibs[2] = 2;

  i = 2;
  while (fibs[i] < n) {
    i++;
    fibs[i] = fibs[i - 1] + fibs[i - 2];
  }
}


function fill_even_fibs(fibs, even_fibs,  i, j) {
  j = 1;
  for (i=1; i <= length(fibs); i++) {
    if (fibs[i] % 2 == 0) {
      even_fibs[j] = fibs[i];
      j++;
    }
  }
}


function sum_of(array,  sum, i) {
  sum = 0;

  for (i=1; i <= length(array); i++) {
    sum += array[i]
  };

  return sum;
}


function project_euler_002(n) {
  fill_fibs_upto(n, fibs);
  fill_even_fibs(fibs, even_fibs);
  solution = sum_of(even_fibs);

  print solution;
}


BEGIN {project_euler_002(4000000)}
