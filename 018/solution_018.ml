open Printf

module Array  = ArrayLabels
module List   = ListLabels
module String = StringLabels

let read_data ic : int array array =
  let rec lines () =
    match input_line ic with
    | exception End_of_file -> []
    | line                  -> line :: (lines ())
  in
  Array.of_list (List.map (lines ()) ~f:(fun line ->
    Array.of_list
      (List.map (String.split_on_char ~sep:' ' line) ~f:int_of_string)
  ))

let solve_by_brute_force data =
  let r_last = (Array.length data) - 1 in
  let max = ref 0 in
  let rec walk (r, k) sum =
    let sum = sum + data.(r).(k) in
    if r = r_last then
      max := Stdlib.max !max sum
    else begin
      walk (r + 1, k + 0) sum;  (* left  *)
      walk (r + 1, k + 1) sum   (* right *)
    end
  in
  walk (0, 0) 0;
  !max

let () =
  let ic =
    let ic = ref stdin in
    Arg.parse [] (fun filename -> ic := open_in filename) "";
    !ic
  in
  let data = read_data ic in
  let t0 = Sys.time () in
  let solution_brute_force = solve_by_brute_force data in
  let t1 = Sys.time () in
  printf "brute force: %d in %f\n%!" solution_brute_force (t1 -. t0);
  close_in ic
