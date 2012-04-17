let rec is_divisible = function
    | n, cur, max when cur > max -> true
    | n, cur, max when not (n mod cur == 0) -> false
    | n, cur, max -> is_divisible (n, cur+1, max)

let rec smallest_divisible = function
    | n, first, last when is_divisible(n, first, last) -> n
    | n, first, last -> smallest_divisible (n+1, first, last)

let project_euler_005 first last =
    let solution = smallest_divisible (1, first, last) in
    print_newline (print_int solution)

let () = project_euler_005 1 20
