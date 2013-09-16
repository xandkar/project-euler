let (|>) x f = f x
let (|-) f g x = g (f x)


module L = List

module ListExtra : sig
  type 'a t = 'a list

  val max : 'a t -> 'a
  val product : int list -> int
  val seq : start:int -> goal:int -> step:int -> int t
  val rep : 'a -> times:int -> 'a t
end = struct
  type 'a t = 'a list

  let max = function
    | x::xs -> L.fold_left max x xs
    | [] -> assert false

  let product = function
    | x::xs -> L.fold_left ( * ) x xs
    | [] -> assert false

  let rec seq ~start ~goal ~step =
    if start = goal then [] else start :: seq ~start:(start + step) ~goal ~step

  let rec rep x ~times =
    if times = 0 then [] else x :: rep x ~times:(times - 1)
end

module LE = ListExtra

module Matrix : sig
  type 'a t

  val of_file : string -> string t
  val moore_views : 'a t -> view_depth:int -> ('a list list) t
  val map : 'a t -> f:('a -> 'b) -> 'b t
  val max : 'a t -> 'a
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
    |> L.map (Str.split space |- A.of_list)
    |> A.of_list

  let vector_fwd  vd = LE.seq ~start:0 ~goal:vd    ~step:1
  let vector_rev  vd = LE.seq ~start:0 ~goal:(-vd) ~step:(-1)
  let vector_flat vd = LE.rep 0 ~times:vd

  let offsets_of_dir vd = function
    | N  -> L.combine (vector_flat vd) (vector_rev  vd)
    | NE -> L.combine (vector_fwd  vd) (vector_rev  vd)
    | E  -> L.combine (vector_fwd  vd) (vector_flat vd)
    | SE -> L.combine (vector_fwd  vd) (vector_fwd  vd)
    | S  -> L.combine (vector_flat vd) (vector_fwd  vd)
    | SW -> L.combine (vector_rev  vd) (vector_fwd  vd)
    | W  -> L.combine (vector_rev  vd) (vector_flat vd)
    | NW -> L.combine (vector_rev  vd) (vector_rev  vd)

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

  let moore_views t ~view_depth =
    A.mapi (fun r row -> A.mapi (fun k _ -> moore_view t view_depth r k) row) t

  let map t ~f =
    A.map (A.map f) t

  let max t =
    let max = ref t.(0).(0) in
    A.iter (A.iter (fun element -> if element > !max then max := element)) t;
    !max
end


let project_euler_011  ~data_file:filename  ~view_depth =
  let solution =
    let m = Matrix.of_file filename in
    m |> Matrix.map ~f:(int_of_string)
      |> Matrix.moore_views ~view_depth
      |> Matrix.map ~f:(L.map LE.product |- LE.max)
      |> Matrix.max
  in
  print_int solution;
  print_newline ()


let () = project_euler_011 ~data_file:"problem_011.dat" ~view_depth:4
