exception Found of int

let triangles =
  let triangle = ref 0 in
  Stream.from (fun x -> triangle := !triangle + x; Some !triangle)

let factors x =
  let count = ref 1 in  (* 1 for x itself *)
  let sqrt = int_of_float (sqrt (float_of_int x)) in
  for candidate = sqrt downto 1 do
    if (x mod candidate == 0) then begin
      incr count;
      incr count
    end
  done;
  if sqrt = x then
    !count - 1
  else
    !count

let project_euler_012 n =
  match
    Stream.iter
    (function x when factors x > n -> raise (Found x) | _ -> ())
    triangles
  with
  | exception (Found solution) ->
      Printf.printf "%d\n%!" solution
  | () ->
      assert false

let () = project_euler_012 500
