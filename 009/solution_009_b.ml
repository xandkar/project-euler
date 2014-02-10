let is_pyth_3 (a, b, c) =
  ((a < b) && (b < c)) && ((a * a) + (b * b) = (c * c))


let find_pyth_3 target_sum_of_3 =
  let module Result = struct exception Found of (int * int * int) end in
  try
    let n = target_sum_of_3 in
    for a = 1 to n do
      for b = (a + 1) to n do
        for c = (b + 1) to n do
          if ((a + b + c == n) && is_pyth_3 (a, b, c))
          then raise (Result.Found (a, b, c))
        done
      done
    done;
    None
  with Result.Found triplets ->
    Some triplets


let project_euler_009 target_sum_of_3 =
  match find_pyth_3 target_sum_of_3 with
  | None ->
    assert false

  | Some (a, b, c) ->
    let solution = a * b * c in
    Printf.printf "%i\n" solution


let () = project_euler_009 1000
