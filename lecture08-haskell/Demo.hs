module Main (main) where

import Examples

main :: IO ()
main = do
  putStrLn "Haskell try: the unused division-by-zero argument is not demanded"
  print (try 0 (div 1 0))

  putStrLn "Equations and list patterns"
  print (fact 5)
  print (describe ([] :: [Bool]))
  print (describe [True])
  print (map' not [True, False, False])

  putStrLn "Closures and partial application"
  print (makeAdder 10 5)
  print (add3 1 2 3)
  print (map (add3 1 2) [3, 4, 5])

  putStrLn "A finite result demanded from an infinite list"
  print (take 3 (map square [1 ..]))

  putStrLn "Shape preview"
  print (area (Circle 2))
  print (area (Rectangle 3 4))
