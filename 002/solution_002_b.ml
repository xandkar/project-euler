let rec even_fibs max prev1 prev2 evens' =
  let current = prev1 + prev2 in
  match current >= max with
      true  -> evens'
    | false ->
          match current mod 2 == 0 with
              true  ->
                even_fibs max prev2 current (current::evens')
            | false ->
                even_fibs max prev2 current evens'


let project_euler_002 max =
  let even_fibs = even_fibs max 1 2 [2] in
  let solution = List.fold_left (+) 0 even_fibs in
  Printf.printf "%d\n" solution


let () = project_euler_002 4000000
