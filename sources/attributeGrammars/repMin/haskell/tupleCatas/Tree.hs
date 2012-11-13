module Tree where

data Tree = Leaf Int | Bin Tree Tree
 deriving (Show)

type TreeAlgebra a = (Int -> a, a -> a -> a)

cataTree :: TreeAlgebra a -> Tree -> a
cataTree alg@(leaf, _ ) (Leaf i)
 = leaf i
cataTree alg@(_ , bin) (Bin l r)
 = bin
       (cataTree alg l)
       (cataTree alg r)

tupleTree :: TreeAlgebra a -> TreeAlgebra b -> TreeAlgebra (a,b)

tupleTree (leaf1, bin1) (leaf2, bin2) 
  = (leaf, bin)
    where
      leaf i = (leaf1 i, leaf2 i)
      bin l r = (bin1 (fst l) (fst r), bin2 (snd l) (snd r))
