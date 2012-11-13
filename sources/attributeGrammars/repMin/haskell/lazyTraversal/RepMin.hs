module RepMin where

import Tree

repMinTrav :: Tree -> Int -> (Int, Tree)

repMinTrav (Leaf x) new
  = (x, Leaf new)

repMinTrav (Bin l r) new
  = (min ml mr, Bin tl tr)
    where
      (ml, tl) = repMinTrav l new
      (mr, tr) = repMinTrav r new


repMin :: Tree -> Tree

repMin t = t'
  where
    (m, t') = repMinTrav t m
