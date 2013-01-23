module Language.Cal.Domains.Cal where

import Language.Cal.MicroDsls.Map
import Language.Cal.MicroDsls.Time
import Language.Cal.MicroDsls.Appt

type Cal = Map Time Appt
