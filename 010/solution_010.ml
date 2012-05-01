let round n =
    int_of_float (floor (n +. 0.5))


let is_prime n =
    let max_div = round (sqrt (float_of_int n)) in
    let rec is_divisible = function
      | n, div when div > max_div -> false
      | n, div when (n mod div == 0) -> true
      | n, div -> is_divisible (n, div+2)
    in
    match n with
    | 0 -> false
    | 1 -> false
    | 2 -> true
    | n when (n mod 2 == 0) -> false
    | n when is_divisible (n, 3) -> false
    | _ -> true


let primes_upto n =
    let rec primes_upto = function
      | max, candidate, primes' when candidate >= max -> primes'
      | max, candidate, primes' when is_prime candidate ->
        primes_upto (max, candidate + 2, candidate::primes')
      | max, candidate, primes' -> primes_upto (max, candidate + 2, primes')
    in
    primes_upto (n, 3, [2])


let project_euler_010 n =
    let solution = List.fold_left (+) 0 (primes_upto n) in
    print_newline (print_int solution)


let () = project_euler_010 2_000_000
