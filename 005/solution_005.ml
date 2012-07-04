let rec is_divisible = function
  | n, (bottom, top) when bottom > top -> true
  | n, (bottom, top) when n mod bottom != 0 -> false
  | n, (bottom, top) -> is_divisible (n, (bottom + 1, top))


let smallest_divisible (_bottom, top as by_range) =
  let rec smallest_divisible = function
    | n, step, by_range when is_divisible (n, by_range) -> n
    | n, step, by_range -> smallest_divisible (n + step, step, by_range)
  in
  let init = top
  and step = top in
  smallest_divisible (init, step, by_range)


let project_euler_005 by_range =
  let solution = smallest_divisible by_range in
  Printf.printf "%d\n" solution


let () = project_euler_005 (1, 20)
