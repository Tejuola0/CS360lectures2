module Main (main) where

import Control.Monad (unless)
import Studio

assertEqual :: (Eq a, Show a) => String -> a -> a -> IO ()
assertEqual label expected actual =
  unless (expected == actual) $
    error (label ++ ": expected " ++ show expected ++ ", got " ++ show actual)

main :: IO ()
main = do
  assertEqual "incrementAll empty" [] (incrementAll [])
  assertEqual "incrementAll values" [2, 0, 5] (incrementAll [1, -1, 4])
  assertEqual "keepPositive empty" [] (keepPositive [])
  assertEqual "keepPositive mixed" [3, 7] (keepPositive [-2, 3, 0, 7])
  assertEqual "keepPositive none" [] (keepPositive [-3, 0])
  assertEqual "Celsius is unchanged" 18 (toCelsius (Celsius 18))
  assertEqual "Fahrenheit is converted" 100 (toCelsius (Fahrenheit 212))
  putStrLn "All 7 studio checks passed."
