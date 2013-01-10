project_euler_001 :: Int -> IO ()
project_euler_001 n =
    let candidates = [1 .. n - 1] in
    let condition x = mod x 3 == 0 || mod x 5 == 0 in
    let solution = sum $ filter condition candidates in
    print solution

main :: IO ()
main = project_euler_001 1000
