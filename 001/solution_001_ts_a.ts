interface Array<T> {
    from(arrayLike: any, mapFn?, thisArg?): Array<T>;
}

interface ArrayConstructor {
    from(arrayLike: any, mapFn?, thisArg?): Array<any>;
}

var project_euler_001 = function() {
    let n = 1000;
    let numbers = Array.from({length: n - 1}, (_v, i) => i + 1);
    let multiples = numbers.filter((x, _i, _a) => x % 3 === 0 || x % 5 === 0);
    let solution = multiples.reduce((acc, x, _i, _a) => x + acc, 0);
    console.log("%d", solution)
}

project_euler_001()
