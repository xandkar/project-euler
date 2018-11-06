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

let solve_by_dyn_prog data =
  (* Imagine a bunch of nested, 3-node subtrees embedded in the given tree.
   *
   * Processing from last parents (2nd-to-last row) to the 1st parent (root, in
   * 1st row), each parent picks the largest of its children and records their
   * sum (parent + (max child1 child2)), which is the largest sum for this
   * subtree, so that its own parent can in turn do the same with it,
   * culminating in root selecting which of the children gives the largest sum.
   * The resulting value in root's location is the largest sum for the given
   * tree.
   * *)
  let r_bottom       = (Array.length data) - 1 in
  let r_last_parents = r_bottom - 1 in
  let r_first_parent = 0 in
  let sums = Array.copy data.(r_bottom) in
  for r = r_last_parents downto r_first_parent do
    for k = 0 to r do
      let parent      = data.(r).(k) in
      let child_left  = sums.(k) in
      let child_right = sums.(k + 1) in
      sums.(k) <- parent + (max child_left child_right);
    done
  done;
  sums.(0)

let () =
  let ic, bf =
    let ic = ref stdin in
    let bf = ref false in
    Arg.parse ["-bf", Arg.Set bf, ""] (fun filename -> ic := open_in filename) "";
    !ic, !bf
  in
  let data = read_data ic in
  close_in ic;
  let solutions =
    (* Since we do not actually need the path itself, we can just accumulate
     * the largest sum - each of the solutions does just that.
     * *)
    ("DP", solve_by_dyn_prog) :: if bf then ["BF", solve_by_brute_force] else []
  in
  List.iter solutions ~f:(fun (label, f) ->
    let t0 = Sys.time () in
    let result = f data in
    let t1 = Sys.time () in
    printf "%s: %d in %f seconds\n%!" label result (t1 -. t0)
  )
