module RepMin where

import Tree

repMinTrav :: Tree -> (Int, Int -> Tree)

repMinTrav (Leaf x)
  = (x, \y -> Leaf y)

repMinTrav (Bin l r)
  = (min ml mr, \x -> Bin (tl x) (tr x))
    where
      (ml, tl) = repMinTrav l
      (mr, tr) = repMinTrav r


repMin :: Tree -> Tree

repMin t = t'
  where
    (m, f) = repMinTrav t
    t' = f m
