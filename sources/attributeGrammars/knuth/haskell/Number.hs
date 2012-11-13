module Number where

-- Non-negative binary numbers with optional binary places
data Number = Number Bits Rest

-- Non-empty bit sequences
data Bits = OneBit Bit | MoreBits Bit Bits

-- Single bits
data Bit = Zero | One

-- Binary places, if any
data Rest = None | Places Bits

-- Show numbers in concrete syntax

instance Show Bit
 where
  show Zero = "0"
  show One = "1"

instance Show Bits
 where
  show (OneBit bit) = show bit
  show (MoreBits bit bits) = show bit ++ show bits

instance Show Number 
 where
  show (Number bits rest) = show bits ++ show rest

instance Show Rest 
 where
  show None = ""
  show (Places bits) = "." ++ show bits



