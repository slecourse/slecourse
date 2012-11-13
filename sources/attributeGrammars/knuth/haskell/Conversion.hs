module Conversion where

import Number

evalNumber :: Number -> Float
evalNumber (Number bits rest)
  = val0
    where
      (len1, val1) = evalBits bits pos1
      pos1 = len1 - 1
      val2 = evalRest rest
      val0 = val1 + val2

evalBits :: Bits -> Int -> (Int, Float)
evalBits (OneBit bit) pos
  = (1, evalBit bit pos)
evalBits (MoreBits bit bits) pos0
  = (len0, val0)
    where
      val1 = evalBit bit pos0
      (len1, val2) = evalBits bits pos1
      pos1 = pos0 - 1
      len0 = len1 + 1
      val0 = val1 + val2

evalBit :: Bit -> Int -> Float
evalBit Zero _pos = 0 
evalBit One pos = 2 ^^ pos

evalRest :: Rest -> Float
evalRest None = 0
evalRest (Places bits) 
  = val
    where
      (_len, val) = evalBits bits pos
      pos = -1
