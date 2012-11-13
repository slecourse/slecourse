module RepMin where

import Tree

minAlg :: TreeAlgebra Int

minAlg = (id, min)


repAlg :: Int -> TreeAlgebra Tree

repAlg x = (const (Leaf x), Bin)


repMin :: Tree -> Tree

repMin t = t'
  where
    m = cataTree minAlg t
    t' = cataTree (repAlg m) t
