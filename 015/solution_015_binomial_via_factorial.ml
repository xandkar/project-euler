module N = Num

let ( + ) = N.( +/ )
let ( * ) = N.( */ )
let ( / ) = N.( // )
let pred = N.pred_num

let rec factorial_upto = function
  | N.Int 0 , _       -> N.Int 1
  | _       , N.Int 0 -> N.Int 1
  | n       , k       -> n * factorial_upto (pred n, pred k)

let factorial n =
  factorial_upto (n, n)

let binomial n k =
  (factorial_upto (n, k)) / (factorial k)

let () =
  let m = N.Int 20 in
  let n = N.Int 20 in
  print_endline (N.string_of_num (binomial (m + n) n))
