module RepMin where

import Tree

minTrav :: Tree -> Int

minTrav (Leaf x) = x

minTrav (Bin l r) = min (minTrav l) (minTrav r)


repTrav :: Int -> Tree -> Tree

repTrav x (Leaf _) = Leaf x

repTrav x (Bin l r) = Bin (repTrav x l) (repTrav x r)


repMin :: Tree -> Tree

repMin t = t'
  where
    m = minTrav t
    t' = repTrav m t
