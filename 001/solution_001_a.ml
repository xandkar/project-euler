let rec sum_of_mults_of_3n5 = function
    | 0, sum -> sum
    | n, sum when (n mod 3 == 0) || (n mod 5 == 0) ->
      sum_of_mults_of_3n5 (n - 1, sum + n)
    | n, sum ->
      sum_of_mults_of_3n5 (n - 1, sum)

let sum_of_mults_of_3n5 n =
    let init_sum = 0 in
    sum_of_mults_of_3n5 (n, init_sum)

let project_euler_001 ceiling =
    let n = ceiling - 1 in
    let solution = sum_of_mults_of_3n5 n in
    print_newline (print_int solution)

let () = project_euler_001 1000
