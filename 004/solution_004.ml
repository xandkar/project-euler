let rec is_palindrome s =
    let len = String.length s in
    match s, len with
    | _, len when len <= 1 -> true
    | s, len when s.[0] = s.[len-1] -> is_palindrome (String.sub s 1 (len-2))
    | _, _ -> false

let rec seq = function
    | current, max, step, seq' when current >= max -> List.rev seq'
    | current, max, step, seq' ->
      let new_current = current + step in
      seq (new_current, max, step, new_current::seq')

let seq first last =
    let step = 1 in
    let seq' = [first] in
    seq (first, last, step, seq')

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

let pal_products nums1 nums2 =
    pal_products1 (nums1, nums2, [])

let () =
    let numbers = seq 100 999 in
    let pal_products = pal_products numbers numbers in
    let solution = List.hd (Sort.list (>) pal_products) in
    print_newline (print_int solution)
