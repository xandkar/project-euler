let is_pyth_3 (a, b, c) =
    ((a < b) && (b < c)) && ((a * a) + (b * b) = (c * c))


let find_pyth_3 target_sum_of_3 =
    let max = target_sum_of_3 in
    let trip = ref None in
    begin try
    for a=1 to max do
      for b=(a+1) to max do
        for c=(b+1) to max do
          if ((a + b + c == target_sum_of_3) && is_pyth_3 (a, b, c)) then
            ( trip := Some (a, b, c)
            ; raise Exit
            )
        done;
      done;
    done;
    with Exit -> () end;
    !trip


let project_euler_009 target_sum_of_3 =
  match find_pyth_3 target_sum_of_3 with
  | None ->
    assert false

  | Some (a, b, c) ->
    let solution = a * b * c in
    Printf.printf "%i\n" solution


let () = project_euler_009 1000
