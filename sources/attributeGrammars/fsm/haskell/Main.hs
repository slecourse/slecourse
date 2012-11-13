import Syntax
import NameAnalysis

test = (["S1", "S2", "S3"], [("S1", "S2"), ("S2", "S1"), ("S2", "S3")])

main 
 = do
      print test
      print $ checkNames test
