import Number
import Conversion

test
 = [ 
     n zero,
     n one,
     n two,
     n three,
     n four,
     n five,
     five'n'quarter    
   ]
 where
  n x = Number x None
  zero = OneBit Zero
  one = OneBit One
  two = MoreBits One zero
  three = MoreBits One one
  four = MoreBits One (MoreBits Zero zero)
  five = MoreBits One (MoreBits Zero one)
  five'n'quarter = Number five (Places (MoreBits Zero (OneBit One)))

eval x
 = do
      let y = evalNumber x
      putStr $ show x 
      putStr " --> " 
      putStr $ show y
      putStrLn ""

main 
 = do
      mapM_ eval test
