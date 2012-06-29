mults_of_3n5 n =
    [i | i <- [1..n], ((i `mod` 5 == 0) || (i `mod` 3 == 0))]


project_euler_001 n =
    let solution = sum $ mults_of_3n5 n in
    print solution


main = project_euler_001 1000
