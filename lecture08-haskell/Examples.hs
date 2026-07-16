module Examples
  ( Shape (..)
  , add3
  , area
  , describe
  , fact
  , makeAdder
  , map'
  , square
  , try
  ) where

-- Haskell does not demand the second argument when the first argument is zero.
try :: Integer -> Integer -> Integer
try a b = if a == 0 then 1 else b

-- Equations are tried from top to bottom.
fact :: Integer -> Integer
fact 0 = 1
fact n = n * fact (n - 1)

-- The empty and cons patterns distinguish the two possible list shapes.
describe :: [a] -> String
describe [] = "empty"
describe (_ : _) = "nonempty"

-- This is the same recursive shape as Scheme's map.
map' :: (a -> b) -> [a] -> [b]
map' _ [] = []
map' f (x : xs) = f x : map' f xs

-- The returned function closes over x.
makeAdder :: Int -> Int -> Int
makeAdder x = \y -> x + y

-- Supplying fewer than three arguments produces another function.
add3 :: Int -> Int -> Int -> Int
add3 x y z = x + y + z

square :: Integer -> Integer
square x = x * x

-- A small preview of algebraic data types and constructor patterns.
data Shape
  = Circle Double
  | Rectangle Double Double
  deriving (Eq, Show)

area :: Shape -> Double
area (Circle r) = pi * r * r
area (Rectangle w h) = w * h
