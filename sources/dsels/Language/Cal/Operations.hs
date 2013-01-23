module Language.Cal.Operations where

import Language.Cal.MicroDsls.Map
import Language.Cal.MicroDsls.Date
import Language.Cal.MicroDsls.Time
import Language.Cal.Syntax


-- Define "nonterminals" of interest

type Cal a = Map Date (Sched a)
type Sched a = CalT a 
type CalT a = Map Time a


-- Schedule shower and breakfast for a day

wakeAt :: Time -> Sched String 
wakeAt t =  (t :-> "Shower")
        :&: (mins 20 `after` t :-> "Breakfast")


-- Schedule shower and breakfast for all days

everyDay :: Date -> Sched a -> Cal a 
everyDay d s = foldr (\d c -> c :&: (d :-> s)) Empty [d..] 


-- Move some entry in the schedule

move :: Time -> Time -> Sched a -> Sched a 
move f t (l:&:r) =  move f t l :&: move f t r
move f t m@(u :-> a) = if f == u then t :-> a else m
