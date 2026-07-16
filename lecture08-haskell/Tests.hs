module Main (main) where

import Control.Monad (unless)
import Examples

assertEqual :: (Eq a, Show a) => String -> a -> a -> IO ()
assertEqual label expected actual =
  unless (expected == actual) $
    error (label ++ ": expected " ++ show expected ++ ", got " ++ show actual)

assertApprox :: String -> Double -> Double -> IO ()
assertApprox label expected actual =
  unless (abs (expected - actual) < 1e-10) $
    error (label ++ ": expected " ++ show expected ++ ", got " ++ show actual)

main :: IO ()
main = do
  assertEqual "an unused argument is not demanded" 1 (try 0 (div 1 0))
  assertEqual "try returns a demanded second argument" 7 (try 1 7)
  assertEqual "fact base case" 1 (fact 0)
  assertEqual "fact recursive case" 120 (fact 5)
  assertEqual "describe empty" "empty" (describe ([] :: [Bool]))
  assertEqual "describe nonempty" "nonempty" (describe [True])
  assertEqual "map'" [False, True, True] (map' not [True, False, False])
  assertEqual "makeAdder closure" 15 (makeAdder 10 5)
  assertEqual "add3 partial application" 6 ((add3 1) 2 3)
  assertEqual "partially applied add3 can be mapped" [6, 7, 8] (map (add3 1 2) [3, 4, 5])
  assertEqual "finite demand from an infinite list" [1, 4, 9] (take 3 (map square [1 ..]))
  assertApprox "circle area" (4 * pi) (area (Circle 2))
  assertApprox "rectangle area" 12 (area (Rectangle 3 4))
  putStrLn "All 13 checks passed."
