let is_pyth_3 (a, b, c) =
    ((a < b) && (b < c)) && ((a * a) + (b * b) = (c * c))


let find_pyth_3 target_sum_of_3 =
    let max = target_sum_of_3 in
    let trip = ref (0, 0, 0) in
    for a=1 to max do
      for b=(a+1) to max do
        for c=(b+1) to max do
          if ((a + b + c == target_sum_of_3) && is_pyth_3 (a, b, c)) then
            trip := (a, b, c)
        done;
      done;
    done;
    !trip


let project_euler_009 target_sum_of_3 =
    let a, b, c = find_pyth_3 target_sum_of_3 in
    let solution = a * b * c in
    print_newline (print_int solution)


let () = project_euler_009 1000
