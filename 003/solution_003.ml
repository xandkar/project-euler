let init_divisor = 3

let rec is_divisible = function
    | n, divisor when n <= divisor -> false
    | n, divisor when (n mod divisor == 0) -> true
    | n, divisor -> is_divisible (n, (divisor + 2))

let is_prime = function
    | 0 -> false
    | 1 -> false
    | 2 -> true
    | n when (n mod 2 == 0) -> false
    | n when is_divisible (n, init_divisor) -> false
    | _ -> true

let rec largest_prime_factor = function
    | _, candidate when candidate <= 0 -> (false, 0)
    | n, candidate when (n mod candidate == 0) && (is_prime candidate) ->
      (true, candidate)
    | n, candidate -> largest_prime_factor (n, (candidate - 2))

let round n =
    int_of_float (floor (n +. 0.5))

let ensure_odd = function
    | n when n mod 2 == 0 -> (n + 1)
    | n -> n

let project_euler_003 n =
    let init_candidate = ensure_odd (round (sqrt (float_of_int n))) in
    match largest_prime_factor (n, init_candidate) with
    | true, solution -> print_newline (print_int solution)
    | false, _       -> print_newline (print_string "NO SOLUTION")

let () = project_euler_003 600851475143
