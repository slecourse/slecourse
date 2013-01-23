module Language.Cal.Syntax where

import Language.Cal.Domains.CalDT3
import Language.Cal.MicroDsls.Map
import Language.Cal.MicroDsls.Date
import Language.Cal.MicroDsls.Time

-- Various smart constructors

[jan,feb,mar,apr,may,jun,jul,aug,sep,oct,nov,dec] = map D [Jan .. Dec]
hours h = T h 0 
am h = hours h 
pm h = hours (h+12)
mins m = T 0 m
after t t' = t'+t

