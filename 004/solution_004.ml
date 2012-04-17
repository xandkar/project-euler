let rec is_palindrome s =
    let len = String.length s in
    match s, len with
    | _, len when len <= 1 -> true
    | s, len when s.[0] = s.[len-1] -> is_palindrome (String.sub s 1 (len-2))
    | _, _ -> false

let rec seq = function
    | _, _, [] -> []
    | max, step, (last::_ as seq') when last >= max -> List.rev seq'
    | max, step, (last::_ as seq') -> seq (max, step, last+step::seq')

let seq first last =
    let step = 1 in
    let seq' = [first] in
    seq (last, step, seq')

let rec pal_products2 = function
    | _, [], products' -> products'
    | n1, n2::nums2, products' ->
      let product = n1 * n2 in
      if is_palindrome (string_of_int product) then
        pal_products2 (n1, nums2, product::products')
      else
        pal_products2 (n1, nums2, products')

let rec pal_products1 = function
    | [], _, products' -> products'
    | n1::nums1, nums2, products' ->
      pal_products1 (nums1, nums2, pal_products2 (n1, nums2, products'))

let project_euler_004 first last =
    let numbers = seq first last in
    let pal_products = pal_products1 (numbers, numbers, []) in
    let solution = List.hd (Sort.list (>) pal_products) in
    print_newline (print_int solution)

let () = project_euler_004 100 999
