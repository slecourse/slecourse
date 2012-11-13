import Tree
import RepMin

test = Bin (Leaf 3) (Bin (Leaf 4) (Leaf 5))

main
 = do
      print test
      print $ repMin test     
