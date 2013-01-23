module Language.Pic.DeepEmbedding where

import Language.Pic.Syntax
import Language.Pic.Domains

sem :: Cmd -> Pic 
sem (Line' p1 p2) = Line p1 p2 
sem (Tri p@(x,y) w h) =  Line p (x,y+h) 
                     :+: Line p (x+w,h)
                     :+: Line (x,y+h) (x+w,y) 
sem (Seq d d')	= sem d :+: sem d'
