#! /usr/bin/env node

var project_euler_001 = function() {
    n = 1000
    numbers = Array.from({length: n - 1}, (_v, i) => i + 1)
    multiples = numbers.filter((x, _i, _a) => x % 3 == 0 || x % 5 == 0)
    solution = multiples.reduce((acc, x, _i, _a) => x + acc, 0)
    console.log("%d", solution)
}

project_euler_001()
