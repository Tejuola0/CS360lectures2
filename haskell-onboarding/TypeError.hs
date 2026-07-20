module TypeError (addOffsetsToEach) where

import Studio (add3)

-- This definition deliberately has a type error. Load this file in GHCi, read
-- the error, and change only the right-hand side. Keep the call to add3 and use
-- both offsets so that every input value is increased by their sum.
addOffsetsToEach :: Int -> Int -> [Int] -> [Int]
addOffsetsToEach first second values = map (add3 first) values
