module Language.Pic.Domains where

import Language.Pic.Common

data Pic = Line Point Point
         | Circle Point Int
         | Pic :+: Pic
 deriving (Show)

ctr :: Point 
ctr = (3,2)

pic :: Pic 
pic =  Line (1,0) (5,3) 
   :+: Circle ctr 4
   :+: Circle ctr 5
