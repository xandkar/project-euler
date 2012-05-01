let is_pyth_3 (a, b, c) =
    ((a < b) && (b < c)) && ((a * a) + (b * b) = (c * c))


let find_pyth_3 target_sum_of_3 =
    let rec find_c = function
      | _, _, c, max, state when c > max -> state
      | a, b, c, _, _ when (a+b+c==target_sum_of_3) && is_pyth_3 (a, b, c) ->
        (true, (a, b, c))
      | a, b, c, max, state -> find_c (a, b, c+1, max, state)
    in
    let rec find_b = function
      | _, b, max, ((is_found, _) as state) when is_found || (b > max) -> state
      | a, b, max, state -> find_b (a, b+1, max, find_c (a, b, b+1, max, state))
    in
    let rec find_a = function
      | a, max, (is_found, trips) when is_found || (a > max) -> trips
      | a, max, state -> find_a (a+1, max, find_b (a, a+1, max, state))
    in
    let max = target_sum_of_3 in
    find_a (0, max, (false, (0, 0, 0)))


let project_euler_009 target_sum_of_3 =
    let a, b, c = find_pyth_3 target_sum_of_3 in
    let solution = a * b * c in
    print_newline (print_int solution)


let () = project_euler_009 1000
