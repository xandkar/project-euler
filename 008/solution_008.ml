let read_data filename =
    let channel_in = open_in filename in
    (* Cut length to omit trailing newline character *)
    let length = (in_channel_length channel_in) - 1 in
    let buffer = String.create length in
    really_input channel_in buffer 0 length;
    close_in channel_in;
    buffer

let get_conseqs str len =
    let rec conseqs = function
      | _, i, len, acc' when i < 0 -> acc'
      | s, i, len, acc' -> conseqs (s, i-1, len, (String.sub s i len)::acc')
    in
    conseqs (str, (String.length str)-len, len, [])

let product str =
    let rec product = function
      | s, i, prod when i < 0 -> prod
      | s, i, prod ->
        product (s, i-1, prod * (int_of_string (Char.escaped s.[i])))
    in
    let index = (String.length str)-1 in
    product (str, index-1, int_of_string (Char.escaped str.[index]))

let project_euler_008 datafilename conseq_len =
    let data = read_data datafilename in
    let conseqs = get_conseqs data conseq_len in
    let products = List.map (product) conseqs in
    let solution = List.hd (Sort.list (>) products) in
    print_newline (print_int solution)

let () = project_euler_008 "problem_008.dat" 5
