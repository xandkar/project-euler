let rec project_euler_001 n acc =
  match n with
      0 -> acc
    | n ->
      match (n mod 3 == 0) || (n mod 5 == 0) with
          true ->
            project_euler_001 (n - 1) (n + acc)
        | false ->
            project_euler_001 (n - 1) (acc)


let project_euler_001 n =
  let solution = project_euler_001 (n - 1) 0 in
    print_int solution;
    print_endline ""


let () = project_euler_001 1000
