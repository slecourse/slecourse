module Language.Pic.Syntax where

type Point' = (Int, Int)

data Cmd = Line' Point' Point'
         | Tri Point' Int Int
         | Seq Cmd Cmd
