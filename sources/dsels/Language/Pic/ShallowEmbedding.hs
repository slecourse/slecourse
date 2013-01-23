module Language.Pic.ShallowEmbedding where

import Language.Pic.Domains

{-
-- A simple line function
line :: Point -> Point -> Pic
line = Line
-}

type KW = String 
from = "from"
to = "to"

-- A line function with extra notation and error checking
line :: KW -> Point -> KW -> Point -> Pic 
line "from" p "to" q = Line p q 
line "to" p "from" q = Line q p 
line _ _ _ _ = error "Incorrect keyword!"

triangle :: Point -> Int -> Int -> Pic 
triangle p@(x,y) w h =  Line p (x,y+h) 
                    :+: Line p (x+w,h)
                    :+: Line (x,y+h) (x+w,y)

seq :: Pic -> Pic -> Pic
seq = (:+:)
