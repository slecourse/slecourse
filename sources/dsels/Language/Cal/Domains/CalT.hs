module Language.Cal.Domains.CalT where

import Language.Cal.MicroDsls.Map
import Language.Cal.MicroDsls.Time
import Language.Cal.MicroDsls.Appt

type CalT a = Map Time a
type Cal = CalT Appt

