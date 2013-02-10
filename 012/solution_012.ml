exception Found of int


let triangles =
  let triangle = ref 0 in
  Stream.from (fun x -> triangle := !triangle + x; Some !triangle)


let factors x =
  let rec factors x = function
    | 0                   -> 0
    | i when x mod i == 0 -> factors x (i - 1) + 1
    | i                   -> factors x (i - 1)
  in
  factors x x


let project_euler_012 n =
  try
    Stream.iter
    (function x when factors x > n -> raise (Found x) | _ -> ())
    triangles

  with Found solution ->
    Printf.printf "%d\n%!" solution


let () = project_euler_012 500
