let rec sum_even_fibs = function
    | max, prev, curr, sum_even when curr >= max -> sum_even
    | max, prev, curr, sum_even when curr mod 2 == 0 ->
      sum_even_fibs (max, curr, curr + prev, sum_even + curr)
    | max, prev, curr, sum_even ->
      sum_even_fibs (max, curr, curr + prev, sum_even)

let sum_even_fibs max =
    let prev = 2 in
    let curr = 3 in
    let init_sum_even = 2 in
    sum_even_fibs (max, prev, curr, init_sum_even)

let project_euler_002 max =
    let solution = sum_even_fibs max in
    print_newline (print_int solution)

let () = project_euler_002 4000000
