let rec is_divisible = function
    | n, d when d >= n -> false
    | n, d when (n mod d == 0) -> true
    | n, d -> is_divisible (n, d+2)

let is_prime = function
    | 0 -> false
    | 1 -> false
    | 2 -> true
    | n when (n mod 2 == 0) -> false
    | n when is_divisible (n, 3) -> false
    | _ -> true

let nth_prime n =
    let rec nth_prime = function
    | 0, p, c -> p
    | n, p, c when is_prime (c) -> nth_prime (n-1, c, c+2)
    | n, p, c -> nth_prime (n, p, c+2)
    in
    nth_prime (n-2, 3, 5)

let project_euler_007 n =
    let solution = nth_prime n in
    print_newline (print_int solution)

let () = project_euler_007 10_001
