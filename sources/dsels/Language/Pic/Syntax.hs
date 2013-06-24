module Language.Pic.Syntax where

import Language.Pic.Common

data Cmd = Line' Point Point
         | Tri Point Int Int
         | Seq Cmd Cmd
