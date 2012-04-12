let rec mults_of_3n5 = function
  | (0, mults) -> mults
  | (n, mults) ->
  match (n mod 3 == 0) || (n mod 5 == 0) with
    | true  -> mults_of_3n5 ((n - 1), (n::mults))
    | false -> mults_of_3n5 ((n - 1),     mults)


let project_euler_001 n =
  let mults_of_3n5 = mults_of_3n5 ((n - 1), []) in
  let solution = List.fold_left (+) 0 mults_of_3n5 in
    print_newline (print_int solution)


let () = project_euler_001 1000
