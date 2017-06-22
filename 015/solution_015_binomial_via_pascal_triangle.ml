module Array = ArrayLabels

let make_pascal_triangle ~n =
  let dimx = n + 1 in
  let dimy = dimx in
  let t =
    Array.mapi (Array.make_matrix ~dimx ~dimy ()) ~f:(fun i columns ->
        Array.mapi columns ~f:(fun j () ->
          match i, j with
          | _, 0            -> 1
          | i, j when i = j -> 1
          | _, _            -> 0
        )
    )
  in
  for i = 1 to (dimx - 1) do
    for j = 1 to i do
      let upper_left  = t.(i - 1).(j - 1) in
      let upper_right = t.(i - 1).(j) in
      t.(i).(j) <- upper_left + upper_right
    done;
  done;
  t

let binomial ~pascal_triangle ~n ~k =
  pascal_triangle.(n).(k)

let () =
  let rows = 20 in
  let cols = 20 in
  let n = rows + cols in
  let k = rows in
  let pascal_triangle = make_pascal_triangle ~n in
  Printf.printf "%i\n" (binomial ~pascal_triangle ~n ~k)
