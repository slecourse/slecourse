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
