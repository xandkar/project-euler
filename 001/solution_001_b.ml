module Stream = struct include Stream
  let upto n = from (fun i -> if i < n then Some i else None)

  let rec fold f acc stream = match peek stream with
    | Some value -> fold f (junk stream; f acc value) stream
    | None -> acc
end


let project_euler_001 n =
  let summer sum i = if i mod 3 == 0 || i mod 5 == 0 then sum + i else sum in
  let solution = Stream.fold summer 0 (Stream.upto n) in

  print_int solution;
  print_newline ()


let () = project_euler_001 1000
