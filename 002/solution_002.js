#! /usr/bin/env node

var project_euler_002 = function() {
    var fibs = [1, 2];
    var fib_last = fibs[fibs.length - 1]
    var i = 1;
    while (true) {
        curr = fibs[i - 1] + fibs[i];
        if (curr >= 4000000) break;
        fib_last = curr;
        fibs.push(fib_last)
        i++
    };
    var fibs_even = fibs.filter((x) => x % 2 == 0);
    var solution = fibs_even.reduce((acc, x, _i, _a) => acc + x, 0);
    console.log("%d", solution);
}

project_euler_002()
