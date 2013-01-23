module Language.Cal.Domains.CalDT1 where

import Language.Cal.MicroDsls.Map
import Language.Cal.MicroDsls.Date
import Language.Cal.MicroDsls.Time

type CalDT a = Map (Date, Time) a
