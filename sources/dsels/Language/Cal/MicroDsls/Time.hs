module Language.Cal.MicroDsls.Time where

type Hour = Int 
type Minute = Int 
data Time = T Hour Minute
  deriving (Show, Eq)

instance Num Time 
  where
    -- Addition of times
    -- Simplified implementation:
    --  * no coverage of modulo 24h 
    --  * no implementation of other Num methods
    (T h m) + (T h' m') = T h'' m''
      where
        h'' = h + h' + if (m+m'>59) then 1 else 0
        m'' = m + m' - if (m+m'>60) then 60 else 0
