open Printf

module Array  = ArrayLabels
module List   = ListLabels
module String = StringLabels

let read_data ic : int array array =
  let rev_lines =
    let rec read lines =
      match input_line ic with
      | exception End_of_file ->
          lines
      | line ->
          read (line :: lines)
    in
    read []
  in
  let rows =
    let rows, _, _ =
      List.fold_left rev_lines ~init:([], 0, 0) ~f:(fun (rows, off, max) line ->
        let xs =
          line |> String.split_on_char ~sep:' '
        in
        let max =
          (match off with
          | 0 -> 2 * (List.length xs) - 1
          | _ -> max
          )
        in
        let row = Array.make max "  " in
        List.iteri xs ~f:(fun i x -> row.((2 * i) + off) <- x);
        (row :: rows, succ off, max)
      )
    in
    rows
  in
  let data = Array.of_list rows in
  Array.iteri data ~f:(fun r row ->
    if r = 0 then begin
      let n = Array.length row in
      eprintf "n: %d\n" n;
      Array.iteri row ~f:(fun k _ ->
        if k = 0 then begin
          eprintf "    |"
        end;
        eprintf "%3d |" k
      );
      prerr_newline ();
      prerr_endline (String.make ((n + 1) * 5) '-')
    end;
    Array.iteri row ~f:(fun k x ->
      if k = 0 then begin
        eprintf "%3d |" r
      end;
      eprintf "%3s |" x;
    );
    prerr_newline ()
  );
  Array.map data ~f:(Array.map ~f:(function "  " -> 0 | s -> int_of_string s))

let solve_by_brute_force data =
  let r_last = (Array.length data) - 1 in
  let r_init = 0 in
  let k_init = (Array.length data.(0)) / 2 in
  let max = ref 0 in
  let rec walk (r, k) sum =
    let sum = sum + data.(r).(k) in
    if r = r_last then
      max := Stdlib.max !max sum
    else begin
      walk (succ r, succ k) sum;
      walk (succ r, pred k) sum
    end
  in
  walk (r_init, k_init) 0;
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
