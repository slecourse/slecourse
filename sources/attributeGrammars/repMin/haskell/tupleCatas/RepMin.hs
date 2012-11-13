module RepMin where

import Tree

minAlg :: TreeAlgebra Int
minAlg = (id, min)

repAlg :: TreeAlgebra (Int -> Tree)
repAlg = (\x y -> Leaf y, \l r x -> Bin (l x) (r x))

repMinAlg :: TreeAlgebra (Int, Int -> Tree)
repMinAlg = tupleTree minAlg repAlg

repMin :: Tree -> Tree
repMin t = t'
  where
    (m, f) = cataTree repMinAlg t
    t' = f m
