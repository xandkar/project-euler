condition :: Int -> Bool
condition x = mod x 3 == 0 || mod x 5 == 0

solution :: Int -> Int
solution n =
    sum $ [x | x <- [1 .. n - 1], condition x]

project_euler_001 :: Int -> IO ()
project_euler_001 n =
    print $ solution n

main :: IO ()
main = project_euler_001 1000
