open Printf


let (|>) x f = f x
let (|-) f g x = g (f x)


module A = Array


module L = struct include List
  let max = function
    | x::xs -> fold_left max x xs
    | [] -> assert false

  let product = function
    | x::xs -> fold_left ( * ) x xs
    | [] -> assert false

  let rec seq a b step =
    if a = b then [] else a :: seq (a + step) b step

  let rec rep x times =
    if times = 0 then [] else x :: rep x (times - 1)
end


module Matrix = struct
  type moore_direction = N | NE | E | SE | S | SW | W | NW

  let from_file filename =
    let ic = open_in filename in
    let rec read ls =
      try read (input_line ic :: ls) with End_of_file -> close_in ic; L.rev ls
    in
    let space = Str.regexp " +" in
    read []
    |> L.map (Str.split space |- (L.map int_of_string) |- A.of_list)
    |> A.of_list

  let directions = [N; NE; E; SE; S; SW; W; NW]

  let vector_fwd  d = L.seq 0   d    1
  let vector_flat d = L.rep 0   d
  let vector_rev  d = L.seq 0 (-d) (-1)

  let offsets_N  d = L.combine (vector_flat d) (vector_rev  d)
  let offsets_NE d = L.combine (vector_fwd  d) (vector_rev  d)
  let offsets_E  d = L.combine (vector_fwd  d) (vector_flat d)
  let offsets_SE d = L.combine (vector_fwd  d) (vector_fwd  d)
  let offsets_S  d = L.combine (vector_flat d) (vector_fwd  d)
  let offsets_SW d = L.combine (vector_rev  d) (vector_fwd  d)
  let offsets_W  d = L.combine (vector_rev  d) (vector_flat d)
  let offsets_NW d = L.combine (vector_rev  d) (vector_rev  d)

  let offsets_of_dir d = function
    | N  -> offsets_N  d
    | NE -> offsets_NE d
    | E  -> offsets_E  d
    | SE -> offsets_SE d
    | S  -> offsets_S  d
    | SW -> offsets_SW d
    | W  -> offsets_W  d
    | NW -> offsets_NW d

  let offsets d =
    L.map (offsets_of_dir d) directions

  let is_onside m (r, k) =
    r >= 0 && r < A.length m &&
    k >= 0 && k < A.length m.(0)

  let moore_view m d r k =
    let coordinates =
      L.map (L.map (fun (ro, ko) -> r + ro, k + ko)) (offsets d)
    in
    let look (rv, kv) = m.(rv).(kv) in
    L.map ((L.filter (is_onside m)) |- (L.map look)) coordinates

  let moore_views d m =
    A.mapi (fun r row -> A.mapi (fun k _ -> moore_view m d r k) row) m

  let map f m =
    A.map (A.map f) m

  let max m =
    let max = ref 0 in
    A.iter (A.iter (fun element -> if element > !max then max := element)) m;
    !max
end


let project_euler_011  problem_data_file  view_depth =
  let solution =
       Matrix.from_file problem_data_file
    |> Matrix.moore_views view_depth
    |> Matrix.map (fun views -> L.max (L.map (L.product) views))
    |> Matrix.max
  in

  print_int solution;
  print_newline ()


let () = project_euler_011 "problem_011.dat" 4
