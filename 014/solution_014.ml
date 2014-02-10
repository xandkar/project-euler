let collatz_seq from_n =
  let next n =
    match n mod 2 with
    | 0 -> n / 2
    | _ -> n * 3 + 1
  in
  let seq =
    let next_elt = ref (Some from_n) in
    fun _ ->
      match !next_elt with
      | None -> None
      | Some n ->
        next_elt := (match n with 1 -> None | n -> Some (next n));
        Some n
  in
  Stream.from seq

let stream_length stream =
  let count = ref 0 in
  Stream.iter (fun _ -> incr count) stream;
  !count

let nats_upto max =
  let stream = Stream.from (function n when n > max -> None | n -> Some n) in
  begin match Stream.peek stream with
  | Some 0 -> Stream.junk stream
  | Some _ | None -> ()
  end;
  stream

let project_euler_014 max =
  let solution =
    let longest_starting = ref 0 in
    let longest_length = ref 0 in
    let test_for_longest_collatz_seq n =
      let length = stream_length (collatz_seq n) in
      if length > !longest_length
      then ( longest_length := length
           ; longest_starting := n
           )
    in
    Stream.iter test_for_longest_collatz_seq (nats_upto max);
    !longest_starting
  in
  Printf.printf "%d\n%!" solution

let () = project_euler_014 1_000_000
