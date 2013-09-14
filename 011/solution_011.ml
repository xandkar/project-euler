open Printf


let (|>) x f = f x
let (|-) f g x = g (f x)


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


module Matrix : sig
  type 'a t

  val of_file : string -> int t
  val moore_views : int -> 'a t -> ('a list list) t
  val map : ('a -> 'b) -> 'a t -> 'b t
  val max : int t -> int
end = struct
  module A = Array

  type 'a t = 'a array array
  type moore_direction = N | NE | E | SE | S | SW | W | NW

  let of_file filename =
    let ic = open_in filename in
    let rec read ls =
      try read (input_line ic :: ls) with End_of_file -> close_in ic; L.rev ls
    in
    let space = Str.regexp " +" in
    read []
    |> L.map (Str.split space |- L.map int_of_string |- A.of_list)
    |> A.of_list

  let vector_fwd  vd = L.seq 0   vd    1
  let vector_flat vd = L.rep 0   vd
  let vector_rev  vd = L.seq 0 (-vd) (-1)

  let offsets_N  vd = L.combine (vector_flat vd) (vector_rev  vd)
  let offsets_NE vd = L.combine (vector_fwd  vd) (vector_rev  vd)
  let offsets_E  vd = L.combine (vector_fwd  vd) (vector_flat vd)
  let offsets_SE vd = L.combine (vector_fwd  vd) (vector_fwd  vd)
  let offsets_S  vd = L.combine (vector_flat vd) (vector_fwd  vd)
  let offsets_SW vd = L.combine (vector_rev  vd) (vector_fwd  vd)
  let offsets_W  vd = L.combine (vector_rev  vd) (vector_flat vd)
  let offsets_NW vd = L.combine (vector_rev  vd) (vector_rev  vd)

  let offsets_of_dir vd = function
    | N  -> offsets_N  vd
    | NE -> offsets_NE vd
    | E  -> offsets_E  vd
    | SE -> offsets_SE vd
    | S  -> offsets_S  vd
    | SW -> offsets_SW vd
    | W  -> offsets_W  vd
    | NW -> offsets_NW vd

  let offsets vd =
    L.map (offsets_of_dir vd) [N; NE; E; SE; S; SW; W; NW]

  let is_onside t (r, k) =
    r >= 0 && r < A.length t &&
    k >= 0 && k < A.length t.(0)

  let moore_view t vd r k =
    let coordinates =
      L.map (L.map (fun (ro, ko) -> r + ro, k + ko)) (offsets vd)
    in
    let look (rv, kv) = t.(rv).(kv) in
    L.map (L.filter (is_onside t) |- L.map look) coordinates

  let moore_views vd t =
    A.mapi (fun r row -> A.mapi (fun k _ -> moore_view t vd r k) row) t

  let map f t =
    A.map (A.map f) t

  let max t =
    let max = ref 0 in
    A.iter (A.iter (fun element -> if element > !max then max := element)) t;
    !max
end


let project_euler_011  ~data_file:filename  ~view_depth:vd =
  let solution =
       Matrix.of_file filename
    |> Matrix.moore_views vd
    |> Matrix.map (L.map L.product |- L.max)
    |> Matrix.max
  in

  print_int solution;
  print_newline ()


let () = project_euler_011 ~data_file:"problem_011.dat" ~view_depth:4
