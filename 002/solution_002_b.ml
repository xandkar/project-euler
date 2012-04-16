let rec even_fibs = function
    | max, prev, curr, evens' when curr >= max -> evens'
    | max, prev, curr, evens' when curr mod 2 == 0 ->
      even_fibs (max, curr, curr + prev, curr :: evens')
    | max, prev, curr, evens' ->
      even_fibs (max, curr, curr + prev, evens')

let even_fibs max =
    let prev = 2 in
    let curr = 3 in
    let init_evens' = [2] in
      even_fibs (max, prev, curr, init_evens')

let project_euler_002 max =
    let solution = List.fold_left (+) 0 (even_fibs max) in
    print_newline (print_int solution)

let () = project_euler_002 4000000
