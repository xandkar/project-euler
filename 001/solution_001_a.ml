let rec sum_of_mults_of_3n5 = function
  | (0, sum) -> sum
  | (n, sum) ->
  match (n mod 3 == 0) || (n mod 5 == 0) with
    | true  -> sum_of_mults_of_3n5 ((n - 1), (n + sum))
    | false -> sum_of_mults_of_3n5 ((n - 1),      sum)


let project_euler_001 n =
  let solution = sum_of_mults_of_3n5 ((n - 1), 0) in
    print_newline (print_int solution)


let () = project_euler_001 1000
