let rec mults_of_3n5 = function
    | 0, mults -> mults
    | n, mults when (n mod 3 == 0) || (n mod 5 == 0) ->
      mults_of_3n5 (n - 1, n :: mults)
    | n, mults ->
      mults_of_3n5 (n - 1, mults)

let mults_of_3n5 n =
    let init_mults' = [] in
    mults_of_3n5 (n, init_mults')

let project_euler_001 ceiling =
    let n = ceiling - 1 in
    let solution = List.fold_left (+) 0 (mults_of_3n5 n) in
    print_newline (print_int solution)

let () = project_euler_001 1000
