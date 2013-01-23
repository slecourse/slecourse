{-# LANGUAGE LiberalTypeSynonyms #-}

module Language.Cal.Domains.CalDT3 where

import Language.Cal.MicroDsls.Map
import Language.Cal.MicroDsls.Date
import Language.Cal.MicroDsls.Time

type CalT a = Map Time a
type CalD a = Map Date a
type Cal  a = Compose CalD CalT a
type Compose s t a = s (t a)

week52 :: Cal String 
week52 =  ((D Dec 30) :-> (T 8 0 :-> "Work"))
      :&: ((D Dec 31) :-> (T 22 0 :-> "Party"))
