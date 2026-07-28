{-# OPTIONS_GHC -fwarn-tabs #-}

module Examples
  ( Chain (..)
  , (.)
  , chainLength
  , compose
  , contains
  , countdown
  , firstChain
  , identity
  , mapChain
  , numberKind
  , oddSquares
  , safeQuotient
  , sumPositive
  , sumPositive'
  , tensAndOnes
  , twice
  , useDefault
  ) where

import Prelude hiding ((.))

-- Integer division and remainder are the numeric operations needed to split a
-- nonnegative integer at a decimal boundary.
tensAndOnes :: Integer -> (Integer, Integer)
tensAndOnes n = (n `div` 10, n `mod` 10)

-- Equations and guards are considered from top to bottom.
numberKind :: Integer -> String
numberKind n
  | n < 0     = "negative"
  | n == 0    = "zero"
  | even n    = "positive even"
  | otherwise = "positive odd"

-- This classroom example is intended for nonnegative inputs.
countdown :: Integer -> [Integer]
countdown 0 = []
countdown n = n : countdown (n - 1)

-- A parameterized, recursive algebraic data type.
data Chain a
  = End
  | Link a (Chain a)
  deriving (Eq, Show)

chainLength :: Chain a -> Int
chainLength End         = 0
chainLength (Link _ xs) = 1 + chainLength xs

-- Activity TODO 1: preserve the Chain shape while applying f to each element.
mapChain :: (a -> b) -> Chain a -> Chain b
mapChain = error "TODO: define mapChain"

-- Activity TODO 2: return Nothing for End and Just the first element for Link.
firstChain :: Chain a -> Maybe a
firstChain = error "TODO: define firstChain"

contains :: Eq a => a -> Chain a -> Bool
contains _      End         = False
contains target (Link x xs) = target == x || contains target xs

sumPositive :: [Integer] -> Integer
sumPositive [] = 0
sumPositive (x : xs)
  | x > 0     = x + sumPositive xs
  | otherwise = sumPositive xs

-- Haskell's (.) is the infix spelling of mathematical function composition.
-- Activity TODO 3: explicitly define the composition operator used below.
infixr 9 .

(.) :: (b -> c) -> (a -> b) -> a -> c
(.) = error "TODO: define (.)"

-- A named wrapper lets the checks exercise our custom operator unambiguously.
compose :: (b -> c) -> (a -> b) -> a -> c
compose = (.)

sumPositive' :: [Integer] -> Integer
sumPositive' = sum . filter (> 0)

oddSquares :: [Integer] -> [Integer]
oddSquares = map square . filter odd
  where
    square x = x * x

-- Activity TODO 4: define twice using (.), then add its most general signature.
twice _ = error "TODO: define twice"

safeQuotient :: Integer -> Integer -> Maybe Integer
safeQuotient _ 0 = Nothing
safeQuotient n d = Just (n `div` d)

useDefault :: a -> Maybe a -> a
useDefault fallback Nothing  = fallback
useDefault _        (Just x) = x

identity :: a -> a
identity x = x
