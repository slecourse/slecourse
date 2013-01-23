module Language.Cal.Domains.CalDT2 where

import Language.Cal.MicroDsls.Map
import Language.Cal.MicroDsls.Date
import Language.Cal.MicroDsls.Time

type CalT a = Map Time a
type CalD a = Map Date a
type Cal  a = CalD (CalT a)

week52 :: Cal String 
week52 =  ((D Dec 30) :-> (T 8 0 :-> "Work"))
      :&: ((D Dec 31) :-> (T 22 0 :-> "Party"))
