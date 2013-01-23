module Language.Cal.Domains.CalL where

import Language.Cal.MicroDsls.Map
import Language.Cal.MicroDsls.Time
import Language.Cal.MicroDsls.Date

type CalT a = Map Time a
type CalD a = Map Date a
type Cal  a = CalD (CalT a)
type CalL a = Cal (a, Time)
