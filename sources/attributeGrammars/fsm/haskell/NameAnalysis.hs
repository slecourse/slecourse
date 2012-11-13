module NameAnalysis where

import Syntax
import Data.List (nub)

checkNames :: FSM -> Bool
checkNames (ss, ts)
 = statesOk && transitionsOk
  where
   statesOk = length (nub ss) == length ss
   transitionsOk = and (map transitionOk ts)
   transitionOk (from,to) = elem from ss && elem to ss
