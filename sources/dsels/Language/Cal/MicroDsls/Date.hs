module Language.Cal.MicroDsls.Date where

data Month = Jan | Feb | Mar | Apr | May | Jun | Jul | Aug | Sep | Oct | Nov | Dec 
  deriving (Eq, Show, Enum)
type Day = Int 
data Date = D Month Day
  deriving (Eq, Show)

instance Enum Date
  where
    -- Successors of dates
    -- Simplified implementation:
    --  * no handling of "end-of-year"
    --  * no coverage of leap years
    --  * no implementation of other Enum methods
    succ (D m d) = D m' d'
      where
        d' = d + 1 - (if d+1>days then days else 0)
        m' = if d+1>days then succ m else m
        days | m==Feb = 28
             | elem m [Jan,Mar,May,Jul,Aug,Oct,Dec] = 31
             | otherwise = 30
