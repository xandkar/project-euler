#! /usr/bin/env awk -f


function sum_of_mults_of_3and5(n) {
    sum = 0;

    for (i=1; i < n; i++) {
        if (i % 3 == 0 || i % 5 == 0) {
            sum += i
        }
    };

    return sum
}


function project_euler_001(n) {
    solution = sum_of_mults_of_3and5(n);
    print solution
}


BEGIN {project_euler_001(1000)}
