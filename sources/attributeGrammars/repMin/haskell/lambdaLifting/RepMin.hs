module RepMin where

import Tree

minAlg :: TreeAlgebra Int

minAlg = (id, min)


repAlg :: TreeAlgebra (Int -> Tree)

repAlg = (\x y -> Leaf y, \l r x -> Bin (l x) (r x))


repMin :: Tree -> Tree

repMin t = t'
 where
  m = cataTree minAlg t
  t' = cataTree repAlg t m
