let project_euler_001 = function (n) {
    let sum_of_multiples_of_3_or_5 = 0;
    for (let i = 1; i < n; i++) {
        if (i % 3 === 0 || i % 5 === 0) {
            sum_of_multiples_of_3_or_5 += i
        }
    };
    console.log("%d", sum_of_multiples_of_3_or_5)
}

project_euler_001(1000)
