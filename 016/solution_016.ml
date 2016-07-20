let int_of_char c =
  int_of_string (String.make 1 c)

let sum_of_digits_in_string digits =
  let sum = ref 0 in
  String.iter (fun d -> sum := !sum + (int_of_char d)) digits;
  !sum

let project_euler_016 x y =
  let power = Num.(string_of_num (power_num (Int x) (Int y))) in
  let solution = sum_of_digits_in_string power in
  Printf.printf "%d\n" solution

let () = project_euler_016 2 1000
