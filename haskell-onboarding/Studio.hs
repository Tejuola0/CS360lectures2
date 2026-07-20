module Studio
  ( Temperature (..)
  , add3
  , incrementAll
  , keepPositive
  , toCelsius
  , adjustCelsius
  , adjustWhereCelsius
  , mergeBy
  ) where

-- Supplying one argument leaves a function that expects two more arguments.
add3 :: Int -> Int -> Int -> Int
add3 x y z = x + y + z

-- Checkpoint 1: replace the placeholder with two equations, one for [] and
-- one for (x : xs). Add 1 to every element and preserve the original order.
incrementAll :: [Int] -> [Int]
incrementAll = error "incrementAll not yet implemented"

-- Checkpoint 2: use equations, list patterns, and an if expression. Retain
-- only values greater than zero, in their original order.
keepPositive :: [Int] -> [Int]
keepPositive = error "keepPositive not yet implemented"

-- Checkpoint 3: constructors determine the possible shapes of a value.
data Temperature
  = Celsius Double
  | Fahrenheit Double
  deriving (Eq, Show)

-- Use one constructor pattern for each possible Temperature shape.
toCelsius :: Temperature -> Double
toCelsius = error "toCelsius not yet implemented"

-- Ready-track extension: convert every temperature, apply the supplied
-- adjustment, wrap the result as Celsius, and preserve order. This is not part
-- of the seven core checks.
adjustCelsius :: (Double -> Double) -> [Temperature] -> [Temperature]
adjustCelsius = error "adjustCelsius not yet implemented"

-- Bonus 1: use a predicate and an adjustment to transform selected values.
adjustWhereCelsius
  :: (Double -> Bool)
  -> (Double -> Double)
  -> [Temperature]
  -> [Temperature]
adjustWhereCelsius = error "adjustWhereCelsius not yet implemented"

-- Bonus 2: merge two ordered lists using a supplied ordering decision.
mergeBy :: (a -> a -> Bool) -> [a] -> [a] -> [a]
mergeBy = error "mergeBy not yet implemented"
