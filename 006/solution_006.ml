let square_of_int i =
    int_of_float ((float_of_int i) ** 2.)

let rec seq = function
    | _, [] -> []
    | max, (last::_ as seq') when last >= max -> seq'
    | max, (last::_ as seq') -> seq (max, last+1::seq')

let project_euler_006 max =
    let nums = seq (max, [1]) in
    let sum_of_squares = List.fold_left (+) 0 (List.map (square_of_int) nums) in
    let square_of_sum_of_nums = square_of_int (List.fold_left (+) 0 nums) in
    let solution = square_of_sum_of_nums - sum_of_squares in
    print_newline (print_int solution)

let () = project_euler_006 100
