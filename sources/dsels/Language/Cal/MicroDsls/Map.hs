module Language.Cal.MicroDsls.Map where

data Map k v
  = Empty                 -- empty calendar
  | k :-> v               -- a single entry
  | Map k v :&: Map k v   -- composed calendar
