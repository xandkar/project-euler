let rec sum_even_fibs max prev1 prev2 sum_even =
  let current = prev1 + prev2 in
  match current >= max with
      true  -> sum_even
    | false ->
          match current mod 2 == 0 with
              true  ->
                sum_even_fibs max prev2 current sum_even + current
            | false ->
                sum_even_fibs max prev2 current sum_even


let project_euler_002 max =
  let solution = sum_even_fibs max 1 2 2 in
  Printf.printf "%d\n" solution


let () = project_euler_002 4000000
