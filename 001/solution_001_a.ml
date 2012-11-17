let sum_of_mults3n5 n =
  let rec sum_of_mults3n5 sum = function
    | i when i == n -> sum
    | i -> let sum = if i mod 3 == 0 || i mod 5 == 0 then sum + i else sum in
      sum_of_mults3n5 sum (i + 1)
  in
  sum_of_mults3n5 0 1


let project_euler_001 n =
  let solution = sum_of_mults3n5 n in

  print_int solution;
  print_newline ()


let () = project_euler_001 1000
