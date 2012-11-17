let even_fibs max =
  let rec even_fibs fibs' a b = if b >= max then fibs' else
    let fibs' = if b mod 2 == 0 then b::fibs' else fibs' in
    even_fibs fibs' b (b + a)
  in
  even_fibs [2] 2 3


let project_euler_002 max =
  let solution = List.fold_left (+) 0 (even_fibs max) in

  print_int solution;
  print_newline ()


let () = project_euler_002 4_000_000
