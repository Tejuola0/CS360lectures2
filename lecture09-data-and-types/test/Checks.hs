module Main (main) where

import Control.Monad (unless)
import qualified Examples as E

assertEqual :: (Eq a, Show a) => String -> a -> a -> IO ()
assertEqual label expected actual =
  unless (expected == actual) $
    error (label ++ ": expected " ++ show expected ++ ", got " ++ show actual)

sample :: E.Chain Integer
sample = E.Link 4 (E.Link 7 E.End)

main :: IO ()
main = do
  assertEqual "div and mod" (13, 7) (E.tensAndOnes 137)
  assertEqual "ordered overlapping guards" "zero" (E.numberKind 0)
  assertEqual "equations and recursion" [3, 2, 1] (E.countdown 3)
  assertEqual "recursive ADT length" 2 (E.chainLength sample)
  assertEqual "map recursive ADT" (E.Link True (E.Link False E.End)) (E.mapChain even sample)
  assertEqual "safe first empty" (Nothing :: Maybe Integer) (E.firstChain E.End)
  assertEqual "safe first nonempty" (Just 4) (E.firstChain sample)
  assertEqual "Eq constraint present" True (E.contains 7 sample)
  assertEqual "Eq constraint absent value" False (E.contains 8 sample)
  assertEqual "recursive list function" 9 (E.sumPositive [-2, 4, 5])
  assertEqual "composed list function" 9 (E.sumPositive' [-2, 4, 5])
  assertEqual "explicit composition" (21 :: Integer) (E.compose (+ 1) (* 2) 10)
  assertEqual "list pipeline" [1, 9, 25] (E.oddSquares [1, 2, 3, 4, 5, 6])
  assertEqual
    "compose a function with itself"
    (12 :: Integer)
    (E.twice ((+ 1) :: Integer -> Integer) (10 :: Integer))
  assertEqual "Maybe missing" Nothing (E.safeQuotient 20 0)
  assertEqual "Maybe present" (Just 5) (E.safeQuotient 20 4)
  assertEqual "handle Maybe" 99 (E.useDefault 99 (E.safeQuotient 20 0))
  assertEqual "parametric identity" "types guide code" (E.identity "types guide code")
  putStrLn "All 18 checks passed."
